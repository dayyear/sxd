package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_CardMaster_Base extends Object
    {
        public static const OPEN:int = 0;
        public static const CLOSE:int = 1;
        public static const A:int = 2;
        public static const B:int = 3;
        public static const C:int = 4;
        public static const ONE:int = 5;
        public static const TEN:int = 6;
        public static const SUCCESS:int = 7;
        public static const NOT_ENOUGH_INGOT:int = 8;
        public static const NOT_OPEN:int = 9;
        public static const NOT_ENOUGH_COUNT:int = 10;
        public static const CLEAR_TIME:int = 11;
        public static const NOT_ENOUGH_CARD:int = 12;
        public static const FULL_EXCHANGE_TIME:int = 13;
        public static const PACK_FULL:int = 14;
        public static const NOT_ENOUGH_SCORE:int = 15;
        public static const ALREADY_EXCHANGE:int = 16;
        public static const ERROR_AWARD_ID:int = 17;
        public static const DRAGONBALL_NO_FREE_GRID:int = 18;
        public static const CHAOS_MONSTER_PACK_FULL:int = 19;
        public static const CHAOS_ITEM_PACK_FULL:int = 20;
        public static const NOT_ENOUGH_FATE_GRID:int = 21;
        public static const NOT_ENOUGH_FIVE_ELEMENTS_PACK:int = 22;
        public static const NOT_ENOUGH_GRID:int = 23;
        public static const SHEN_LONG_SUI_PIAN:int = 24;
        public static const JIU_YOU_SUI_PIAN:int = 25;
        public static const HUN_SHI:int = 26;
        public static const NEI_DAN:int = 27;
        public static const CHAO_JI_HUO_LONG_ZHU:int = 28;
        public static const JING_YAN_DAN:int = 29;
        public static const HUANG_YU_PAI:int = 30;
        public static const JING_JIE_DIAN:int = 31;
        public static const TAI_CHU:int = 32;
        public static const COIN:int = 33;
        public static const CHA_YE_DAN:int = 34;
        public static const XIAN_LING:int = 35;
        public static const ITEM:int = 36;
        public static const FANG_ZI_QING_SUI_PIAN:int = 37;
        public static const XIONG_MAO_SUI_PIAN:int = 38;
        public static const JEWEL_SCRAP:int = 39;
        public static const FIVE_ELE:int = 40;
        public static const XI_MEN_SUI_PIAN:int = 41;
        public static const CAN_NOT_GET:int = 42;
        public static const CAN_GET:int = 43;
        public static const ALREADY_GET:int = 44;
        public static const CAN_NOT_RESOLVE:int = 45;
        public static const BLUE:int = 46;
        public static const PURPLE:int = 47;
        public static const GOLDEN:int = 48;
        public static const ERROR:int = 49;
        public static const get_card_master_status:Object = {module:160, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_card_master_info:Object = {module:160, action:1, request:[], response:[[Utils.ShortUtil, Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const draw:Object = {module:160, action:2, request:[Utils.UByteUtil, Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.ShortUtil, Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const exchange_card:Object = {module:160, action:3, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil]};
        public static const get_ranking:Object = {module:160, action:4, request:[], response:[[Utils.StringUtil, Utils.IntUtil]]};
        public static const score_exchange:Object = {module:160, action:5, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const exchange_list:Object = {module:160, action:6, request:[], response:[[Utils.ByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const get_exchange_count:Object = {module:160, action:7, request:[], response:[[Utils.ShortUtil, Utils.ShortUtil]]};
        public static const get_card_score:Object = {module:160, action:8, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const resolve_card:Object = {module:160, action:9, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const exchange_count:Object = {module:160, action:10, request:[Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const card_master_collection_and_exchange_info:Object = {module:160, action:11, request:[], response:[[Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.ByteUtil]]};
        public static const exchange_card_master_collection_award:Object = {module:160, action:12, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_card_master_status", "get_player_card_master_info", "draw", "exchange_card", "get_ranking", "score_exchange", "exchange_list", "get_exchange_count", "get_card_score", "resolve_card", "exchange_count", "card_master_collection_and_exchange_info", "exchange_card_master_collection_award"];

        public function Mod_CardMaster_Base()
        {
            return;
        }// end function

    }
}
