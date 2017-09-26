package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Role_Base extends Object
    {
        public static const DEPLOY:int = 0;
        public static const NODEPLOY:int = 1;
        public static const REPLACE:int = 2;
        public static const YES:int = 3;
        public static const NO:int = 4;
        public static const SUCCEED:int = 5;
        public static const FAILED:int = 6;
        public static const GHOSTLY_TOWER_LOCK:int = 7;
        public static const IN_PARTNER_PRACTICE:int = 8;
        public static const SUCCESS:int = 9;
        public static const ROLE_NO_EXIT:int = 10;
        public static const NO_PLAYER_ROLE:int = 11;
        public static const IS_DOWN:int = 12;
        public static const IS_MAIN_ROLE:int = 13;
        public static const IS_FOLLOW_ROLE:int = 14;
        public static const NOT_OPEN:int = 15;
        public static const EARCH_GOBLIN:int = 16;
        public static const TIAN_GANG:int = 17;
        public static const get_town_player_info:Object = {module:5, action:1, request:[], response:[Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_role_list:Object = {module:5, action:2, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, [Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil], [Utils.IntUtil], Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]]};
        public static const down_partners:Object = {module:5, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_role_list_simpe:Object = {module:5, action:4, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const get_role_id_list:Object = {module:5, action:5, request:[], response:[[Utils.IntUtil, Utils.ShortUtil]]};
        public static const set_follow_role:Object = {module:5, action:6, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const exp_change_notify:Object = {module:5, action:7, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_simple_role_list:Object = {module:5, action:8, request:[Utils.IntUtil], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const get_role_war_attribute:Object = {module:5, action:9, request:[Utils.IntUtil], response:[Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_default_deploy_first_attack:Object = {module:5, action:10, request:[Utils.IntUtil], response:[Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_role_scrap_info:Object = {module:5, action:11, request:[], response:[[Utils.ByteUtil, Utils.IntUtil]]};
        public static const is_partners_invite:Object = {module:5, action:12, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const get_player_role_scrap_number:Object = {module:5, action:13, request:[Utils.ByteUtil], response:[Utils.IntUtil]};
        public static const Actions:Array = ["get_town_player_info", "get_role_list", "down_partners", "get_role_list_simpe", "get_role_id_list", "set_follow_role", "exp_change_notify", "get_simple_role_list", "get_role_war_attribute", "get_default_deploy_first_attack", "get_player_role_scrap_info", "is_partners_invite", "get_player_role_scrap_number"];

        public function Mod_Role_Base()
        {
            return;
        }// end function

    }
}
