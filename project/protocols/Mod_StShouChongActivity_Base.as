package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StShouChongActivity_Base extends Object
    {
        public static const ACTIVITY_OPEN:int = 0;
        public static const ACTIVITY_CLOSE:int = 1;
        public static const COIN:int = 2;
        public static const SKILL:int = 3;
        public static const FAME:int = 4;
        public static const ST_SPEAKER:int = 5;
        public static const STATE_POINT:int = 6;
        public static const XIAN_LING:int = 7;
        public static const DRAGONBALL_SCRAP:int = 8;
        public static const BLOODLINE_ESSENCE:int = 9;
        public static const DAO_YUAN:int = 10;
        public static const NEIDAN:int = 11;
        public static const QIHUN:int = 12;
        public static const HUANGYUPAI:int = 13;
        public static const ITEM:int = 14;
        public static const POWER:int = 15;
        public static const GOTTEN:int = 16;
        public static const NO_GOTTEN:int = 17;
        public static const NO_CHARGE:int = 18;
        public static const SUCCESS:int = 19;
        public static const ALREADY_GOTTEN:int = 20;
        public static const NO_SHOU_CHONG_LI_BAO:int = 21;
        public static const PACK_FULL:int = 22;
        public static const FAILURE:int = 23;
        public static const NOTHING_TO_GOT:int = 24;
        public static const NO_CHARGE_TODAY:int = 25;
        public static const NOT_EOUGHT_SCRAP:int = 26;
        public static const ERROR:int = 27;
        public static const get_activity_state:Object = {module:153, action:0, request:[], response:[Utils.UByteUtil]};
        public static const notify:Object = {module:153, action:1, request:[], response:[Utils.UByteUtil]};
        public static const get_player_shou_chong_info:Object = {module:153, action:2, request:[], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.ShortUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const get_shou_chong_li_bao:Object = {module:153, action:3, request:[], response:[Utils.UByteUtil]};
        public static const get_shou_chong_extra_award:Object = {module:153, action:4, request:[], response:[Utils.UByteUtil]};
        public static const notify_charge_result:Object = {module:153, action:5, request:[], response:[Utils.UByteUtil]};
        public static const exchange_attribute_stone:Object = {module:153, action:6, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_activity_state", "notify", "get_player_shou_chong_info", "get_shou_chong_li_bao", "get_shou_chong_extra_award", "notify_charge_result", "exchange_attribute_stone"];

        public function Mod_StShouChongActivity_Base()
        {
            return;
        }// end function

    }
}
