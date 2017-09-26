package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Quest_Base extends Object
    {
        public static const MONSTER:int = 0;
        public static const GETITEM:int = 1;
        public static const GETQUESTITEM:int = 2;
        public static const SCENEITEM:int = 3;
        public static const NOONE:int = 4;
        public static const SUCCEED:int = 5;
        public static const FAILED:int = 6;
        public static const PACKFULL:int = 7;
        public static const NONQUEST:int = 8;
        public static const NEWQUEST:int = 9;
        public static const ITEM:int = 10;
        public static const IS_SHOW:int = 11;
        public static const NO_SHOW:int = 12;
        public static const EXITSQUEST:int = 13;
        public static const COMPLETELIMIT:int = 14;
        public static const NOENOUGHLEVEL:int = 15;
        public static const NOENOUGHINGOT:int = 16;
        public static const PACK_FULL:int = 17;
        public static const npc_info_by_npcid:Object = {module:3, action:1, request:[Utils.IntUtil], response:[[Utils.IntUtil, Utils.ByteUtil]]};
        public static const npc_info_by_questid:Object = {module:3, action:2, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.ByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const accept_quest:Object = {module:3, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const finish_quest:Object = {module:3, action:4, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const complete_quest:Object = {module:3, action:5, request:[Utils.IntUtil], response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil]};
        public static const list_player_quest:Object = {module:3, action:6, request:[], response:[[Utils.IntUtil, Utils.ByteUtil]]};
        public static const giveup_quest:Object = {module:3, action:7, request:[Utils.IntUtil], response:[Utils.ByteUtil]};
        public static const can_receive_quest:Object = {module:3, action:8, request:[Utils.IntUtil], response:[[Utils.IntUtil]]};
        public static const town_quest_show:Object = {module:3, action:9, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]]};
        public static const day_quest_list:Object = {module:3, action:10, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]]};
        public static const day_accept_quest:Object = {module:3, action:11, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]]};
        public static const day_giveup_quest:Object = {module:3, action:12, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]]};
        public static const day_quest_refresh:Object = {module:3, action:13, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]]};
        public static const day_now_complete:Object = {module:3, action:14, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]]};
        public static const day_get_award:Object = {module:3, action:15, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]]};
        public static const day_quest_refresh_star:Object = {module:3, action:16, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]]};
        public static const finish_all_day_quest:Object = {module:3, action:17, request:[], response:[Utils.ByteUtil]};
        public static const Actions:Array = ["npc_info_by_npcid", "npc_info_by_questid", "accept_quest", "finish_quest", "complete_quest", "list_player_quest", "giveup_quest", "can_receive_quest", "town_quest_show", "day_quest_list", "day_accept_quest", "day_giveup_quest", "day_quest_refresh", "day_now_complete", "day_get_award", "day_quest_refresh_star", "finish_all_day_quest"];

        public function Mod_Quest_Base()
        {
            return;
        }// end function

    }
}
