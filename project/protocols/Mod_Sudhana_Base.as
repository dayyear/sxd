package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Sudhana_Base extends Object
    {
        public static const OPEN:int = 0;
        public static const CLOSE:int = 1;
        public static const A:int = 2;
        public static const B:int = 3;
        public static const C:int = 4;
        public static const SUCCESS:int = 5;
        public static const NOT_OPEN:int = 6;
        public static const CD_TIME:int = 7;
        public static const PACK_FULL:int = 8;
        public static const NOT_ENOUGH_FATE_GRID:int = 9;
        public static const DRAGONBALL_NO_FREE_GRID:int = 10;
        public static const NEI_DAN:int = 11;
        public static const HOU_ZI_SUI_PIAN:int = 12;
        public static const COIN:int = 13;
        public static const TAI_CHU:int = 14;
        public static const HUANG_YU_PAI:int = 15;
        public static const BAO_ZI:int = 16;
        public static const HUN_DUN_LING_YE:int = 17;
        public static const QI_HUN:int = 18;
        public static const FANG_ZI_QING_SUI_PIAN:int = 19;
        public static const JING_JIE_DIAN:int = 20;
        public static const ZONG_ZI:int = 21;
        public static const XIAN_LING:int = 22;
        public static const XUE_MAI_JING_HUA:int = 23;
        public static const SHEN_BING_DAO_JU_SUO:int = 24;
        public static const CHAO_JI_HUO_LONG_ZHU:int = 25;
        public static const CHA_YE_DAN:int = 26;
        public static const JING_YAN_DAN:int = 27;
        public static const QI_PIN_DAN_JUAN_ZHOU:int = 28;
        public static const FAME:int = 29;
        public static const JEWEL_SCRAP:int = 30;
        public static const XIONG_MAO_SCRAP:int = 31;
        public static const SHUN_YANG_LING:int = 32;
        public static const XING_HUN:int = 33;
        public static const FU_XI_SUI_PIAN:int = 34;
        public static const ZHEN_YUAN:int = 35;
        public static const WU_LI_YUAN_SHI:int = 36;
        public static const JUE_JI_YUAN_SHI:int = 37;
        public static const FA_SHU_YUAN_SHI:int = 38;
        public static const SHENG_MING_YUAN_SHI:int = 39;
        public static const PU_GONG_YUAN_SHI:int = 40;
        public static const PU_FANG_YUAN_SHI:int = 41;
        public static const JUE_FANG_YUAN_SHI:int = 42;
        public static const JUE_GONG_YUAN_SHI:int = 43;
        public static const FA_GONG_YUAN_SHI:int = 44;
        public static const FA_FANG_YAUN_SHI:int = 45;
        public static const WU_LI_SHI:int = 46;
        public static const JUE_JI_SHI:int = 47;
        public static const FA_SHU_SHI:int = 48;
        public static const PU_GONG_SHI:int = 49;
        public static const SHENG_MING_SHI:int = 50;
        public static const JUE_GONG_SHI:int = 51;
        public static const PU_FANG_SHI:int = 52;
        public static const JUE_FANG_SHI:int = 53;
        public static const FA_GONG_SHI:int = 54;
        public static const FA_FANG_SHI:int = 55;
        public static const TRUE:int = 56;
        public static const FALSE:int = 57;
        public static const get_sudhana_status:Object = {module:167, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_sudhana_info:Object = {module:167, action:1, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const give_gift:Object = {module:167, action:2, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.IntUtil]]};
        public static const get_player_status:Object = {module:167, action:3, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_sudhana_status", "get_player_sudhana_info", "give_gift", "get_player_status"];

        public function Mod_Sudhana_Base()
        {
            return;
        }// end function

    }
}
