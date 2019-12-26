
forward OnPlayerJoin(playerid);
public OnPlayerJoin(playerid)
{
	new rows;
	cache_get_value_index_int(0, 0, rows);
	if(rows) Auth_Login(playerid);
	else Auth_Register(playerid);
	return 1;
}

forward OnPlayerRegister(playerid);
public OnPlayerRegister(playerid)
{
	SendClientMessage(playerid, 0x0033FFFF /*Blue*/, "�ͺ�س����Ѻ���ŧ����¹! �س����ö�������к�������");
    Dialog_Show(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "�������к�", "�ͺ�س����Ѻ���ŧ����¹, %s\n\n��͹���ʼ�ҹ��ҹ��ҧ������������ҹ:", "�������к�", "�͡", ReturnPlayerName(playerid));
	return 1;
}

forward OnPlayerLogin(playerid);
public OnPlayerLogin(playerid)
{
	new pPass[129], unhashed_pass[129];
	GetPVarString(playerid, "Unhashed_Pass",unhashed_pass, 129);
	if(cache_num_rows())
	{
		cache_get_value_index(0, 0, pPass, 129);
		cache_get_value_index_int(0, 1, playerData[playerid][pSQLID]);
		
        if (strequal(unhashed_pass, pPass, true)) {
            DeletePVar(playerid, "Unhashed_Pass");

            cache_get_value_name_int(0, "admin", playerData[playerid][pAdmin]);

            if (playerData[playerid][pAdmin])
            {
                SendClientMessageEx(playerid, COLOR_WHITE, "SERVER: �س�������к����ʹ�Թ�дѺ %i", playerData[playerid][pAdmin]);
            }

            syncAdmin(playerid);

            BitFlag_On(gPlayerBitFlag[playerid], IS_LOGGED);
            
            // ShowCharacterSelection(playerid);
            SetSpawnInfo(playerid, NO_TEAM, 1, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);
	        SpawnPlayer(playerid);
        }
        else Dialog_Show(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "�������к�", "���ʼ�ҹ���١��ͧ\n�ô�ͧ�����ա����", "�������к�", "�͡");
  	}
    else {
        printf("ERROR: %s can't log-in", ReturnPlayerName(playerid));
    }
	return 1;
}

Auth_Login(playerid) {
    Dialog_Show(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "�������к�", "���ʴ�, %s\n\n��͹���ʼ�ҹ��ҹ��ҧ������������ҹ:", "�������к�", "�͡", ReturnPlayerName(playerid));
    return 1;
}

Auth_Register(playerid) {
    Dialog_Show(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "��Ѥ���Ҫԡ", "�ѭ�չ���ѧ���������㹰ҹ������ �ôŧ����¹���¡�á�͡���ʼ�ҹ��ҹ��ҧ���", "ŧ����¹", "�͡");
    return 1;
}

timer ShowLoginCamera[400](playerid)
{
	if(IsPlayerConnected(playerid)) {
		SetPlayerVirtualWorld(playerid, playerid + 8000);
		SetPlayerCameraPos(playerid, 2559.6138,-1719.2664,37.2296);
		SetPlayerCameraLookAt(playerid, 2488.2173,-1665.3325,13.3438, CAMERA_CUT);
	}
}

Dialog:DIALOG_LOGIN(playerid, response, listitem, inputtext[])
{
    if (!response)
        Kick(playerid);

    new query[128], buf[129];

    WP_Hash(buf, sizeof (buf), inputtext);
    SetPVarString(playerid, "Unhashed_Pass",buf);

    mysql_format(dbCon, query, sizeof(query), "SELECT password, id from `accounts` WHERE username = '%e'", ReturnPlayerName(playerid));
    mysql_tquery(dbCon, query, "OnPlayerLogin", "d", playerid);

    return 1;
}

Dialog:DIALOG_REGISTER(playerid, response, listitem, inputtext[])
{
    if (!response)
        Kick(playerid);

    new
        buf[129];

    WP_Hash(buf, sizeof (buf), inputtext);

    new query[256];
    mysql_format(dbCon, query, sizeof(query), "INSERT INTO `accounts` (username, password) VALUES('%e', '%e')", ReturnPlayerName(playerid), buf);
	mysql_tquery(dbCon, query, "OnPlayerRegister", "d", playerid);

    return 1;
}
