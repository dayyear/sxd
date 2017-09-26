package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_RewardTask_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCESS:int = 2;
        public static const FUNCTION_NO_OPEN:int = 3;
        public static const CLOSE:int = 4;
        public static const COUNT_LIMIT:int = 5;
        public static const REACCEPTED:int = 6;
        public static const TASK_ERROR:int = 7;
        public static const GOTTEN:int = 8;
        public static const PACK_FULL:int = 9;
        public static const NO_COMPLETE:int = 10;
        public static const NOTHING:int = 11;
        public static const TIMES_USED_UP:int = 12;
        public static const NO_ENOUGH_INGOT:int = 13;
        public static const get_reward_task_info:Object = {module:364, action:0, request:[], response:[[Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]], Utils.UByteUtil, Utils.ShortUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const accept:Object = {module:364, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_award:Object = {module:364, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_extra_award:Object = {module:364, action:3, request:[], response:[Utils.UByteUtil]};
        public static const reset:Object = {module:364, action:4, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_reward_task_info", "accept", "get_award", "get_extra_award", "reset"];

        public function Mod_RewardTask_Base()
        {
            return;
        }// end function

    }
}
