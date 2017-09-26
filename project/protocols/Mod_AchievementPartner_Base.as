package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_AchievementPartner_Base extends Object
    {
        public static const INVITE:int = 0;
        public static const NO_INVITE:int = 1;
        public static const UPGRADE_SUCCESS:int = 2;
        public static const NOT_ENOUGTH_ACHIEVEMENT_VALUE:int = 3;
        public static const UPGRADE_ERROR:int = 4;
        public static const EXCHANGE:int = 5;
        public static const NO_EXCHANGE:int = 6;
        public static const EXCHANGE_SUCCESS:int = 7;
        public static const EXCHANGE_ERROR:int = 8;
        public static const achievement_partner_info:Object = {module:303, action:0, request:[], response:[[Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.LongUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const upgrade:Object = {module:303, action:1, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const exchange_info:Object = {module:303, action:2, request:[], response:[[Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil]]};
        public static const exchange:Object = {module:303, action:3, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const Actions:Array = ["achievement_partner_info", "upgrade", "exchange_info", "exchange"];

        public function Mod_AchievementPartner_Base()
        {
            return;
        }// end function

    }
}
