package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_CardSoul_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const FUNCTION_NO_OPEN:int = 2;
        public static const NO_ENOUGH_CARD_SOUL:int = 3;
        public static const ALREADY_ACTIVE:int = 4;
        public static const CARD_ERROR:int = 5;
        public static const SUCCESS:int = 6;
        public static const NO_ACTIVE:int = 7;
        public static const FAILURE:int = 8;
        public static const NO_ENOUGH_COUNT:int = 9;
        public static const CARD_SOUL_ERROR:int = 10;
        public static const UN_EXCHANGEABLE:int = 11;
        public static const CAN_NOT_BE_ACTIVATED:int = 12;
        public static const CAN_BE_ACTIVATED:int = 13;
        public static const CAN_BE_UPGRADED:int = 14;
        public static const MAX_LEVEL:int = 15;
        public static const PLAYER_HAS_NOT_SAINT:int = 16;
        public static const LACK_OF_COIN:int = 17;
        public static const LACK_OF_CARD_SOUL_SCRAP:int = 18;
        public static const BUY:int = 19;
        public static const ACTIVITY:int = 20;
        public static const COMPLETE:int = 21;
        public static const UN_COMPLETE:int = 22;
        public static const NO_GET:int = 23;
        public static const ID_ERROR:int = 24;
        public static const USED:int = 25;
        public static const TOWN:int = 26;
        public static const FIGHT:int = 27;
        public static const HAD_DISPLAY:int = 28;
        public static const NO_ENOUGH_SCRAP:int = 29;
        public static const NO_ENOUGH_COIN:int = 30;
        public static const NO_ENOUGH_INGOT:int = 31;
        public static const NO_ENOUGH_CONDITION:int = 32;
        public static const get_card_info:Object = {module:187, action:0, request:[Utils.ByteUtil], response:[[Utils.ByteUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.UByteUtil], Utils.ShortUtil]};
        public static const active_card:Object = {module:187, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const transform:Object = {module:187, action:2, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const dissolve_card_soul:Object = {module:187, action:3, request:[Utils.ByteUtil, Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const exchange_card_soul:Object = {module:187, action:4, request:[Utils.ByteUtil, Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const get_card_soul_supernatural:Object = {module:187, action:5, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.UByteUtil]};
        public static const activate_supernatural:Object = {module:187, action:6, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_card_soul_list:Object = {module:187, action:7, request:[], response:[[Utils.ShortUtil, Utils.IntUtil]]};
        public static const get_main_role_change_card_list:Object = {module:187, action:8, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil]]};
        public static const use_change_card:Object = {module:187, action:9, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const display:Object = {module:187, action:10, request:[Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const buy_change_card:Object = {module:187, action:11, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_card_info", "active_card", "transform", "dissolve_card_soul", "exchange_card_soul", "get_card_soul_supernatural", "activate_supernatural", "get_card_soul_list", "get_main_role_change_card_list", "use_change_card", "display", "buy_change_card"];

        public function Mod_CardSoul_Base()
        {
            return;
        }// end function

    }
}
