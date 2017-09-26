package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Turnplate_Base extends Object
    {
        public static const OPEN:int = 0;
        public static const CLOSE:int = 1;
        public static const YES:int = 2;
        public static const NO:int = 3;
        public static const SUCCESS:int = 4;
        public static const NOT_OPEN:int = 5;
        public static const NOT_ENOUGH_INGOT:int = 6;
        public static const HAVE_AWARD:int = 7;
        public static const MAX_OPEN_TIME:int = 8;
        public static const CLEAR_TIME:int = 9;
        public static const NOT:int = 10;
        public static const NOT_AWARD:int = 11;
        public static const DRAGONBALL_NO_FREE_GRID:int = 12;
        public static const CHAOS_MONSTER_PACK_FULL:int = 13;
        public static const CHAOS_ITEM_PACK_FULL:int = 14;
        public static const NOT_ENOUGH_FATE_GRID:int = 15;
        public static const NOT_ENOUGH_GRID:int = 16;
        public static const NOT_ENOUGH_SCORE:int = 17;
        public static const ALREADY_EXCHANGE:int = 18;
        public static const ERROR_AWARD_ID:int = 19;
        public static const SHEN_LONG_SUI_PIAN:int = 20;
        public static const HUI_MIE_SUI_PIAN:int = 21;
        public static const CHAO_JI_HUO_LONG_ZHU:int = 22;
        public static const HUN_DUN_LING_YE:int = 23;
        public static const JING_JIE_DIAN:int = 24;
        public static const NEI_DAN:int = 25;
        public static const JING_YAN_DAN:int = 26;
        public static const CHA_YE_DAN:int = 27;
        public static const HUANG_YU_PAI:int = 28;
        public static const XIAN_LING:int = 29;
        public static const TAI_CHU:int = 30;
        public static const XI_MEN_SUI_PIAN:int = 31;
        public static const HONG_LIAN_SUI_PIAN:int = 32;
        public static const JIU_PIN_FLAG:int = 33;
        public static const FATE_FLAG:int = 34;
        public static const XUAN_YUAN_SUI_PIAN:int = 35;
        public static const ZHEN_YUAN:int = 36;
        public static const XUE_PO_FLAG:int = 37;
        public static const XUAN_TIAN_SUI_PIAN:int = 38;
        public static const SHI_QUE_ZHI_HUN:int = 39;
        public static const LUN_HUI_SHI:int = 40;
        public static const JUE_JI_YUAN_QI_DAN:int = 41;
        public static const MO_LONG_KUANG_XIAO_FLAG:int = 42;
        public static const SHEN_LONG_BAI_WIE_FLAG:int = 43;
        public static const SHAN_HE_SHE_JI_TU_FLAG:int = 44;
        public static const SAN_BAO_YU_RU_YI_FLAG:int = 45;
        public static const CANG_LONG_ZHU_RI_FLAG:int = 46;
        public static const LONG_ZHEN_TIAN_WEI_FLAG:int = 47;
        public static const RONG_HE_JING_HUA:int = 48;
        public static const HONG_MENG_ZI_QI:int = 49;
        public static const DA_LING_LI_FU:int = 50;
        public static const FA_SHU_YUAN_QI_DAN:int = 51;
        public static const JIU_XIAO_LONG_YIN_BIAO_ZHI:int = 52;
        public static const GAO_JI_JIN_JIE_DAN:int = 53;
        public static const CAN_NOT_GET:int = 54;
        public static const CAN_GET:int = 55;
        public static const ALREADY_GET:int = 56;
        public static const NOT_ENOUGH_SCRAP:int = 57;
        public static const ITEM_PACK_FULL:int = 58;
        public static const NOT_FREE_GRID:int = 59;
        public static const get_turnplate_status:Object = {module:150, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_turnplate:Object = {module:150, action:1, request:[], response:[[Utils.ShortUtil, [Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil]], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], Utils.UByteUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil]]};
        public static const do_turnplate:Object = {module:150, action:2, request:[], response:[Utils.UByteUtil, [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.ShortUtil]};
        public static const get_award:Object = {module:150, action:3, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const exchange:Object = {module:150, action:4, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const exchange_list:Object = {module:150, action:5, request:[], response:[[Utils.ByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const notify_turnplate_award:Object = {module:150, action:6, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil]};
        public static const get_reel:Object = {module:150, action:7, request:[], response:[Utils.UByteUtil]};
        public static const notify_all_server_star_count:Object = {module:150, action:8, request:[], response:[Utils.LongUtil]};
        public static const Actions:Array = ["get_turnplate_status", "get_player_turnplate", "do_turnplate", "get_award", "exchange", "exchange_list", "notify_turnplate_award", "get_reel", "notify_all_server_star_count"];

        public function Mod_Turnplate_Base()
        {
            return;
        }// end function

    }
}
