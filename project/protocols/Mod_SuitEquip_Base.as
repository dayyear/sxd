package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SuitEquip_Base extends Object
    {
        public static const NODEPLOY:int = 0;
        public static const DEPLOY:int = 1;
        public static const REPLACE:int = 2;
        public static const SUCCESS:int = 3;
        public static const ALREADY_HAVE:int = 4;
        public static const NOT_ENOUGH_INGOT:int = 5;
        public static const ID_ERROR:int = 6;
        public static const NOT_ENOUGH_COIN:int = 7;
        public static const NOT_ENOUGH_ITEM:int = 8;
        public static const ALREADY_EQUIP:int = 9;
        public static const PLAYER_SUIT_ID_ERROR:int = 10;
        public static const NO_EQUIP:int = 11;
        public static const get_info:Object = {module:226, action:0, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.ShortUtil], [Utils.IntUtil, Utils.IntUtil]]};
        public static const buy_suit:Object = {module:226, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const equip_suit:Object = {module:226, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const unequip_suit:Object = {module:226, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_main_role_suit_list:Object = {module:226, action:4, request:[], response:[Utils.IntUtil, [Utils.IntUtil]]};
        public static const equip_main_role_suit:Object = {module:226, action:5, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const unequip_main_role_suit:Object = {module:226, action:6, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_info", "buy_suit", "equip_suit", "unequip_suit", "get_main_role_suit_list", "equip_main_role_suit", "unequip_main_role_suit"];

        public function Mod_SuitEquip_Base()
        {
            return;
        }// end function

    }
}
