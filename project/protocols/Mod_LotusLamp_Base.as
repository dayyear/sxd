package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_LotusLamp_Base extends Object
    {
        public static const LAMP_OPEN:int = 0;
        public static const LAMP_CLOSE:int = 1;
        public static const SUCCESS:int = 2;
        public static const FAILURE:int = 3;
        public static const COLORFUL:int = 4;
        public static const GOLD:int = 5;
        public static const PURPLE:int = 6;
        public static const BLUE:int = 7;
        public static const GREEN:int = 8;
        public static const STATE_POINT:int = 9;
        public static const XIAN_LING:int = 10;
        public static const COIN:int = 11;
        public static const QI_HUN:int = 12;
        public static const ZHANMA_SUIPIAN:int = 13;
        public static const FATE:int = 14;
        public static const ITEM:int = 15;
        public static const ROLE_SCRAP:int = 16;
        public static const NEI_DAN:int = 17;
        public static const XUN_YANG_LING:int = 18;
        public static const XING_HUN:int = 19;
        public static const HOUWANG_SUIPIAN:int = 20;
        public static const NOT_ENOUGH_INGOT:int = 21;
        public static const PLAYER_LEVEL_LIMIT:int = 22;
        public static const TIMES_USED_UP:int = 23;
        public static const NOT_ACTIVITY_TIME:int = 24;
        public static const ACTIVITY_OPEN:int = 25;
        public static const ACTIVITY_CLOSE:int = 26;
        public static const get_activity_time:Object = {module:140, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const enter_activity:Object = {module:140, action:1, request:[], response:[Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const exit_activity:Object = {module:140, action:2, request:[], response:[Utils.UByteUtil]};
        public static const bloom:Object = {module:140, action:3, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const other_bloom_notify:Object = {module:140, action:4, request:[], response:[Utils.StringUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify:Object = {module:140, action:5, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_activity_time", "enter_activity", "exit_activity", "bloom", "other_bloom_notify", "notify"];

        public function Mod_LotusLamp_Base()
        {
            return;
        }// end function

    }
}
