state("indy")
{
    byte320 data: 0xbce70;
}

startup
{
    vars.currentLevelName = null;
    vars.nextLevel = 1;
    vars.levelList = new string[] {
        "M01_SriLanka_01", "M01_SriLanka_02", "M01_SriLanka_03",
        "M01_SriLanka_04", "M01_SriLanka_05", "M01_SriLanka_06",
        "M01_SriLanka_07", "M01_SriLanka_08", "M01_SriLanka_09",
        "M02_Prague_01", "M02_Prague_02", "M02_Prague_03",
        "M02_Prague_04", "M02_Prague_05", "M02_Prague_06",
        "M02_Prague_07", "M02_Prague_08", "M02_Prague_09",
        "M02_Prague_10", "M02_Prague_11", "M02_Prague_12",
        "M02_Prague_13",
        "M03_Istanbul_01", "M03_Istanbul_02", "M03_Istanbul_03",
        "M03_Istanbul_04", "M03_Istanbul_05", "M03_Istanbul_06",
        "M03_Istanbul_07",
        "M04_HongKong_01", "M04_HongKong_02",
        "M04_HongKong_03", "M04_HongKong_04", "M04_HongKong_05",
        "M05_SUBBASE_01", "M05_SUBBASE_02", "M05_SUBBASE_03",
        "M05_SUBBASE_04", "M05_SUBBASE_05", "M05_SUBBASE_06",
        "M06_Gondola_01", "M06_Gondola_02", "M06_Gondola_03",
        "M06_Gondola_04", "M06_Gondola_05",
        "M07_Fortress_01", "M07_Fortress_02", "M07_Fortress_03", "M07_Fortress_04",
        "M08_EvilTemple_01", "M08_EvilTemple_02", "M08_EvilTemple_03", "M08_EvilTemple_04",
        "M09_Tomb_01", "M09_Tomb_02", "M09_Tomb_03", "M09_Tomb_04",
        "M10_DeadCity_01", "M10_DeadCity_02", "M10_DeadCity_03", "M10_DeadCity_04"
	};
}

start
{
    if (vars.currentLevelName == vars.levelList[0]) {
        return true;
    }
    return false;
}

split
{
    if (vars.levelList[vars.nextLevel].ToLower() == vars.currentLevelName.ToLower()) {
        vars.nextLevel++;
        return true;
    }
    return false;
}

update
{
    string[] dataStrings = Encoding.UTF8.GetString(current.data).Split('\0');
    foreach (string x in dataStrings)
    {
        string[] temp = x.Split(':');
        if (temp[0] == "map")
        {
            vars.currentLevelName = temp[1];
        }
    }
}

onReset
{
    vars.nextLevel = 1;
}
