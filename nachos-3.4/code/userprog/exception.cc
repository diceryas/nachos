// exception.cc 
//	Entry point into the Nachos kernel from user programs.
//	There are two kinds of things that can cause control to
//	transfer back to here from user code:
//
//	syscall -- The user code explicitly requests to call a procedure
//	in the Nachos kernel.  Right now, the only function we support is
//	"Halt".
//
//	exceptions -- The user code does something that the CPU can't handle.
//	For instance, accessing memory that doesn't exist, arithmetic errors,
//	etc.  
//
//	Interrupts (which can also cause control to transfer from user
//	code into the Nachos kernel) are handled elsewhere.
//
// For now, this only handles the Halt() system call.
// Everything else core dumps.
//
// Copyright (c) 1992-1993 The Regents of the University of California.
// All rights reserved.  See copyright.h for copyright notice and limitation 
// of liability and disclaimer of warranty provisions.

#include "copyright.h"
#include "system.h"
#include "syscall.h"

//----------------------------------------------------------------------
// ExceptionHandler
// 	Entry point into the Nachos kernel.  Called when a user program
//	is executing, and either does a syscall, or generates an addressing
//	or arithmetic exception.
//
// 	For system calls, the following is the calling convention:
//
// 	system call code -- r2
//		arg1 -- r4
//		arg2 -- r5
//		arg3 -- r6
//		arg4 -- r7
//
//	The result of the system call, if any, must be put back into r2. 
//
// And don't forget to increment the pc before returning. (Or else you'll
// loop making the same system call forever!
//
//	"which" is the kind of exception.  The list of possible exceptions 
//	are in machine.h.
//----------------------------------------------------------------------
/**lab4 exercise6-7*/
/*lab4 exercise6-7*/

void
ExceptionHandler(ExceptionType which)
{
    int type = machine->ReadRegister(2);
    if ((which == SyscallException) && (type == SC_Exit)){
	printf("thread exited...\n");
	for(int i=0;i<1024;i++){
		if(machine->memoryBitMap->Test(i)&&currentThread->getName()==machine->pageUsed[i])
		{
			machine->memoryBitMap->Clear(i);
			printf("***physicalPage %d of %s is cleared!!!\n",i,currentThread->getName());
			machine->pageUsed[i]=0;
		}
	}
	currentThread->Finish();
    }
    if ((which == SyscallException) && (type == SC_Halt)) {
	DEBUG('a', "Shutdown, initiated by user program.\n");
   	interrupt->Halt();
    }
    else if(which == TLBMissException){
	if(machine->tlb == NULL){
		printf("the exception is %d\n",which);
		ASSERT(FALSE);
	}
	else{
		machine->TLBmissFunc();
	}
    } 
    else if(which == PageFaultException){
	int virtual_addr=machine->ReadRegister(BadVAddrReg);
	printf("***%s: pageFault!!!\n",currentThread->getName());
	machine->Pagefault(virtual_addr);
       
    }
    else {
	printf("Unexpected user mode exception %d %d\n", which, type);
	//currentThread->Finish();	
	ASSERT(FALSE);
    }
}
