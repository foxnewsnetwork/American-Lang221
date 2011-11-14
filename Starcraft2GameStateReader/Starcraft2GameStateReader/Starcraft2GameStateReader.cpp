// Starcraft2GameStateReader.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"



int _tmain(int argc, _TCHAR* argv[])
{
	// Change the below value 
	DWORD offset = 0x26A6EC0;
	DWORD offset2 = 0x26AFEBE; // or 0x26A711E
	Player myplayer;
	Unit myunit;
	HANDLE sc2proc = OpenProcess(PROCESS_ALL_ACCESS, FALSE, 0x000015F0);
	
	if(sc2proc == NULL)
	{
		std::cout << "Failed to open process" << std::endl;
		return -1;		
	}

	SIZE_T bytesRead;
	BOOL result;
	int size_temp = sizeof(myunit);

	// result = ReadProcessMemory(sc2proc, (void*)(offset), (void*)&myplayer, sizeof(myplayer), &bytesRead);
	result = ReadProcessMemory(sc2proc, (void*)(offset2), (void*)&myunit, sizeof(myunit), &bytesRead);
	
	if(result == FALSE || bytesRead != 468)
		return -2;

	std::cout << "Player 1 has " << myplayer.mineralsCurrent << "minerals." << std::endl;
	CloseHandle(sc2proc);
	return 0;
}

