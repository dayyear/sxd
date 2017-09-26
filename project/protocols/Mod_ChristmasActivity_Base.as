package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ChristmasActivity_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const CANNOTFREEGET:int = 1;
        public static const NOENOUGHINGOT:int = 2;
        public static const PACKETFULL:int = 3;
        public static const FATEGRIDFULL:int = 4;
        public static const STATEPOINT:int = 5;
        public static const ITEM:int = 6;
        public static const COIN:int = 7;
        public static const FATE:int = 8;
        public static const XIANLING:int = 9;
        public static const info:Object = {module:83, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const get_award:Object = {module:83, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_award_report:Object = {module:83, action:2, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const join_christmas_activity:Object = {module:83, action:3, request:[], response:[]};
        public static const exit_christmas_activity:Object = {module:83, action:4, request:[], response:[]};
        public static const Actions:Array = ["info", "get_award", "get_award_report", "join_christmas_activity", "exit_christmas_activity"];

        public function Mod_ChristmasActivity_Base()
        {
            return;
        }// end function

    }
}
