package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StAltar_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FUNCTION_UNOPEN:int = 1;
        public static const ITEM_PACK_FULL:int = 2;
        public static const FATE_PACK_FULL:int = 3;
        public static const FAILED:int = 4;
        public static const NOT_ENOUGHT_ITEM:int = 5;
        public static const NOT_ENOUGHT_INGOT:int = 6;
        public static const WIN:int = 7;
        public static const LOSE:int = 8;
        public static const TIE:int = 9;
        public static const get_altar_info:Object = {module:263, action:0, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ShortUtil, Utils.StringUtil, Utils.ShortUtil, Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil]};
        public static const get_quest_list:Object = {module:263, action:1, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil]]]};
        public static const receive_award:Object = {module:263, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const complete_quest:Object = {module:263, action:3, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const quick_complete_quest:Object = {module:263, action:4, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const finger_guess:Object = {module:263, action:5, request:[Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const dice_guess:Object = {module:263, action:6, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const notify_quest_status:Object = {module:263, action:7, request:[], response:[Utils.ByteUtil]};
        public static const get_end_award:Object = {module:263, action:8, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_altar_info", "get_quest_list", "receive_award", "complete_quest", "quick_complete_quest", "finger_guess", "dice_guess", "notify_quest_status", "get_end_award"];

        public function Mod_StAltar_Base()
        {
            return;
        }// end function

    }
}
