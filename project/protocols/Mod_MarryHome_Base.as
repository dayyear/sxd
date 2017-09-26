package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_MarryHome_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NO_ENOUGH_COIN:int = 1;
        public static const NO_ENOUGH_INGOT:int = 2;
        public static const NON_MARRY_STATUS:int = 3;
        public static const ALREADY_OWNED:int = 4;
        public static const OTHER_ADORNING:int = 5;
        public static const ONE:int = 6;
        public static const TWO:int = 7;
        public static const RECOVERY:int = 8;
        public static const POSITION_REPEAT:int = 9;
        public static const PLACE_ERROE:int = 10;
        public static const ALREADY_APPROVE:int = 11;
        public static const ALREADY_GET:int = 12;
        public static const HOME_TYPE_CHANGE:int = 13;
        public static const SAVE_FURNITURE_ADORN:int = 14;
        public static const OPEN:int = 15;
        public static const MAINTAINCE:int = 16;
        public static const CLOSE:int = 17;
        public static const NON_ACTIVITY_TIME:int = 18;
        public static const OTHER_GET:int = 19;
        public static const TODAY_LIMIT:int = 20;
        public static const ITEM_PACK_FULL:int = 21;
        public static const FUNCTION_NO_OPEN:int = 22;
        public static const FAILURE:int = 23;
        public static const get_self_home_info:Object = {module:210, action:0, request:[Utils.IntUtil], response:[Utils.ByteUtil]};
        public static const buy_home:Object = {module:210, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_player_home_info:Object = {module:210, action:2, request:[Utils.IntUtil], response:[Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil], Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_furniture_warehouse:Object = {module:210, action:3, request:[], response:[[Utils.IntUtil, Utils.ShortUtil]]};
        public static const get_player_house_keeper_warehouse:Object = {module:210, action:4, request:[], response:[[Utils.IntUtil, Utils.ShortUtil]]};
        public static const save_furniture_adorn:Object = {module:210, action:5, request:[[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil]], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const auto_recovery:Object = {module:210, action:6, request:[], response:[]};
        public static const buy_furniture:Object = {module:210, action:7, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const get_total_home_list:Object = {module:210, action:8, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil]]};
        public static const approve_player_home:Object = {module:210, action:9, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_house_floor_warehouse:Object = {module:210, action:10, request:[], response:[[Utils.IntUtil, Utils.ShortUtil]]};
        public static const get_furniture_effect:Object = {module:210, action:11, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const player_start_adorn_furniture:Object = {module:210, action:12, request:[], response:[Utils.UByteUtil]};
        public static const player_end_adorn_furniture:Object = {module:210, action:13, request:[], response:[]};
        public static const notify:Object = {module:210, action:14, request:[], response:[Utils.UByteUtil]};
        public static const get_player_home_type:Object = {module:210, action:15, request:[Utils.IntUtil], response:[Utils.ByteUtil, Utils.UByteUtil]};
        public static const get_player_furniture_list:Object = {module:210, action:16, request:[], response:[[Utils.ShortUtil]]};
        public static const get_activity_furniture_effect:Object = {module:210, action:17, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const batch_get_furniture_effect:Object = {module:210, action:18, request:[], response:[[Utils.IntUtil, Utils.IntUtil]]};
        public static const get_cake:Object = {module:210, action:19, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["get_self_home_info", "buy_home", "get_player_home_info", "get_player_furniture_warehouse", "get_player_house_keeper_warehouse", "save_furniture_adorn", "auto_recovery", "buy_furniture", "get_total_home_list", "approve_player_home", "get_player_house_floor_warehouse", "get_furniture_effect", "player_start_adorn_furniture", "player_end_adorn_furniture", "notify", "get_player_home_type", "get_player_furniture_list", "get_activity_furniture_effect", "batch_get_furniture_effect", "get_cake"];

        public function Mod_MarryHome_Base()
        {
            return;
        }// end function

    }
}
