package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_CourtyardPet_Base extends Object
    {
        public static const NORMAL:int = 0;
        public static const INGOT:int = 1;
        public static const SUCCESS:int = 2;
        public static const FUNCTION_NO_OPEN:int = 3;
        public static const TIMES_USED_UP:int = 4;
        public static const NO_ENOUGH_INGOT:int = 5;
        public static const YES:int = 6;
        public static const NO:int = 7;
        public static const NO_ENOUGH_PET:int = 8;
        public static const REACH_MAX:int = 9;
        public static const FORBIDDEN:int = 10;
        public static const NOT_ENOUGH_COUNT:int = 11;
        public static const NO_EXISTS:int = 12;
        public static const PET_ERROR:int = 13;
        public static const EXP_PET_ERROR:int = 14;
        public static const INIT:int = 15;
        public static const RUNNING:int = 16;
        public static const WINNER:int = 17;
        public static const LOSER:int = 18;
        public static const TRUE:int = 19;
        public static const FALSE:int = 20;
        public static const DRAGONBALL_PACK_FULL:int = 21;
        public static const QUEST_NO_EXIST:int = 22;
        public static const PET_NO_EXISTS:int = 23;
        public static const COUNT_NO_MATCH:int = 24;
        public static const DUPLICATE_PET:int = 25;
        public static const PET_LOCK:int = 26;
        public static const RE_ACCEPT:int = 27;
        public static const LIMIT:int = 28;
        public static const NO_ACCEPT:int = 29;
        public static const GOTTEN:int = 30;
        public static const NO_LUCKY_DAY:int = 31;
        public static const LACK_OF_SCRAP:int = 32;
        public static const FAILED:int = 33;
        public static const ERROR:int = 34;
        public static const FAILD:int = 35;
        public static const NOT_ENOUGTH_INGOT:int = 36;
        public static const get_player_info:Object = {module:216, action:0, request:[], response:[Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const call:Object = {module:216, action:1, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.UByteUtil]};
        public static const get_courtyard_pet_list:Object = {module:216, action:2, request:[], response:[[Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil], [Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil]]};
        public static const merge:Object = {module:216, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const feed:Object = {module:216, action:4, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const get_quest_list:Object = {module:216, action:5, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, [Utils.IntUtil, [Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil]], Utils.UByteUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.ShortUtil], [Utils.ShortUtil, Utils.IntUtil], [Utils.ShortUtil], Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const reload:Object = {module:216, action:6, request:[Utils.ShortUtil, [Utils.ShortUtil]], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const accept_quest:Object = {module:216, action:7, request:[Utils.ShortUtil, [Utils.ShortUtil]], response:[Utils.UByteUtil]};
        public static const get_award:Object = {module:216, action:8, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const get_courtyard_normal_pet_list:Object = {module:216, action:9, request:[], response:[[Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const lucky_call:Object = {module:216, action:10, request:[], response:[Utils.UByteUtil, [Utils.ShortUtil, Utils.UByteUtil]]};
        public static const one_key_feed:Object = {module:216, action:11, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const exchange_pet:Object = {module:216, action:12, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const set_auto_quest_pet:Object = {module:216, action:13, request:[Utils.ByteUtil, [Utils.ByteUtil, Utils.ByteUtil]], response:[Utils.UByteUtil]};
        public static const set_auto_get_award:Object = {module:216, action:14, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const auto_info:Object = {module:216, action:15, request:[], response:[Utils.ByteUtil, [Utils.ByteUtil, Utils.ByteUtil], Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]]]};
        public static const buy_pet:Object = {module:216, action:16, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_player_info", "call", "get_courtyard_pet_list", "merge", "feed", "get_quest_list", "reload", "accept_quest", "get_award", "get_courtyard_normal_pet_list", "lucky_call", "one_key_feed", "exchange_pet", "set_auto_quest_pet", "set_auto_get_award", "auto_info", "buy_pet"];

        public function Mod_CourtyardPet_Base()
        {
            return;
        }// end function

    }
}
