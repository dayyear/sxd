package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Tactics_Base extends Object
    {
        public static const XIAO_SHENG_SHUI:int = 0;
        public static const DA_SHENG_SHUI:int = 1;
        public static const COIN:int = 2;
        public static const INGOT:int = 3;
        public static const DOUBLE_SCORE:int = 4;
        public static const NOT_ONE_BOX:int = 5;
        public static const BUY_COST:int = 6;
        public static const SUCCEED:int = 7;
        public static const NOT_OPEN_FUN:int = 8;
        public static const NO_ENOUGH_ITEM:int = 9;
        public static const LEVEL_LIMIT:int = 10;
        public static const FAILED:int = 11;
        public static const NO_ENOUGH_INGOT:int = 12;
        public static const NO_ENOUGH_COIN:int = 13;
        public static const BUY_LIMIT:int = 14;
        public static const YES:int = 15;
        public static const NO:int = 16;
        public static const SUCCESS:int = 17;
        public static const SAME:int = 18;
        public static const DEPLOY_NO_OPEN:int = 19;
        public static const GRID_ERROR:int = 20;
        public static const NO_ENOUGH_POINT:int = 21;
        public static const NO_ENOUGH_LEVEL:int = 22;
        public static const get_tactics_info:Object = {module:299, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, [Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil], [Utils.UByteUtil]]};
        public static const draw_tactics_exp:Object = {module:299, action:1, request:[Utils.UByteUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil], [Utils.ByteUtil, Utils.ByteUtil], [Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil], [Utils.UByteUtil]]};
        public static const buy_item:Object = {module:299, action:2, request:[Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const get_tactics_deploy_info:Object = {module:299, action:11, request:[], response:[Utils.ShortUtil, [Utils.ShortUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const set_tactics_deploy:Object = {module:299, action:12, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const set_eye:Object = {module:299, action:13, request:[Utils.ShortUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const set_point:Object = {module:299, action:14, request:[Utils.ShortUtil, [Utils.ByteUtil, Utils.IntUtil]], response:[Utils.UByteUtil]};
        public static const reset_point:Object = {module:299, action:15, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const upgrade_eye_skill_level:Object = {module:299, action:16, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_tactics_info", "draw_tactics_exp", "buy_item", "get_tactics_deploy_info", "set_tactics_deploy", "set_eye", "set_point", "reset_point", "upgrade_eye_skill_level"];

        public function Mod_Tactics_Base()
        {
            return;
        }// end function

    }
}
