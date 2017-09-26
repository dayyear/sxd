package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ChildrenSuit_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NO_GET:int = 1;
        public static const ID_ERROR:int = 2;
        public static const USED:int = 3;
        public static const FAILURE:int = 4;
        public static const NO_USE:int = 5;
        public static const NONAGE:int = 6;
        public static const NO_ENOUGH_JIN:int = 7;
        public static const NO_ENOUGH_TICKET:int = 8;
        public static const HAD_BUY:int = 9;
        public static const get_children_suit_info:Object = {module:365, action:0, request:[Utils.IntUtil], response:[[Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const use_suit:Object = {module:365, action:1, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const show_in_town:Object = {module:365, action:2, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const buy_suit:Object = {module:365, action:3, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_children_suit_info", "use_suit", "show_in_town", "buy_suit"];

        public function Mod_ChildrenSuit_Base()
        {
            return;
        }// end function

    }
}
