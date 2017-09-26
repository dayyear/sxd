package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_BecomeImmortal_Base extends Object
    {
        public static const UPDATE_SUCCESS:int = 0;
        public static const UPDATE_FAILED:int = 1;
        public static const NOT_ENOUGH_NE_DAN:int = 2;
        public static const NOT_COMPLETE_MONSTER:int = 3;
        public static const MAX_LEVEL:int = 4;
        public static const FAILED:int = 5;
        public static const SUCCESS:int = 6;
        public static const NOT_ENOUGH_INGOT:int = 7;
        public static const STAGE_COMPLETE:int = 8;
        public static const INSUFFICIENT_KEY:int = 9;
        public static const NOT_CHALLENGE:int = 10;
        public static const NOT_IMMORTAL:int = 11;
        public static const BECOME_IMMORTAL:int = 12;
        public static const get_become_immortal_data:Object = {module:134, action:0, request:[], response:[Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const update_become_immortal:Object = {module:134, action:1, request:[], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const buy_ne_dan:Object = {module:134, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_training_add:Object = {module:134, action:3, request:[], response:[Utils.ShortUtil]};
        public static const challenge:Object = {module:134, action:4, request:[], response:[Utils.UByteUtil]};
        public static const open:Object = {module:134, action:5, request:[], response:[Utils.UByteUtil]};
        public static const auto_update_become_immortal:Object = {module:134, action:7, request:[], response:[Utils.UByteUtil, [Utils.ShortUtil], Utils.IntUtil]};
        public static const get_player_3_way:Object = {module:134, action:8, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_become_immortal:Object = {module:134, action:9, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil]};
        public static const Actions:Array = ["get_become_immortal_data", "update_become_immortal", "buy_ne_dan", "get_training_add", "challenge", "open", "auto_update_become_immortal", "get_player_3_way", "notify_become_immortal"];

        public function Mod_BecomeImmortal_Base()
        {
            return;
        }// end function

    }
}
