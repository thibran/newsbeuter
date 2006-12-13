#include <thread.h>
#include <exception.h>

using namespace noos;

thread::thread() { }

thread::~thread() { }

void thread::start() {
	int rc = pthread_create(&pt, 0, (void *(*)(void*))thread::run_thread, this);
	if (rc != 0) {
		throw exception(rc);
	}
}

void thread::join() {
	pthread_join(pt, NULL);
}

void thread::exit() {
	pthread_exit(NULL);
}

void thread::detached_exit() {
	pthread_detach(pt);
	this->exit();	
}

void * thread::run_thread(thread * p) {
	thread * t = p;
	t->run();
	return 0;
}