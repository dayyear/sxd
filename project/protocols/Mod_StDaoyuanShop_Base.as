package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StDaoyuanShop_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const ITEM_NOT_EXIST:int = 1;
        public static const NOT_ENOUGH_DAOYUAN:int = 2;
        public static const NOT_ENOUGH_INGOT:int = 3;
        public static const SPEAKER_LIMIT:int = 4;
        public static const SYSTEM_ERROR:int = 5;
        public static const PACK_FULL:int = 6;
        public static const daoyuan_shop_item_list:Object = {module:132, action:0, request:[], response:[[Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil], Utils.ByteUtil]};
        public static const buy_daoyuan_shop_item:Object = {module:132, action:1, request:[Utils.ByteUtil, Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil]};
        public static const Actions:Array = ["daoyuan_shop_item_list", "buy_daoyuan_shop_item"];

        public function Mod_StDaoyuanShop_Base()
        {
            return;
        }// end function

    }
}
