package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_DayToDayWork_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const PACK_FULL:int = 1;
        public static const DR_PACK_FULL:int = 2;
        public static const FATE_BAG_FULL:int = 3;
        public static const CHAOS_ITEM_PACK_FULL:int = 4;
        public static const ERROR:int = 5;
        public static const COINS_BIG:int = 6;
        public static const COINS_SMALL:int = 7;
        public static const JING_JIE_DIAN_BIG:int = 8;
        public static const JING_JIE_DIAN_SMALL:int = 9;
        public static const HUANG_YU_PAI_BIG:int = 10;
        public static const HUANG_YU_PAI_SMALL:int = 11;
        public static const JING_YAN_DAN:int = 12;
        public static const BAO_ZI:int = 13;
        public static const MO_SHI_SUI_PIAN_SAMLL:int = 14;
        public static const MO_SHI_SUI_PIAN_BIG:int = 15;
        public static const NOT_ENOUGHT_ITEM:int = 16;
        public static const NOT_ENOUGHT_INGOT:int = 17;
        public static const WIN:int = 18;
        public static const LOSE:int = 19;
        public static const TIE:int = 20;
        public static const get_act_info:Object = {module:165, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const get_quest_list:Object = {module:165, action:1, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil]], Utils.IntUtil]};
        public static const receive_award:Object = {module:165, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const get_drawing_award_list:Object = {module:165, action:3, request:[], response:[[Utils.UByteUtil, Utils.IntUtil]]};
        public static const drawing:Object = {module:165, action:4, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil]};
        public static const complete_quest:Object = {module:165, action:5, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const quick_complete_quest:Object = {module:165, action:6, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const finger_guess:Object = {module:165, action:7, request:[Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const dice_guess:Object = {module:165, action:8, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const notify_quest_status:Object = {module:165, action:9, request:[], response:[Utils.ByteUtil]};
        public static const Actions:Array = ["get_act_info", "get_quest_list", "receive_award", "get_drawing_award_list", "drawing", "complete_quest", "quick_complete_quest", "finger_guess", "dice_guess", "notify_quest_status"];

        public function Mod_DayToDayWork_Base()
        {
            return;
        }// end function

    }
}
