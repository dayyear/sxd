package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_MiracleFighters_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FUNCTION_UNOPEN:int = 1;
        public static const FAILED:int = 2;
        public static const NORMAL_PRACTICE:int = 3;
        public static const INGOT_PRACTICE:int = 4;
        public static const LACK_OF_COIN:int = 5;
        public static const LACK_OF_INGOT:int = 6;
        public static const LIMIT_OF_TIMES:int = 7;
        public static const LEVEL_UNOPEN:int = 8;
        public static const LACK_OF_YUPAI:int = 9;
        public static const DAN_ID_ERROR:int = 10;
        public static const PLAYER_ROLE_ID_ERROR:int = 11;
        public static const MAIN_ROLE_LIMIT:int = 12;
        public static const LIMIT:int = 13;
        public static const get_miracle_fighters_info:Object = {module:251, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const practice_miracle_fighters:Object = {module:251, action:1, request:[Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const break_through:Object = {module:251, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const equip:Object = {module:251, action:3, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const unlock:Object = {module:251, action:4, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_miracle_fighters_info", "practice_miracle_fighters", "break_through", "equip", "unlock"];

        public function Mod_MiracleFighters_Base()
        {
            return;
        }// end function

    }
}
