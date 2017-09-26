package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_MagicArms_Base extends Object
    {
        public static const NO_AWAKEN:int = 0;
        public static const NO_ENOUGH_COINS:int = 1;
        public static const FUNCTION_NO_OPEN:int = 2;
        public static const SUCCESS:int = 3;
        public static const ALREADY_EQUIP:int = 4;
        public static const PLAYER_ID_ERROR:int = 5;
        public static const PARTNER_FUNCTION_NO_OPEN:int = 6;
        public static const NO_EQUIP:int = 7;
        public static const AWAKEN:int = 8;
        public static const YES_ACT:int = 9;
        public static const NO_ACT:int = 10;
        public static const NOT_ENOUGH_COIN:int = 11;
        public static const NOT_ENOUGH_SCRAP:int = 12;
        public static const NOT_ENOUGH_INGOT:int = 13;
        public static const NOT_ENOUGH_BUFF:int = 14;
        public static const MAX_LEVEL:int = 15;
        public static const BUFF_ERROR:int = 16;
        public static const FAILED:int = 17;
        public static const FULL_BUY_TIME:int = 18;
        public static const SUCCESS_FAILED:int = 19;
        public static const FIRE_NUMBER_LIMIT:int = 20;
        public static const buy_magic_arms:Object = {module:131, action:0, request:[], response:[Utils.UByteUtil]};
        public static const equip_magic_arms:Object = {module:131, action:1, request:[Utils.IntUtil, Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const unequip_magic_arms:Object = {module:131, action:2, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const get_magic_arms_info:Object = {module:131, action:3, request:[], response:[Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.UByteUtil]};
        public static const get_player_magic_arms_info:Object = {module:131, action:4, request:[Utils.ShortUtil], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const do_probe:Object = {module:131, action:5, request:[Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil]], response:[Utils.UByteUtil, [Utils.ShortUtil, Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const get_buff_number:Object = {module:131, action:6, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const buy_buff_number:Object = {module:131, action:7, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const get_finished_missions:Object = {module:131, action:8, request:[], response:[[Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil]};
        public static const do_fire:Object = {module:131, action:9, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const smelt:Object = {module:131, action:10, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["buy_magic_arms", "equip_magic_arms", "unequip_magic_arms", "get_magic_arms_info", "get_player_magic_arms_info", "do_probe", "get_buff_number", "buy_buff_number", "get_finished_missions", "do_fire", "smelt"];

        public function Mod_MagicArms_Base()
        {
            return;
        }// end function

    }
}
