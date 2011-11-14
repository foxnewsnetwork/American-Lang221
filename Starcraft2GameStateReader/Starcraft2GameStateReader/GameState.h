#pragma once
class CGameState
{
public:
	CGameState(void);
	virtual ~CGameState(void);
protected:
	// The amount offset for a given player
	DWORD playerOffset;
	
	// The amount of offset required for th first unit
	DWORD unitOffset;
};

