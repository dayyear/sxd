package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_RobMoney_Base extends Object
    {
        public static const NOT_SEARCH:int = 0;
        public static const SEARCHED:int = 1;
        public static const BLUE:int = 2;
        public static const PURPLE:int = 3;
        public static const GOLD:int = 4;
        public static const SUCCESS:int = 5;
        public static const FUNCTION_NO_OPEN:int = 6;
        public static const NOT_ACTIVITY_TIME:int = 7;
        public static const NOT_ENOUGH_TIMES:int = 8;
        public static const NOT_ENOUGH_INGOT:int = 9;
        public static const HAVE_APPLY:int = 10;
        public static const FAILURE:int = 11;
        public static const NOT_ENOUGH_BUY_TIMES:int = 12;
        public static const ADD:int = 13;
        public static const DELETE:int = 14;
        public static const NOT_ONLINE:int = 15;
        public static const IS_APPROVE:int = 16;
        public static const CANCEL_APPLY:int = 17;
        public static const NOT_ENOUGH_APPLY_TIMES:int = 18;
        public static const APPLY:int = 19;
        public static const REJECT:int = 20;
        public static const OPEN:int = 21;
        public static const CLOSE:int = 22;
        public static const get_rob_money_info:Object = {module:314, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const search:Object = {module:314, action:1, request:[], response:[[Utils.IntUtil], Utils.UByteUtil]};
        public static const rob:Object = {module:314, action:2, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const buy_rob_times:Object = {module:314, action:3, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_refresh_ship:Object = {module:314, action:4, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil]]};
        public static const friend_list:Object = {module:314, action:5, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.IntUtil]]};
        public static const apply_friend:Object = {module:314, action:6, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const approve_apply:Object = {module:314, action:7, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const reject_apply:Object = {module:314, action:8, request:[Utils.IntUtil], response:[]};
        public static const notify_apply:Object = {module:314, action:9, request:[], response:[Utils.IntUtil, Utils.StringUtil, [Utils.UByteUtil], [Utils.IntUtil, Utils.IntUtil]]};
        public static const notify_be_apply:Object = {module:314, action:10, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil]};
        public static const notify_activity_status:Object = {module:314, action:11, request:[], response:[Utils.UByteUtil]};
        public static const open_panel:Object = {module:314, action:12, request:[], response:[]};
        public static const close_panel:Object = {module:314, action:13, request:[], response:[]};
        public static const Actions:Array = ["get_rob_money_info", "search", "rob", "buy_rob_times", "notify_refresh_ship", "friend_list", "apply_friend", "approve_apply", "reject_apply", "notify_apply", "notify_be_apply", "notify_activity_status", "open_panel", "close_panel"];

        public function Mod_RobMoney_Base()
        {
            return;
        }// end function

    }
}
