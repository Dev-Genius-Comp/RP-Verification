A simple RP Verification without any dialog within it!!! Credits to Stewart for creating these systems

Put on pEnum Section:
  //Simple RP Verification for player - Stewart
	pApplication,
	pApplication1,
	//If the player's been approved and can play
	pApproved, // Make sure to add this on your SQL if your Gamemode is a SQL-Based GM

OnPlayerSpawn
    if(pData[playerid][pApproved] == 0)
    {
      TogglePlayerControllable(playerid, false);
    } else {
      TogglePlayerControllable(playerid, true);
    }
    
Put this anywhere on your script
    ApplicationSystem(playerid)
    {
      if(pData[playerid][pApproved] == 0)
      {
        if(pData[playerid][pApplication] == 1)
        {
          SendClientMessage(playerid, COLOR_YELLOW, "What is the definition of 'MG'?");
          //ApplicationSystem1(playerid);
        }
        else if(pData[playerid][pApplication] == 2)
        {
          SendClientMessage(playerid, COLOR_YELLOW, "What is the definition of 'PG'?");
          //ApplicationSystem1(playerid);
        }
        else if(pData[playerid][pApplication] == 3)
        {
          SendClientMessage(playerid, COLOR_YELLOW, "What is the definition of 'KoS'?");
          SendClientMessage(playerid, COLOR_WHITE, "Note: Don't put space on your answer or else, the system will not accept your answer and will kick you.");
          //ApplicationSystem1(playerid);
        }
        else if(pData[playerid][pApplication] == 4)
        {
          SendClientMessage(playerid, COLOR_YELLOW, "What is the definition of 'Rate your Roleplay Experience[BE HONEST]. Rate Count: 1-10");
          //ApplicationSystem1(playerid);
        }
        else if(pData[playerid][pApplication] == 5)
        {
          new string[128], text[128];
          format(string, sizeof(string), "Thank you for answering our questions. You can now play.\n"YELLOW"If you have any concerns please contact us here:"WHITE"\n\
          - "SERVER_URL"\n - /am [message]\n- You may Message my account. @Stewart#8221\n\n\tLCC 2022, Alcazar Gaming...");
          strcat(string, text);
          ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Verification", string, "Alcazar Gaming", "");
          pData[playerid][pApproved] = 1;
          pData[playerid][pApplication] = 0;
          mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET approved = 1 WHERE uid = %i", pData[playerid][pID]);
          mysql_tquery(connectionID, queryBuffer);
          //ApplicationSystem1(playerid);
        }
      }
    }
    
OnPlayerText
        if(pData[playerid][pApproved] == 0)
        {
            if(pData[playerid][pApplication] == 1 && !strcmp(text, "metagaming", true))
            {
                GameTextForPlayer(playerid, "You are ~y~correct~w~!", 2000, 1);
                pData[playerid][pApplication] = 2;
                ApplicationSystem(playerid);
            } else {
                SendClientMessage(playerid, COLOR_LIGHTRED, "Your answer is INCORRECT!!!");
                SendClientMessage(playerid, COLOR_SAMP, "You have been kicked because of answering it incorrectly.");
                SAM(COLOR_LIGHTRED, "Application Bot: %s has been kicked. Reason: Incorrect Answer at Q#1(%s)", GetRPName(playerid), text);
                Kick(playerid);
            }
            if(pData[playerid][pApplication] == 2 && !strcmp(text, "powergaming", true))
            {
                GameTextForPlayer(playerid, "You are ~y~correct~w~!", 2000, 1);
                pData[playerid][pApplication] = 3;
                ApplicationSystem(playerid);
            } else {
                SendClientMessage(playerid, COLOR_LIGHTRED, "Your answer is INCORRECT!!!");
                SendClientMessage(playerid, COLOR_SAMP, "You have been kicked because of answering it incorrectly.");
                SAM(COLOR_LIGHTRED, "Application Bot: %s has been kicked. Reason: Incorrect Answer at Q#2(%s)", GetRPName(playerid), text);
                Kick(playerid);
            }
            if(pData[playerid][pApplication] == 3 && !strcmp(text, "killonsight", true))
            {
                GameTextForPlayer(playerid, "You are ~y~correct~w~!", 2000, 1);
                pData[playerid][pApplication] = 4;
                ApplicationSystem(playerid);
            } else {
                SendClientMessage(playerid, COLOR_LIGHTRED, "Your answer is INCORRECT!!!");
                SendClientMessage(playerid, COLOR_SAMP, "You have been kicked because of answering it incorrectly.");
                SAM(COLOR_LIGHTRED, "Application Bot: %s has been kicked. Reason: Incorrect Answer at Q#3(%s)", GetRPName(playerid), text);
                Kick(playerid);
            }
            if(pData[playerid][pApplication] == 4)
            {
                pData[playerid][pApplication] = 5;
                ApplicationSystem(playerid);
            }
        }
        
  Remember to change the 'pData' code. If you're using a PlayerInfo code, replace it. The name depends on what your player enum's name.