package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ChildrenTask_Base extends Object
    {
        public static const IS_TRUE:int = 0;
        public static const IS_FALSE:int = 1;
        public static const SUCCESS:int = 2;
        public static const NOT_COMPLETE:int = 3;
        public static const HAD_GET:int = 4;
        public static const FAILURE:int = 5;
        public static const NO_TIMES:int = 6;
        public static const HAD_COMPLETE:int = 7;
        public static const get_children_task_info:Object = {module:315, action:0, request:[Utils.IntUtil], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.UByteUtil]};
        public static const get_award:Object = {module:315, action:1, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const refresh_task:Object = {module:315, action:2, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const notify_complete_task:Object = {module:315, action:3, request:[], response:[Utils.IntUtil]};
        public static const Actions:Array = ["get_children_task_info", "get_award", "refresh_task", "notify_complete_task"];

        public function Mod_ChildrenTask_Base()
        {
            return;
        }// end function

    }
}
