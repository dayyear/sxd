package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_LanternFestival_Base extends Object
    {
        public static const AWARD_TYPE_COIN:int = 0;
        public static const AWARD_TYPE_ITEM:int = 1;
        public static const AWARD_TYPE_FATE:int = 2;
        public static const AWARD_TYPE_STATE_POINT:int = 3;
        public static const AWARD_TYPE_XIANLING:int = 4;
        public static const AWARD_TYPE_DRAGONBALL:int = 5;
        public static const SUCCESS:int = 6;
        public static const CANNOTFREEGET:int = 7;
        public static const NOENOUGHINGOT:int = 8;
        public static const PACKETFULL:int = 9;
        public static const FATEGRIDFULL:int = 10;
        public static const info:Object = {module:86, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const get_award:Object = {module:86, action:1, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_award_report:Object = {module:86, action:2, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil]};
        public static const join_lantern_festival:Object = {module:86, action:3, request:[], response:[]};
        public static const exit_lantern_festival:Object = {module:86, action:4, request:[], response:[]};
        public static const Actions:Array = ["info", "get_award", "get_award_report", "join_lantern_festival", "exit_lantern_festival"];

        public function Mod_LanternFestival_Base()
        {
            return;
        }// end function

    }
}
