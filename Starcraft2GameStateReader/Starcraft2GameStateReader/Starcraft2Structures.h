#pragma once

// PLayer table data
class Player;
class raceData;
class raceData2;

// Unit table data
class Unit;
class UnitAbilities;
class UnitModel;
class Abil;

class ClassType;
class ClassTypeInfo;
class ClassTypeInfoName;
class AbilQueue;
class QueueSlots;
class QueueSlot;
class CAbilBuildable;
class AbilHeader;
class UnitAbilities;

// Player table data
class Player
{
public:
	__int8 status; //0x0000  
		char unknown1[7]; //0x0001
	__int32 cameraX; //0x0008  
	__int32 cameraY; //0x000C  
	__int32 cameraDistance; //0x0010  
	__int32 cameraAngleOfAttack; //0x0014  
	__int32 cameraRotation; //0x0018  
	__int8 team; //0x001C  
	__int8 playerType; //0x001D  
	__int8 playingStatus; //0x001E  
		char unknown31[8]; //0x001F
	__int8 difficulty; //0x0027  
		char unknown40[20]; //0x0028
	__int32 timeSinceResourceChanged; //0x003C  
	__int32 nameLength; //0x0040  
		char unknown68[4]; //0x0044
	char name[32]; //0x0048  
		char unknown104[48]; //0x0068
	raceData* raceData; //0x0098  
		char unknown156[4]; //0x009C
	__int32 slotNumber; //0x00A0  
	__int32 supplyLimit; //0x00A4  
	__int32 credits; //0x00A8  
		char unknown172[76]; //0x00AC
	__int32 attackMultiplier; //0x00F8  
	__int32 damageMultiplier; //0x00FC  
		char unknown256[328]; //0x0100
	__int32 actionsTotal; //0x0248  
		char unknown588[36]; //0x024C
	__int32 apmCurrent; //0x0270  
		char unknown628[28]; //0x0274
	__int32 ID0397B808; //0x0290 kill streak? 
		char unknown660[4]; //0x0294
	__int32 ID0397B008; //0x0298 unit count? 
		char unknown668[4]; //0x029C
	__int32 unitsKilled; //0x02A0  
		char unknown676[4]; //0x02A4
	__int32 unitsLost; //0x02A8  
		char unknown684[4]; //0x02AC
	__int32 unitsBetrayed; //0x02B0  
		char unknown692[20]; //0x02B4
	__int32 ID0397B508; //0x02C8 unit count? 
		char unknown716[236]; //0x02CC
	__int32 harvesters_current; //0x03B8  
		char unknown956[12]; //0x03BC
	__int32 harvesters_built; //0x03C8  
		char unknown972[28]; //0x03CC
	__int32 building_queue_length; //0x03E8  
		char unknown1004[4]; //0x03EC
	__int32 buildings_constructing; //0x03F0  
		char unknown1012[4]; //0x03F4
	__int32 buildings_current; //0x03F8  
		char unknown1020[4]; //0x03FC
	__int32 total_constructing_queue_length; //0x0400  
		char unknown1028[4]; //0x0404
	__int32 total_constructing; //0x0408  
		char unknown1036[4]; //0x040C
	__int32 army_size; //0x0410  
		char unknown1044[84]; //0x0414
	__int32 supplyCap; //0x0468  
		char unknown1132[4]; //0x046C
	__int32 supplyCurrent; //0x0470  
		char unknown1140[36]; //0x0474
	__int32 mineralsCurrent; //0x0498  
		char unknown1180[4]; //0x049C
	__int32 vespeneCurrent; //0x04A0  
		char unknown1188[4]; //0x04A4
	__int32 terrazineCurrent; //0x04A8  
		char unknown1196[4]; //0x04AC
	__int32 customCurrent; //0x04B0  
		char unknown1204[4]; //0x04B4
	__int32 mineralsTotal; //0x04B8  
		char unknown1212[4]; //0x04BC
	__int32 vespeneTotal; //0x04C0  
		char unknown1220[4]; //0x04C4
	__int32 terrazineTotal; //0x04C8  
		char unknown1228[4]; //0x04CC
	__int32 customTotal; //0x04D0  
		char unknown1236[68]; //0x04D4
	__int32 mineralsRate; //0x0518  
		char unknown1308[4]; //0x051C
	__int32 vespeneRate; //0x0520  
		char unknown1316[4]; //0x0524
	__int32 terrazineRate; //0x0528  
		char unknown1324[4]; //0x052C
	__int32 customRate; //0x0530  
		char unknown1332[4]; //0x0534
	__int32 slowMineralsCurrent; //0x0538  
		char unknown1340[4]; //0x053C
	__int32 slowVespeneCurrent; //0x0540  
		char unknown1348[4]; //0x0544
	__int32 slowTerrazineCurrent; //0x0548  
		char unknown1356[4]; //0x054C
	__int32 slowCustomCurrent; //0x0550  
		char unknown1364[44]; //0x0554
	__int32 units_lost_minerals_worth; //0x0580  
		char unknown1412[4]; //0x0584
	__int32 buildings_lost_minerals_worth; //0x0588  
		char unknown1420[4]; //0x058C
	__int32 buildings_lost_vespene_worth; //0x0590  
		char unknown1428[12]; //0x0594
	__int32 units_lost_vespene_worth; //0x05A0  
		char unknown1444[820]; //0x05A4
};//Size=0x08D8(2264)

class raceData
{
public:
		char unknown0[4]; //0x0000
	raceData2* ID05442D90; //0x0004  
};//Size=0x0008(8)
 
class raceData2
{
public:
		char unknown0[8]; //0x0000
	char race[4]; //0x0008  
};//Size=0x000C(12)

// Unit Table
class Unit
{
public:
	WORD times_used; //0x0000  
	WORD id; //0x0002  
	WORD previous_id; //0x0004  
	WORD next_id; //0x0006  
	__int32 model; //0x0008  
		char unknown12[21]; //0x000C
	__int8 ID03A3BF50; //0x0021  
	__int8 ID03A3BED0; //0x0022  
	__int8 ID03A3BE50; //0x0023  
		char unknown36[3]; //0x0024
	__int8 playerOwner; //0x0027  
		char unknown40[1]; //0x0028
	__int8 isAlive; //0x0029  
		char unknown42[4]; //0x002A
	__int8 isPaused; //0x002E  
		char unknown47[3]; //0x002F
	__int16 kills; //0x0032  
	__int8 playerOwner2; //0x0034  
	__int8 playerOwner3; //0x0035  
		char unknown54[10]; //0x0036
	__int32 positionX; //0x0040  
	__int32 positionY; //0x0044  
	__int32 positionZ; //0x0048  
		char unknown76[8]; //0x004C
	__int32 rotationX; //0x0054  
	__int32 rotationY; //0x0058  
	__int32 rotation; //0x005C  
		char unknown96[20]; //0x0060
	__int32 destinationX; //0x0074  
	__int32 destinationY; //0x0078  
	__int32 destinationZ; //0x007C  
		char unknown128[4]; //0x0080
	__int32 lastOrder; //0x0084  
	__int32 destinationX2; //0x0088  
	__int32 destinationY2; //0x008C  
	__int32 startPositionX; //0x0090  
	__int32 startPositionY; //0x0094  
	__int32 destinationX3; //0x0098  
	__int32 destinationY3; //0x009C  
	__int32 startPosition2X; //0x00A0  
	__int32 startPosition2Y; //0x00A4  
		char unknown168[16]; //0x00A8
	__int32 moveSpeed; //0x00B8  
		char unknown188[8]; //0x00BC
	__int32 commandQueue; //0x00C4  
		char unknown200[4]; //0x00C8
	UnitAbilities* abilities; //0x00CC & 0xC for pointer 
		char unknown208[52]; //0x00D0
	__int32 healthDamage; //0x0104  
	__int32 shieldDamage; //0x0108  
	__int32 energyDamage; //0x010C  
	__int32 healthMax; //0x0110  
	__int32 shieldMax; //0x0114  
	__int32 energyMax; //0x0118  
	__int32 healthMultiplier; //0x011C  
	__int32 shieldMultiplier; //0x0120  
	__int32 energyMultiplier; //0x0124  
		char unknown296[41]; //0x0128
	__int32 lifespan; //0x0151  
	__int32 lastAttacked; //0x0155  
		char unknown345[15]; //0x0159
	__int32 bountyMinerals; //0x0168  
	__int32 bountyVespene; //0x016C  
	__int32 bountyTerrazine; //0x0170  
	__int32 bountyCustom; //0x0174  
	__int32 bountyXP; //0x0178  
	__int8 cellX_Approx; //0x017C  
	__int8 cellY_Approx; //0x017D  
		char unknown382[80]; //0x017E
};//Size=0x01CE(462)
 
class UnitModel
{
public:
		char unknown0[24]; //0x0000
	__int32 unitType; //0x0018  
		char unknown28[36]; //0x001C
};//Size=0x0040(64)
 
class Abil
{
public:
	ClassType* classType; //0x0000  
	__int16 timesUsed; //0x0004  
	__int16 id; //0x0006  
	__int16 previousID; //0x0008  
	__int16 nextID; //0x000A  
		char unknown12[4]; //0x000C
	Unit* unit; //0x0010  
		char unknown20[12]; //0x0014
	__int8 index; //0x0020  
		char unknown33[87]; //0x0021
};//Size=0x0078(120)
 

 
class ClassType
{
public:
		char unknown0[4]; //0x0000
	ClassTypeInfo* info; //0x0004  
};//Size=0x0008(8)
 
class ClassTypeInfo
{
public:
		char unknown0[1]; //0x0000
	ClassTypeInfoName* infoName; //0x0001  
};//Size=0x0005(5)
 
class ClassTypeInfoName
{
public:
	char className[256]; //0x0000  
};//Size=0x0100(256)
 
class AbilQueue
{
public:
	ClassType* classType; //0x0000  
	__int16 timesUsed; //0x0004  
	__int16 id; //0x0006  
	__int16 previousID; //0x0008  
	__int16 nextID; //0x000A  
		char unknown12[4]; //0x000C
	Unit* unit; //0x0010  
		char unknown20[12]; //0x0014
	__int8 index; //0x0020  
		char unknown33[3]; //0x0021
	__int32 count; //0x0024  
		char unknown40[8]; //0x0028
	QueueSlots* slots; //0x0030  
		char unknown52[16]; //0x0034
	__int32 extraSlots; //0x0044  
		char unknown72[48]; //0x0048
};//Size=0x0078(120)
 
class QueueSlots
{
public:
	QueueSlot* slot1; //0x0000  
	QueueSlot* slot2; //0x0004  
	QueueSlot* slot3; //0x0008  
	QueueSlot* slot4; //0x000C  
	QueueSlot* slot5; //0x0010  
	QueueSlot* slot6; //0x0014  
	QueueSlot* slot7; //0x0018  
	QueueSlot* slot8; //0x001C  
};//Size=0x0020(32)
 
class QueueSlot
{
public:
		char unknown0[64]; //0x0000
	__int8 trainIndex; //0x0040  
		char unknown65[27]; //0x0041
	__int32 mineralCost; //0x005C  
	__int32 vespeneCost; //0x0060  
		char unknown100[84]; //0x0064
	__int32 foodCost; //0x00B8  
		char unknown188[4]; //0x00BC
	__int32 duration; //0x00C0  
	__int32 elapsedTime; //0x00C4  
		char unknown200[48]; //0x00C8
};//Size=0x00F8(248)
 
class CAbilBuildable
{
public:
	ClassType* classType; //0x0000  
	__int16 timesUsed; //0x0004  
	__int16 id; //0x0006  
	__int16 previousID; //0x0008  
	__int16 nextID; //0x000A  
		char unknown12[4]; //0x000C
	Unit* unit; //0x0010  
		char unknown20[16]; //0x0014
	__int32 duration; //0x0024  
	__int32 elapsedTime; //0x0028  
		char unknown44[76]; //0x002C
};//Size=0x0078(120)
 
class AbilHeader
{
public:
		char unknown0[72]; //0x0000
	__int32 count; //0x0048  
		char unknown76[4]; //0x004C
};//Size=0x0050(80)
 
class UnitAbilities
{
public:
		char unknown0[22]; //0x0000
	__int16 count; //0x0016  
	Abil* ID03B14D78; //0x0018  
	Abil* ID03B14E78; //0x001C  
		char unknown32[28]; //0x0020
};//Size=0x003C(60)