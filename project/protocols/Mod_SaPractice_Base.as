package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SaPractice_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NO_TIMES:int = 1;
        public static const NOT_ENOUGH_INGOT:int = 2;
        public static const FAILED:int = 3;
        public static const NOT_ENOUGH_COIN:int = 4;
        public static const OPEN:int = 5;
        public static const CLOSE:int = 6;
        public static const get_enter_saint_area_info:Object = {module:291, action:0, request:[], response:[[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.ShortUtil, Utils.IntUtil], Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil, Utils.ShortUtil]};
        public static const find:Object = {module:291, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const get_npc_shop_info:Object = {module:291, action:2, request:[], response:[[Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil], Utils.ByteUtil]};
        public static const buy_prop:Object = {module:291, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_practice_info:Object = {module:291, action:4, request:[], response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ShortUtil, Utils.IntUtil]]};
        public static const notify_saint_area_status:Object = {module:291, action:5, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_enter_saint_area_info", "find", "get_npc_shop_info", "buy_prop", "get_practice_info", "notify_saint_area_status"];

        public function Mod_SaPractice_Base()
        {
            return;
        }// end function

    }
}
