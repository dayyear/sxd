package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_TempWarehouse_Base extends Object
    {
        public static const FATE:int = 0;
        public static const STUFF:int = 1;
        public static const MEDICINE:int = 2;
        public static const OTHER:int = 3;
        public static const DRAGONBALL:int = 4;
        public static const SUCCESS:int = 5;
        public static const PACKAGE_FULL:int = 6;
        public static const FAILED:int = 7;
        public static const HAVE_ITEM:int = 8;
        public static const NOT_HAVE_ITEM:int = 9;
        public static const get_item_list:Object = {module:141, action:0, request:[Utils.UByteUtil], response:[[Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil], Utils.UByteUtil]};
        public static const pickup_item_to_package:Object = {module:141, action:1, request:[[Utils.IntUtil]], response:[Utils.UByteUtil, [Utils.IntUtil]]};
        public static const sell_item:Object = {module:141, action:2, request:[[Utils.IntUtil]], response:[Utils.UByteUtil, [Utils.IntUtil]]};
        public static const temp_warehouse_open_and_close_time:Object = {module:141, action:3, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const Actions:Array = ["get_item_list", "pickup_item_to_package", "sell_item", "temp_warehouse_open_and_close_time"];

        public function Mod_TempWarehouse_Base()
        {
            return;
        }// end function

    }
}
