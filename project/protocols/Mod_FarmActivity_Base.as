package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_FarmActivity_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NOT_ENOUGH_NUM:int = 1;
        public static const HAVE_DONE:int = 2;
        public static const info:Object = {module:82, action:0, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil]]};
        public static const get_award:Object = {module:82, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const complete_number:Object = {module:82, action:2, request:[], response:[Utils.IntUtil]};
        public static const get_activity_time:Object = {module:82, action:3, request:[], response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const farm_activity_completed:Object = {module:82, action:4, request:[], response:[Utils.IntUtil, Utils.ByteUtil]};
        public static const Actions:Array = ["info", "get_award", "complete_number", "get_activity_time", "farm_activity_completed"];

        public function Mod_FarmActivity_Base()
        {
            return;
        }// end function

    }
}
