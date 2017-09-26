package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_LevitateMaterial_Base extends Object
    {
        public static const INGOT:int = 0;
        public static const COIN:int = 1;
        public static const DAOYUAN:int = 2;
        public static const YES:int = 3;
        public static const NO:int = 4;
        public static const SUCCESS:int = 5;
        public static const FUNCTION_NO_OPEN:int = 6;
        public static const BOUGHT:int = 7;
        public static const PACKAGE_FULL:int = 8;
        public static const ITEM_ERROR:int = 9;
        public static const NO_ENOUGH_RESOURCE:int = 10;
        public static const REFRESH:int = 11;
        public static const get_levitate_material_info:Object = {module:366, action:0, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil], Utils.IntUtil]};
        public static const buy:Object = {module:366, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const notify_refresh:Object = {module:366, action:2, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_levitate_material_info", "buy", "notify_refresh"];

        public function Mod_LevitateMaterial_Base()
        {
            return;
        }// end function

    }
}
