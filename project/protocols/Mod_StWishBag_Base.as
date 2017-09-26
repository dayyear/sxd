package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StWishBag_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCESS:int = 2;
        public static const FUNCTION_NO_OPEN:int = 3;
        public static const CLOSE:int = 4;
        public static const NO_AVALIABLE_COUNT:int = 5;
        public static const LIMIT:int = 6;
        public static const MADE:int = 7;
        public static const AWARD_ID_ERROR:int = 8;
        public static const MESSAGE_ERROR:int = 9;
        public static const TOO_LONG:int = 10;
        public static const WISHED:int = 11;
        public static const NO_AWARD:int = 12;
        public static const PACK_FULL:int = 13;
        public static const NO_TIMES:int = 14;
        public static const ID_NO_EXISTS:int = 15;
        public static const GOTTEN:int = 16;
        public static const get_wish_bag_info:Object = {module:375, action:0, request:[], response:[Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil]]};
        public static const make:Object = {module:375, action:1, request:[], response:[Utils.UByteUtil]};
        public static const wish:Object = {module:375, action:2, request:[Utils.IntUtil, Utils.StringUtil], response:[Utils.UByteUtil]};
        public static const get_award:Object = {module:375, action:3, request:[], response:[Utils.UByteUtil]};
        public static const get_tree_awards:Object = {module:375, action:4, request:[Utils.ShortUtil], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil], Utils.ShortUtil, Utils.ByteUtil]};
        public static const get_tree_award:Object = {module:375, action:5, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.StringUtil, Utils.StringUtil]};
        public static const get_title_award:Object = {module:375, action:6, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_wish_bag_info", "make", "wish", "get_award", "get_tree_awards", "get_tree_award", "get_title_award"];

        public function Mod_StWishBag_Base()
        {
            return;
        }// end function

    }
}
