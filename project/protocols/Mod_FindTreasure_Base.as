package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_FindTreasure_Base extends Object
    {
        public static const OPEN:int = 0;
        public static const CLOSE:int = 1;
        public static const SUCCESS:int = 2;
        public static const NOT_ENOUGH_COUNT:int = 3;
        public static const NOT_ENOUGH_INGOT:int = 4;
        public static const GRID_ALREADY_RANDOMED:int = 5;
        public static const ITEM_PACK_FULL:int = 6;
        public static const FIVE_ELEMENTS_PACK_FULL:int = 7;
        public static const FATE_PACK_FULL:int = 8;
        public static const DRAGONBALL_PACK_FULL:int = 9;
        public static const YES:int = 10;
        public static const NO:int = 11;
        public static const NOT_ENOUGH_SCORE:int = 12;
        public static const ALREADY_EXCHANGE:int = 13;
        public static const NOT_ENOUGH_SCRAP:int = 14;
        public static const ERROR:int = 15;
        public static const activity_info:Object = {module:188, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const open_find_treasure:Object = {module:188, action:1, request:[], response:[Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const find_treasure:Object = {module:188, action:2, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ByteUtil]};
        public static const reset_award_list:Object = {module:188, action:3, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]]};
        public static const score_award_list:Object = {module:188, action:4, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const exchange_score_award:Object = {module:188, action:5, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_medicine_reel:Object = {module:188, action:6, request:[], response:[Utils.UByteUtil]};
        public static const role_scrap_list:Object = {module:188, action:7, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const choose_role_scrap:Object = {module:188, action:8, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["activity_info", "open_find_treasure", "find_treasure", "reset_award_list", "score_award_list", "exchange_score_award", "get_medicine_reel", "role_scrap_list", "choose_role_scrap"];

        public function Mod_FindTreasure_Base()
        {
            return;
        }// end function

    }
}
