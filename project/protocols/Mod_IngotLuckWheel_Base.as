package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_IngotLuckWheel_Base extends Object
    {
        public static const INGOT:int = 0;
        public static const HUO_DONG_QUAN:int = 1;
        public static const COIN:int = 2;
        public static const CHA_YE_DAN:int = 3;
        public static const JING_YAN_DAN:int = 4;
        public static const QI_PIN_WU_LI_DAN:int = 5;
        public static const FAME:int = 6;
        public static const QI_PIN_JUE_JI_DAN:int = 7;
        public static const QI_PIN_FA_SHU_DAN:int = 8;
        public static const JING_YAN_DAN1:int = 9;
        public static const HUO_DONG_QUAN1:int = 10;
        public static const HUANG_YU_PAI:int = 11;
        public static const HUANG_YU_PAI1:int = 12;
        public static const FU_SHEN_30_1:int = 13;
        public static const FU_SHEN_30_2:int = 14;
        public static const FU_SHEN_30_3:int = 15;
        public static const FU_SHEN_50_1:int = 16;
        public static const MO_SHI_SUI_PIAN_8:int = 17;
        public static const MO_SHI_SUI_PIAN_15:int = 18;
        public static const MO_SHI_LEVEL_4:int = 19;
        public static const SUCCESS:int = 20;
        public static const PACK_FULL:int = 21;
        public static const JEWEL_PACK_FULL:int = 22;
        public static const FAILED:int = 23;
        public static const get_consume_ingot:Object = {module:74, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.UByteUtil]]};
        public static const exchange_gift:Object = {module:74, action:1, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil]};
        public static const exchange_notify:Object = {module:74, action:2, request:[], response:[Utils.IntUtil]};
        public static const Actions:Array = ["get_consume_ingot", "exchange_gift", "exchange_notify"];

        public function Mod_IngotLuckWheel_Base()
        {
            return;
        }// end function

    }
}
