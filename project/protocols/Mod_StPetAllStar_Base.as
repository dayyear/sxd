package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StPetAllStar_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SERVER_WAR_4:int = 2;
        public static const SERVER_WAR_2:int = 3;
        public static const SERVER_WAR_1:int = 4;
        public static const PVE:int = 5;
        public static const PVP:int = 6;
        public static const NON_ACTIVITY:int = 7;
        public static const INIT:int = 8;
        public static const WINNER:int = 9;
        public static const LOSER:int = 10;
        public static const SUCCESS:int = 11;
        public static const QUEST_NO_EXIST:int = 12;
        public static const PET_NO_EXISTS:int = 13;
        public static const COUNT_NO_MATCH:int = 14;
        public static const DUPLICATE_PET:int = 15;
        public static const FUNCTION_NO_OPEN:int = 16;
        public static const PET_LOCK:int = 17;
        public static const FORBIDDEN:int = 18;
        public static const RE_ACCEPT:int = 19;
        public static const LIMIT:int = 20;
        public static const RUNNING:int = 21;
        public static const NO_EXISTS:int = 22;
        public static const NO_ACCEPT:int = 23;
        public static const GOTTEN:int = 24;
        public static const DONE:int = 25;
        public static const UNDO:int = 26;
        public static const CANNT_CHANGE_DEPLOY:int = 27;
        public static const ERROR:int = 28;
        public static const get_pet_all_star_status:Object = {module:289, action:0, request:[], response:[Utils.UByteUtil]};
        public static const pve_quest_info:Object = {module:289, action:1, request:[], response:[Utils.ByteUtil, [Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], Utils.ByteUtil], Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.ShortUtil], Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.ByteUtil]};
        public static const get_pve_pet_list:Object = {module:289, action:2, request:[], response:[[Utils.IntUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ByteUtil]]};
        public static const pve_reload:Object = {module:289, action:3, request:[[Utils.ShortUtil]], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const pve_rank:Object = {module:289, action:4, request:[], response:[[Utils.ByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil]]};
        public static const accept_quest:Object = {module:289, action:5, request:[[Utils.ShortUtil]], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const get_pve_award:Object = {module:289, action:6, request:[], response:[Utils.UByteUtil]};
        public static const get_pvp_race_step:Object = {module:289, action:7, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const get_pvp_race_list:Object = {module:289, action:8, request:[], response:[Utils.ByteUtil, [Utils.ByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.IntUtil], [Utils.ByteUtil], [Utils.ByteUtil], Utils.ByteUtil, Utils.IntUtil]};
        public static const get_pvp_race_war_report:Object = {module:289, action:9, request:[Utils.ByteUtil, Utils.ByteUtil], response:[[Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]]};
        public static const get_pvp_pet_deploy_list:Object = {module:289, action:10, request:[], response:[[Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil]};
        public static const pvp_change_deploy:Object = {module:289, action:11, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const pvp_war_report:Object = {module:289, action:12, request:[Utils.IntUtil], response:[[Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, Utils.ByteUtil]};
        public static const restart_pve_quest:Object = {module:289, action:13, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_pet_all_star_status", "pve_quest_info", "get_pve_pet_list", "pve_reload", "pve_rank", "accept_quest", "get_pve_award", "get_pvp_race_step", "get_pvp_race_list", "get_pvp_race_war_report", "get_pvp_pet_deploy_list", "pvp_change_deploy", "pvp_war_report", "restart_pve_quest"];

        public function Mod_StPetAllStar_Base()
        {
            return;
        }// end function

    }
}
