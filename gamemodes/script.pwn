#include <a_samp>

#undef MAX_PLAYERS
#define MAX_PLAYERS (100)

// YSI Include : aktah/YSI-Includes
#include <YSI\y_timers>
#include <YSI\y_hooks>
#include <YSI\y_va>

#include <whirlpool>    // Southclaws/samp-whirlpool
#include <a_mysql>      // pBlueG/SA-MP-MySQL 
#include <easyDialog>   // aktah/easyDialog

//========================[ Modules ]========================

// ��駤��
#include "includes/configuration/general.pwn"
#include "includes/configuration/database.pwn" // ���ҧ��� database.pwn ���µ���ͧ���á����� gamemodes/includes/configuration/..

// ��ö����ª��
#include "includes/utility/colour.pwn"
#include "includes/utility/utils.pwn"

// �͡�ѡɳ�
#include "includes/entities/entities.pwn"

// �����ѡ
#include "includes/define.pwn"
#include "includes/enums.pwn"
#include "includes/variables.pwn"
#include "includes/function.pwn"
#include "includes/mysql/database.pwn"

#include "includes/registration/login.pwn"

main()
{
    print("\n----------------------------------");
    print(" �����¹: https://github.com/aktah/");
    print(" �Ԣ�Է���: GNU GENERAL PUBLIC LICENSE v3");
    print(" �����Ϳ�����������������ͧ�س�ʴ���Ҥس����Ѻ��觵��仹��: ���麹˹�Ҩ͢���ѹ���������������¹�ӵ�ͧ���ź�͡");
    print(" �����Ź���ͧ�١�ʹ���е�ͧ���١��� ������ҧ�����ͧ���������١�������ҧ��觤�Ѵ");
    print(" �����Ҥس�����ҧ�������ٻẺ� � ���� \r\n");
    print(" �ҡ�س�ջѭ��� � �Ѻ���͹�����ҹ��; �Դ��� Leaks �ѹ��");
    print("----------------------------------\n");
}

public OnGameModeInit() {

    SendRconCommand("hostname "GM_HOST_NAME"");
    SetGameModeText(GM_VERSION);

    SetNameTagDrawDistance(NAME_TAG_DISTANCE);
	
    // ���äǺ�������ͧ¹�����ʤ�Ի��᷹
	ManualVehicleEngineAndLights();
	DisableInteriorEnterExits();
	EnableStuntBonusForAll(0);

    return 1;
}

public OnPlayerConnect(playerid) {

    PlayerData[playerid][pAdmin] = CMD_PLAYER;

	new query[90];
	mysql_format(dbCon, query, sizeof(query), "SELECT COUNT(username) FROM `accounts` WHERE username = '%e'", ReturnPlayerName(playerid));
	mysql_tquery(dbCon, query, "OnPlayerJoin", "d", playerid);
    return 1;
}

public OnPlayerRequestClass(playerid, classid) {
    TogglePlayerSpectating(playerid, true);
    defer ShowLoginCamera(playerid);
    return 1;
}

public OnPlayerSpawn(playerid) {

    TogglePlayerSpectating(playerid, false);
    
    SetPlayerVirtualWorld(playerid, 0);
    SetPlayerInterior(playerid, 0);
    SetPlayerPos(playerid, 198.4090,-107.6075,1.5504);
    SetPlayerFacingAngle(playerid, 86.0094);

    return 1;
}

public OnPlayerText(playerid, text[]) {

    new str[144];

    format(str, sizeof(str), "%s �ٴ���: %s", ReturnRealName(playerid), text);
    ProxDetector(playerid, 20.0, str);

	printf("[%d]%s: %s", playerid, ReturnPlayerName(playerid), text);

	return 0;
}