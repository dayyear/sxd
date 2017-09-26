package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_NewServerLoginAct_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCESS:int = 2;
        public static const ITEM_PACK_FULL:int = 3;
        public static const ERROR:int = 4;
        public static const is_can_join_activity:Object = {module:201, action:0, request:[], response:[Utils.UByteUtil]};
        public static const activity_info:Object = {module:201, action:1, request:[], response:[Utils.IntUtil, [Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]]};
        public static const get_activity_award:Object = {module:201, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["is_can_join_activity", "activity_info", "get_activity_award"];

        public function Mod_NewServerLoginAct_Base()
        {
            return;
        }// end function

    }
}
