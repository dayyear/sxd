package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ChristmasHuntDemon_Base extends Object
    {
        public static const COIN:int = 0;
        public static const ITEM:int = 1;
        public static const STATE_POINT:int = 2;
        public static const FATE:int = 3;
        public static const XIAN_LING:int = 4;
        public static const ROLE_SCRAP:int = 5;
        public static const GOLD:int = 6;
        public static const RED:int = 7;
        public static const PURPLE:int = 8;
        public static const BLUE:int = 9;
        public static const GREEN:int = 10;
        public static const WHITE:int = 11;
        public static const NOT_GET:int = 12;
        public static const HAD_GET:int = 13;
        public static const SUCCESS:int = 14;
        public static const PACK_FULL:int = 15;
        public static const FATE_PACK_FULL:int = 16;
        public static const NOT_ENOUGH_INGOT:int = 17;
        public static const NON_ACTIVITY_TIME:int = 18;
        public static const NEED_VIP_LEVEL_ONE:int = 19;
        public static const NEED_VIP_LEVEL_FOUR:int = 20;
        public static const FAILED:int = 21;
        public static const FULL:int = 22;
        public static const FUNCTION_UNOPEN:int = 23;
        public static const NOT_ENOUGH_COUNT:int = 24;
        public static const open_christmas_hunt_demon:Object = {module:130, action:0, request:[], response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const close_christmas_hunt_demon:Object = {module:130, action:1, request:[], response:[]};
        public static const hunt:Object = {module:130, action:2, request:[], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.UByteUtil], Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const hunt_notify:Object = {module:130, action:3, request:[], response:[Utils.IntUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const active_time:Object = {module:130, action:4, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_choose_info:Object = {module:130, action:5, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const choose:Object = {module:130, action:6, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_suit:Object = {module:130, action:7, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["open_christmas_hunt_demon", "close_christmas_hunt_demon", "hunt", "hunt_notify", "active_time", "get_player_choose_info", "choose", "get_suit"];

        public function Mod_ChristmasHuntDemon_Base()
        {
            return;
        }// end function

    }
}
