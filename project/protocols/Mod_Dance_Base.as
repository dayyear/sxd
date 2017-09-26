package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Dance_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const ERROR:int = 1;
        public static const get_dance_info:Object = {module:76, action:0, request:[], response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const start_dance:Object = {module:76, action:1, request:[], response:[Utils.UByteUtil]};
        public static const receive_award:Object = {module:76, action:2, request:[], response:[Utils.UByteUtil]};
        public static const notify_start_dance:Object = {module:76, action:3, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const notify_dance_status:Object = {module:76, action:4, request:[], response:[Utils.ByteUtil]};
        public static const get_activity_open_timestamp:Object = {module:76, action:5, request:[], response:[[Utils.IntUtil]]};
        public static const Actions:Array = ["get_dance_info", "start_dance", "receive_award", "notify_start_dance", "notify_dance_status", "get_activity_open_timestamp"];

        public function Mod_Dance_Base()
        {
            return;
        }// end function

    }
}
