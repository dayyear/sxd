package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SaintAreaTown_Base extends Object
    {
        public static const TRUE:int = 0;
        public static const FALSE:int = 1;
        public static const SUCCESS:int = 2;
        public static const FAILED:int = 3;
        public static const FULL:int = 4;
        public static const NOT_ENOUGH_INGOT:int = 5;
        public static const enter_town:Object = {module:294, action:0, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const notify_enter_town:Object = {module:294, action:1, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.ShortUtil]};
        public static const leave_town:Object = {module:294, action:2, request:[], response:[Utils.UByteUtil]};
        public static const notify_leave_town:Object = {module:294, action:3, request:[], response:[Utils.IntUtil]};
        public static const move_to:Object = {module:294, action:4, request:[Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil], response:[]};
        public static const notify_move_to:Object = {module:294, action:5, request:[], response:[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const get_players:Object = {module:294, action:6, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.ShortUtil]]};
        public static const notify_image_change:Object = {module:294, action:7, request:[], response:[Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil]};
        public static const get_player_info:Object = {module:294, action:8, request:[Utils.IntUtil], response:[Utils.ShortUtil]};
        public static const notify_dance_action:Object = {module:294, action:9, request:[], response:[[Utils.IntUtil], Utils.IntUtil, Utils.ByteUtil, Utils.StringUtil]};
        public static const Actions:Array = ["enter_town", "notify_enter_town", "leave_town", "notify_leave_town", "move_to", "notify_move_to", "get_players", "notify_image_change", "get_player_info", "notify_dance_action"];

        public function Mod_SaintAreaTown_Base()
        {
            return;
        }// end function

    }
}
