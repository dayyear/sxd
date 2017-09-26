package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_HideTreasureMap_Base extends Object
    {
        public static const SUCCEED:int = 0;
        public static const USE_GRID_ITEM_NOT_IN_PACK:int = 1;
        public static const SOURCE_GRID_EMPTY:int = 2;
        public static const NON_PLAYER_ITEM:int = 3;
        public static const FAILED:int = 4;
        public static const ITEM_PACK_FULL:int = 5;
        public static const NOT_PLACE:int = 6;
        public static const COIN:int = 7;
        public static const INGOT:int = 8;
        public static const FUN_NOT_OPEN:int = 9;
        public static const NOT_BUY_COUNT:int = 10;
        public static const NOT_ENOUGH_COIN:int = 11;
        public static const NOT_ENOUGH_INGOT:int = 12;
        public static const player_use_grid_item:Object = {module:287, action:0, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const start_grub:Object = {module:287, action:1, request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const buy_item:Object = {module:287, action:2, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const buy_item_info:Object = {module:287, action:3, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["player_use_grid_item", "start_grub", "buy_item", "buy_item_info"];

        public function Mod_HideTreasureMap_Base()
        {
            return;
        }// end function

    }
}
