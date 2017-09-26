package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Mount_Base extends Object
    {
        public static const ACTION_SUCCESS:int = 0;
        public static const NO_TRANSPORTATION:int = 1;
        public static const NO_TRANSPORT:int = 2;
        public static const COIN:int = 3;
        public static const INGOT:int = 4;
        public static const ITEM:int = 5;
        public static const SUCCESS:int = 6;
        public static const HAVE_BUY:int = 7;
        public static const NOT_ENOUGH_COIN:int = 8;
        public static const NOT_ENOUGH_INGOT:int = 9;
        public static const NOT_ENOUGH_ITEM:int = 10;
        public static const NO_LOCK:int = 11;
        public static const YES:int = 12;
        public static const NO:int = 13;
        public static const TIMES_LIMIT:int = 14;
        public static const FAILED:int = 15;
        public static const LACK_OF_MOUNT_LOCK:int = 16;
        public static const get_player_mount_list:Object = {module:84, action:1, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const update_mount_transport:Object = {module:84, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const dismount_transport:Object = {module:84, action:3, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const buy_mount:Object = {module:84, action:4, request:[Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const get_mount_scrap:Object = {module:84, action:5, request:[], response:[[Utils.IntUtil, Utils.ShortUtil]]};
        public static const is_player_has_zhan_ma:Object = {module:84, action:6, request:[], response:[Utils.UByteUtil]};
        public static const get_player_own_mount_suit:Object = {module:84, action:10, request:[], response:[[Utils.ShortUtil], [Utils.ShortUtil], [Utils.ShortUtil], [Utils.ShortUtil]]};
        public static const is_player_has_hou_wang:Object = {module:84, action:11, request:[], response:[Utils.UByteUtil]};
        public static const get_mount_lock_count:Object = {module:84, action:12, request:[], response:[Utils.IntUtil]};
        public static const lucky_day_ingot_buy_mount:Object = {module:84, action:13, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const mount_lock_exchange_mount:Object = {module:84, action:14, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_player_mount_list", "update_mount_transport", "dismount_transport", "buy_mount", "get_mount_scrap", "is_player_has_zhan_ma", "get_player_own_mount_suit", "is_player_has_hou_wang", "get_mount_lock_count", "lucky_day_ingot_buy_mount", "mount_lock_exchange_mount"];

        public function Mod_Mount_Base()
        {
            return;
        }// end function

    }
}
