package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Courtyard_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FUNCTION_NO_OPEN:int = 1;
        public static const CD_TIME:int = 2;
        public static const TIMES_USED_UP:int = 3;
        public static const NO_FRIEND:int = 4;
        public static const WATERED:int = 5;
        public static const NOTHING:int = 6;
        public static const NO_ENOUGH_INGOT:int = 7;
        public static const EXTEND_ALL:int = 8;
        public static const NO_SEED:int = 9;
        public static const SEQ_ERROR:int = 10;
        public static const ALREADY_PLANTED:int = 11;
        public static const NO_CD:int = 12;
        public static const NO_ENOUGH_COIN:int = 13;
        public static const SEED_ERROR:int = 14;
        public static const BUY_LIMIT:int = 15;
        public static const TRUE:int = 16;
        public static const FALSE:int = 17;
        public static const YES:int = 18;
        public static const NO:int = 19;
        public static const FISH_ERROR:int = 20;
        public static const STOLEN:int = 21;
        public static const YOUNG:int = 22;
        public static const BE_STOLEN:int = 23;
        public static const NO_EXISTS:int = 24;
        public static const NO_COMPLETE:int = 25;
        public static const ALREADY_GOTTEN:int = 26;
        public static const NO_FISH:int = 27;
        public static const FULL:int = 28;
        public static const TOO_MANY:int = 29;
        public static const RE_FINISH:int = 30;
        public static const get_player_info:Object = {module:212, action:0, request:[Utils.IntUtil], response:[Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil]};
        public static const watering:Object = {module:212, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const finish:Object = {module:212, action:2, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const extend:Object = {module:212, action:3, request:[], response:[Utils.UByteUtil]};
        public static const plant:Object = {module:212, action:4, request:[Utils.ByteUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const clean_cd:Object = {module:212, action:5, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const buy_seed:Object = {module:212, action:6, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_seed_list:Object = {module:212, action:7, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil], [Utils.ShortUtil, Utils.IntUtil]]};
        public static const get_bought_list:Object = {module:212, action:8, request:[], response:[[Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]]};
        public static const get_friend_list:Object = {module:212, action:9, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.UByteUtil, Utils.UByteUtil]]};
        public static const get_pool_fish_list:Object = {module:212, action:10, request:[Utils.IntUtil], response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const get_fish_list:Object = {module:212, action:11, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil]]};
        public static const get_orders:Object = {module:212, action:12, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil], Utils.UByteUtil, [Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.ShortUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const buy_fish:Object = {module:212, action:13, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const steal_fish:Object = {module:212, action:14, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_extra_order_award:Object = {module:212, action:15, request:[], response:[Utils.UByteUtil]};
        public static const raising:Object = {module:212, action:16, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const fishing:Object = {module:212, action:17, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const finish_order:Object = {module:212, action:18, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const notify_be_stolen_fish:Object = {module:212, action:19, request:[], response:[Utils.IntUtil, Utils.StringUtil]};
        public static const get_finished_fishes:Object = {module:212, action:20, request:[], response:[[Utils.IntUtil, Utils.ShortUtil]]};
        public static const Actions:Array = ["get_player_info", "watering", "finish", "extend", "plant", "clean_cd", "buy_seed", "get_seed_list", "get_bought_list", "get_friend_list", "get_pool_fish_list", "get_fish_list", "get_orders", "buy_fish", "steal_fish", "get_extra_order_award", "raising", "fishing", "finish_order", "notify_be_stolen_fish", "get_finished_fishes"];

        public function Mod_Courtyard_Base()
        {
            return;
        }// end function

    }
}
