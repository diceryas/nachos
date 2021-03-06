// addrspace.cc 
//	Routines to manage address spaces (executing user programs).
//
//	In order to run a user program, you must:
//
//	1. link with the -N -T 0 option 
//	2. run coff2noff to convert the object file to Nachos format
//		(Nachos object code format is essentially just a simpler
//		version of the UNIX executable object code format)
//	3. load the NOFF file into the Nachos file system
//		(if you haven't implemented the file system yet, you
//		don't need to do this last step)
//
// Copyright (c) 1992-1993 The Regents of the University of California.
// All rights reserved.  See copyright.h for copyright notice and limitation 
// of liability and disclaimer of warranty provisions.

#include "copyright.h"
#include "system.h"
#include "addrspace.h"

#ifdef HOST_SPARC
#include <strings.h>
#endif

//----------------------------------------------------------------------
// SwapHeader
// 	Do little endian to big endian conversion on the bytes in the 
//	object file header, in case the file was generated on a little
//	endian machine, and we're now running on a big endian machine.
//----------------------------------------------------------------------

static void 
SwapHeader (NoffHeader *noffH)
{
	noffH->noffMagic = WordToHost(noffH->noffMagic);
	noffH->code.size = WordToHost(noffH->code.size);
	noffH->code.virtualAddr = WordToHost(noffH->code.virtualAddr);
	noffH->code.inFileAddr = WordToHost(noffH->code.inFileAddr);
	noffH->initData.size = WordToHost(noffH->initData.size);
	noffH->initData.virtualAddr = WordToHost(noffH->initData.virtualAddr);
	noffH->initData.inFileAddr = WordToHost(noffH->initData.inFileAddr);
	noffH->uninitData.size = WordToHost(noffH->uninitData.size);
	noffH->uninitData.virtualAddr = WordToHost(noffH->uninitData.virtualAddr);
	noffH->uninitData.inFileAddr = WordToHost(noffH->uninitData.inFileAddr);
}


void
AddrSpace::WriteFileToSwap(OpenFile *executable,NoffHeader noffH){
	OpenFile *swap=fileSystem->Open(swapname);
	if (noffH.code.size > 0){
		DEBUG('a', "Initializing code segment");
		char *tmp=new char[noffH.code.size];
		executable->ReadAt(tmp, noffH.code.size, noffH.code.inFileAddr);
		swap->WriteAt(tmp,noffH.code.size, noffH.code.virtualAddr);
		delete []tmp;
	}
		
	if (noffH.initData.size > 0){
		DEBUG('a', "Initializing initData segment");
		char *tmp=new char[noffH.initData.size];
		executable->ReadAt(tmp, noffH.initData.size, noffH.initData.inFileAddr);
		swap->WriteAt(tmp,noffH.initData.size,noffH.initData.virtualAddr);
		delete []tmp;		
	}
	delete swap;
}

void AddrSpace::WriteAllBack(){
	OpenFile*swap=fileSystem->Open(swapname);
	for(unsigned int i=0; i<numPages; ++i){
		if(pageTable[i].valid){
			pageTable[i].valid=false;
			machine->phyState[pageTable[i].physicalPage].pageUsedThread=-1;
			if(pageTable[i].dirty)
				swap->WriteAt(&(machine->mainMemory[pageTable[i].physicalPage*PageSize]), PageSize, i*PageSize);
		}
	}
	delete swap;
}

//----------------------------------------------------------------------
// AddrSpace::AddrSpace
// 	Create an address space to run a user program.
//	Load the program from a file "executable", and set everything
//	up so that we can start executing user instructions.
//
//	Assumes that the object code file is in NOFF format.
//
//	First, set up the translation from program memory to physical 
//	memory.  For now, this is really simple (1:1), since we are
//	only uniprogramming, and we have a single unsegmented page table
//
//	"executable" is the file containing the object code to load into memory
//----------------------------------------------------------------------

AddrSpace::AddrSpace(OpenFile *executable)
{
    NoffHeader noffH;
    unsigned int i, size;

    executable->ReadAt((char *)&noffH, sizeof(noffH), 0);
    if ((noffH.noffMagic != NOFFMAGIC) && 
		(WordToHost(noffH.noffMagic) == NOFFMAGIC))
    	SwapHeader(&noffH);
    ASSERT(noffH.noffMagic == NOFFMAGIC);

// how big is address space?
    size = noffH.code.size + noffH.initData.size + noffH.uninitData.size 
			+ UserStackSize;	// we need to increase the size
						// to leave room for the stack
    numPages = divRoundUp(size, PageSize);
    size = numPages * PageSize;
/*lab4 exercise6-7*/
   /* ASSERT(numPages <= NumPhysPages);		// check we're not trying
						// to run anything too big --
						// at least until we have
						// virtual memory

    DEBUG('a', "Initializing address space, num pages %d, size %d\n", 
					numPages, size);
// first, set up the translation 
    pageTable = new TranslationEntry[numPages];
    for (i = 0; i < numPages; i++) {
	pageTable[i].virtualPage = i;	// for now, virtual page # = phys page #
	//pageTable[i].physicalPage = i;
	pageTable[i].physicalPage = machine->memoryBitMap->Find();
	machine->pageUsed[pageTable[i].physicalPage]=currentThread->getName();
	ASSERT(pageTable[i].physicalPage!=-1);
	printf("***%s: virtualPage %d, physicalPage %d is allocated.\n",currentThread->getName(),i,pageTable[i].physicalPage);
	interrupt->OneTick();
	pageTable[i].valid = TRUE;
	pageTable[i].use = FALSE;
	pageTable[i].dirty = FALSE;
	pageTable[i].readOnly = FALSE;  // if the code segment was entirely on 
					// a separate page, we could set its 
					// pages to be read-only
    }*/

	

  
// zero out the entire address space, to zero the unitialized data segment 
// and the stack segment
   /* bzero(machine->mainMemory, size);

// then, copy in the code and data segments into memory
    if (noffH.code.size > 0) {
        DEBUG('a', "Initializing code segment, at 0x%x, size %d\n", 
			noffH.code.virtualAddr, noffH.code.size);
        executable->ReadAt(&(machine->mainMemory[noffH.code.virtualAddr]),
			noffH.code.size, noffH.code.inFileAddr);
    }
    if (noffH.initData.size > 0) {
        DEBUG('a', "Initializing data segment, at 0x%x, size %d\n", 
			noffH.initData.virtualAddr, noffH.initData.size);
        executable->ReadAt(&(machine->mainMemory[noffH.initData.virtualAddr]),
			noffH.initData.size, noffH.initData.inFileAddr);
    }*/
   /* if (noffH.code.size > 0) {
        DEBUG('a', "Initializing code segment, at 0x%x, size %d\n", 
			noffH.code.virtualAddr, noffH.code.size);
	int code_pos = noffH.code.inFileAddr;
	for(int j=0; j<noffH.code.size;j++){
		int vpn_tmp = (noffH.code.virtualAddr+j)/PageSize;
		int offset_tmp = (noffH.code.virtualAddr+j)%PageSize;
		int paddr = pageTable[vpn_tmp].physicalPage*PageSize+offset_tmp;
        	executable->ReadAt(&(machine->mainMemory[paddr]),
			1, code_pos++);
	}
    }
    if (noffH.initData.size > 0) {
        DEBUG('a', "Initializing data segment, at 0x%x, size %d\n", 
			noffH.initData.virtualAddr, noffH.initData.size);
        int data_pos = noffH.initData.inFileAddr;
	for(int j=0; j<noffH.initData.size;j++){
		int vpn_tmp = (noffH.initData.virtualAddr+j)/PageSize;
		int offset_tmp = (noffH.initData.virtualAddr+j)%PageSize;
		int paddr = pageTable[vpn_tmp].physicalPage*PageSize+offset_tmp;
        	executable->ReadAt(&(machine->mainMemory[paddr]),
			1, data_pos++);
	}
    }*/
/*lab4 exercise6-7*/
    char *tempname=currentThread->getName();
    int len=strlen(tempname),j;    
    swapname=new char[len+6];
    for(j=0; j<len; j++)
    	swapname[j]=tempname[j];
    swapname[j]='.';
    swapname[j+1]='s';
    swapname[j+2]='w';    
    swapname[j+3]='a';    
    swapname[j+4]='p';    
    swapname[j+5]='\0';
    fileSystem->Create(swapname,size);

    DEBUG('a', "Initializing address space, num pages %d, size %d\n",
          numPages, size);
    // first, set up the translation
    pageTable = new TranslationEntry[numPages];

    for (i = 0; i < numPages; i++) {
        pageTable[i].valid = FALSE;              
        pageTable[i].readOnly = FALSE;  // if the code segment was entirely on
    }

    OpenFile *swap=fileSystem->Open(swapname);
    if (noffH.code.size > 0){
	DEBUG('a', "Initializing code segment");
	char *temp=new char[noffH.code.size];
	executable->ReadAt(temp, noffH.code.size, noffH.code.inFileAddr);
	swap->WriteAt(temp,noffH.code.size, noffH.code.virtualAddr);
	delete []temp;
    }
		
    if (noffH.initData.size > 0){
        DEBUG('a', "Initializing initData segment");
	char *temp=new char[noffH.initData.size];
	executable->ReadAt(temp, noffH.initData.size, noffH.initData.inFileAddr);
	swap->WriteAt(temp,noffH.initData.size,noffH.initData.virtualAddr);
	delete []temp;		
    }
    delete swap;
}

//----------------------------------------------------------------------
// AddrSpace::~AddrSpace
// 	Dealloate an address space.  Nothing for now!
//----------------------------------------------------------------------

AddrSpace::~AddrSpace()
{
 /*lab4 exercise6-7*/
   for(unsigned int i=0; i<numPages; ++i){
    	if(!pageTable[i].valid)	continue;
    	machine->phyState[pageTable[i].physicalPage].pageUsedThread = -1;
    }
    fileSystem->Remove(swapname);
/*lab4 exercise6-7*/  	
    delete [] pageTable;
}

//----------------------------------------------------------------------
// AddrSpace::InitRegisters
// 	Set the initial values for the user-level register set.
//
// 	We write these directly into the "machine" registers, so
//	that we can immediately jump to user code.  Note that these
//	will be saved/restored into the currentThread->userRegisters
//	when this thread is context switched out.
//----------------------------------------------------------------------

void
AddrSpace::InitRegisters()
{
    int i;

    for (i = 0; i < NumTotalRegs; i++)
	machine->WriteRegister(i, 0);

    // Initial program counter -- must be location of "Start"
    machine->WriteRegister(PCReg, 0);	

    // Need to also tell MIPS where next instruction is, because
    // of branch delay possibility
    machine->WriteRegister(NextPCReg, 4);

   // Set the stack register to the end of the address space, where we
   // allocated the stack; but subtract off a bit, to make sure we don't
   // accidentally reference off the end!
    machine->WriteRegister(StackReg, numPages * PageSize - 16);
    DEBUG('a', "Initializing stack register to %d\n", numPages * PageSize - 16);
}

//----------------------------------------------------------------------
// AddrSpace::SaveState
// 	On a context switch, save any machine state, specific
//	to this address space, that needs saving.
//
//	For now, nothing!
//----------------------------------------------------------------------

void AddrSpace::SaveState() 
{
     for(int i=0; i<TLBSize; ++i){
	//machine->tlb[i].valid=false;
     }
}

//----------------------------------------------------------------------
// AddrSpace::RestoreState
// 	On a context switch, restore the machine state so that
//	this address space can run.
//
//      For now, tell the machine where to find the page table.
//----------------------------------------------------------------------

void AddrSpace::RestoreState() 
{
    machine->pageTable = pageTable;
    machine->pageTableSize = numPages;
    /*lab4 exercise6-7*/
    for(unsigned int i=0; i<numPages; ++i){
	if(!pageTable[i].valid)	continue;
	int tmp=machine->phyState[pageTable[i].physicalPage].pageUsedThread;
	if(tmp != currentThread->getThreadId()){
		pageTable[i].valid=false;
		pageTable[i].dirty=false;
	}
    }

   /*lab4 exercise6-7*/
}
