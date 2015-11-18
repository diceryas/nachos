// threadtest.cc 
//	Simple test case for the threads assignment.
//
//	Create two threads, and have them context switch
//	back and forth between themselves by calling Thread::Yield, 
//	to illustratethe inner workings of the thread system.
//
// Copyright (c) 1992-1993 The Regents of the University of California.
// All rights reserved.  See copyright.h for copyright notice and limitation 
// of liability and disclaimer of warranty provisions.

#include "copyright.h"
#include "system.h"
#include "synch.h"

// testnum is set in main.cc
int testnum = 1;
const char* charStatus[]={"JUST_CREATED", "RUNNING", "READY", "BLOCKED"};

Thread *threadptr[maxThread];
//int count;

//----------------------------------------------------------------------
// SimpleThread
// 	Loop 5 times, yielding the CPU to another ready thread 
//	each iteration.
//
//	"which" is simply a number identifying the thread, for debugging
//	purposes.
//----------------------------------------------------------------------

void
SimpleThread(int which)
{
    int num;
    
    for (num = 0; num < 5; num++) {
        currentThread->setThreadId();
	printf("*** thread %d threadid %d userid %d looped %d times\n", which, currentThread->getThreadId(),currentThread->getUserId(),num);
        currentThread->Yield();
    }
}

//----------------------------------------------------------------------
// ThreadTest1
// 	Set up a ping-pong between two threads, by forking a thread 
//	to call SimpleThread, and then calling SimpleThread ourselves.
//----------------------------------------------------------------------

void
ThreadTest1()
{
    DEBUG('t', "Entering ThreadTest1");

    Thread *t = new Thread("forked thread",0);

    t->Fork(SimpleThread, 1);
    SimpleThread(0);
}

void ThreadTest2()
{
    DEBUG('t', "Entering ThreadTest1"); 
    for(int i=1;i<132;i++)
    {
       //  printf("hello\n");
    	Thread *t = new Thread("forked thread",0);
	if(t->getThreadId()==0)  continue;
	printf("*** thread_name %s userid %d threadid %d\n", t->getName(),t->getUserId(), t->getThreadId());
    }
}
void helloworld(int arg){

}

void TS()
{
     DEBUG('t', "Entering ThreadTest1");
     //threadptr[count++]=currentThread; 
     Thread *t1 = new Thread("fork1",0);
     //threadptr[count++]=t1;
     Thread *t2 = new Thread("fork2",0);
     //threadptr[count++]=t2;
     Thread *t3 = new Thread("fork3",0);
     //threadptr[count++]=t3;
     t1->Fork(helloworld,0);
     t2->Fork(helloworld,0);
     //t3->Fork(helloworld,0);
     for(int i=0;i<threadCount;i++){
     printf("*** thread_name %s userid %d threadid %d status %s\n", threadptr[i]->getName(),threadptr[i]->getUserId(), threadptr[i]->getThreadId(),charStatus[threadptr[i]->getStatus()]);}
    
}
bool flags=true;
void printinfo(int arg){
   int num;
   for (num = 0; num < 5; num++) {
        currentThread->setThreadId();
	printf("*** threadid %d userid %d priority %d looped %d times\n",  currentThread->getThreadId(),currentThread->getUserId(),currentThread->getPriority(),num);
	currentThread->Yield();
   }
}
   

void ThreadTest3()
{
     DEBUG('t', "Entering ThreadTest1");
     Thread *t1 = new Thread("fork1",4);
     Thread *t2 = new Thread("fork2",2);
     Thread *t3 = new Thread("fork3",6);
     t1->Fork(printinfo,0);
     t2->Fork(printinfo,0);
     t3->Fork(printinfo,0);
}


/*threadtest.cc*/
Semaphore* producer00 = new Semaphore("producer", 10);
Semaphore* customer00 = new Semaphore("customer", 0);
Semaphore* lock = new Semaphore("lock", 1);
int empty;
int full;

void producer0(int which)
{
	producer00->P();
	lock->P();
	empty = producer00->getValue();
	full = customer00->getValue();
	printf("producer %d full is %d. empty is %d\n", currentThread->getThreadId(), full, empty);
	lock->V();
	customer00->V();
	currentThread->Yield();
}

void customer0(int which)
{
	customer00->P();
	lock->P();
	empty = producer00->getValue();
	full = customer00->getValue();
	printf("customer %d full is %d. empty is %d\n", currentThread->getThreadId(), full, empty);
	lock->V();
	producer00->V();
	currentThread->Yield();
}

void ThreadTest4()
{
	DEBUG('t', "Entering ThreadTest3");
	Thread *t1 = new Thread("one",2);
	Thread *t2 = new Thread("two",3);
	t1->Fork(helloworld, 1);
	t2->Fork(helloworld, 2);
	producer0(1);
	producer0(1);
	producer0(1);
	customer0(1);
	customer0(1);
	customer0(1);
	customer0(1);
	customer0(1);
	customer0(1);
}


/*second test*/
Monitor_Pro *monitor = new Monitor_Pro();
Lock* mutex = new Lock("mutex");

void producer1(int which)
{
	monitor->Produce_insert(mutex, which);
	printf("%s thread, produce %d\n", currentThread->getName(), which);
}

void customer1(int which)
{
	int consume = monitor->Consumer_remove(mutex);
	printf("%s thread, consume %d\n", currentThread->getName(), consume);
}
//----------------------------------------------------------------------
// ThreadTest
// 	Invoke a test routine.
//----------------------------------------------------------------------

void ThreadTest5()
{
	DEBUG('t', "Entering ThreadTest3");
	Thread *t1 = new Thread("one",2);
	Thread *t2 = new Thread("two",3);
	t1->Fork(helloworld, 1);
	t2->Fork(helloworld, 2);
	producer1(1);
	producer1(2);
	producer1(3);
	producer1(4);
	producer1(5);
	customer1(1);
	producer1(6);
	
	customer1(1);
	customer1(1);
	customer1(1);
	customer1(1);
	customer1(1);
}

ReadWriteLock* rwLock=new ReadWriteLock("rwLock");
int buffer3=5;
void Writer(int tid)
{
	rwLock->WriteLock();
	sleep(1);
	buffer3=buffer3+10;
	printf("threadID: %d, Writer reads the buffer,%d\n", tid, buffer3);
	rwLock->WriteUnlock();
}

void Reader(int tid)
{
	sleep(1);
	rwLock->ReadLock();
	printf("threadID: %d, Reader reads the buffer, %d\n",tid, buffer3);
	rwLock->ReadUnlock();
}

void ThreadTest6()
{
	Thread* t[7];
	for(int i=0;i<7;i++)
	{
		t[i]=new Thread("fork",i+1);
	}
	t[0]->Fork(Reader,0);
	t[1]->Fork(Writer,1);
	t[2]->Fork(Reader,2);
	t[3]->Fork(Reader,3);
	t[4]->Fork(Writer,4);
	t[6]->Fork(Reader,8);
	t[5]->Fork(Writer,7);
}


void
ThreadTest()
{
    switch (testnum) {
    case 1:
	ThreadTest1();
	break;
    case 2:
	TS();
	break;
    case 3:
	ThreadTest2();
	break;
    case 4:
        ThreadTest4();
	break;
    case 5:
        ThreadTest5();
	break;
    case 6:
	ThreadTest6();
	break;
    default:
	printf("No test specified.\n");
	break;
    }
}


