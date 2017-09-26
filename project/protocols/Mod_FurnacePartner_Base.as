package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_FurnacePartner_Base extends Object
    {
        public static const DEPLOY:int = 0;
        public static const NO_DEPLOY:int = 1;
        public static const REPLACE:int = 2;
        public static const YES:int = 3;
        public static const NO:int = 4;
        public static const CANNT_GET:int = 5;
        public static const SUCCESS:int = 6;
        public static const NOT_ENOUGH_ITEM:int = 7;
        public static const NOT_ENOUGH_PLAYER_LEVEL:int = 8;
        public static const PLAYER_ROLE_NOT_EXIST:int = 9;
        public static const MAX_LEVEL:int = 10;
        public static const EARCH_GOBLIN_LIMIT:int = 11;
        public static const AWARD_SUCCESS:int = 12;
        public static const AWARD_FAILED:int = 13;
        public static const TRANS_TO:int = 14;
        public static const FROM_TRANS:int = 15;
        public static const NORMAL:int = 16;
        public static const INGOT:int = 17;
        public static const NOT_ENOUGH_COIN:int = 18;
        public static const NOT_ENOUGH_INGOT:int = 19;
        public static const NOT_ENOUGH_VIP_LEVEL:int = 20;
        public static const EXCL_ARTI_LV_LIMIT:int = 21;
        public static const HAVE_INHERIT:int = 22;
        public static const HAVE_BE_INHERIT:int = 23;
        public static const INHERIT_SELF:int = 24;
        public static const NOT_ENOUGH:int = 25;
        public static const FULL_LEVEL:int = 26;
        public static const OTHER_POSITION_LIMIT:int = 27;
        public static const FAILED:int = 28;
        public static const get_furnace_partner_info:Object = {module:103, action:0, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ShortUtil]]};
        public static const upgrade_earch_goblin_level:Object = {module:103, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const upgrade_tian_gang_level:Object = {module:103, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_challenge_game_award:Object = {module:103, action:3, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const player_role_excl_arti_inherit_list:Object = {module:103, action:4, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const inherit_excl_arti:Object = {module:103, action:5, request:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const get_all_cost_data:Object = {module:103, action:6, request:[], response:[[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]]]};
        public static const get_player_role_furnace_partner_info:Object = {module:103, action:7, request:[Utils.IntUtil], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ShortUtil]]};
        public static const get_player_role_sage_info:Object = {module:103, action:8, request:[], response:[[Utils.ShortUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil], [Utils.ByteUtil], Utils.IntUtil], Utils.IntUtil]};
        public static const upgrade_role_sage_level:Object = {module:103, action:9, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ByteUtil], Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const Actions:Array = ["get_furnace_partner_info", "upgrade_earch_goblin_level", "upgrade_tian_gang_level", "get_challenge_game_award", "player_role_excl_arti_inherit_list", "inherit_excl_arti", "get_all_cost_data", "get_player_role_furnace_partner_info", "get_player_role_sage_info", "upgrade_role_sage_level"];

        public function Mod_FurnacePartner_Base()
        {
            return;
        }// end function

    }
}
