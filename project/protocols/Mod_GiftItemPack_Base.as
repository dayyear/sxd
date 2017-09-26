package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_GiftItemPack_Base extends Object
    {
        public static const HUODONG:int = 0;
        public static const BIG:int = 1;
        public static const YES:int = 2;
        public static const NO:int = 3;
        public static const SUCCESS:int = 4;
        public static const PACKAGE_FULL:int = 5;
        public static const SOURCE_GRID_NOT_EMPTY:int = 6;
        public static const USE_GRID_ITEM_NOT_IN_PACK:int = 7;
        public static const ERROR:int = 8;
        public static const ERROR_ITEM_TYPE:int = 9;
        public static const SOURCE_GRID_EMPTY:int = 10;
        public static const get_item_list:Object = {module:161, action:0, request:[], response:[[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]]};
        public static const pickup_item_to_package:Object = {module:161, action:1, request:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const put_item_to_package:Object = {module:161, action:2, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_item_list", "pickup_item_to_package", "put_item_to_package"];

        public function Mod_GiftItemPack_Base()
        {
            return;
        }// end function

    }
}
