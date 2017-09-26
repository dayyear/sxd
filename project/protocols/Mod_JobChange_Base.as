package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_JobChange_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const THE_SAME:int = 1;
        public static const ROLE_LIMIT:int = 2;
        public static const LEVEL_LIMIT:int = 3;
        public static const SOURCE_GRID_EMPTY:int = 4;
        public static const FAILURE:int = 5;
        public static const get_job_change_info:Object = {module:308, action:0, request:[], response:[Utils.IntUtil, [Utils.IntUtil]]};
        public static const change:Object = {module:308, action:1, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_job_change_info", "change"];

        public function Mod_JobChange_Base()
        {
            return;
        }// end function

    }
}
