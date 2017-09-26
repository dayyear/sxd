package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_CallOfBoss_Base extends Object
    {
        public static const ACTIVITY_OPEN:int = 0;
        public static const ACTIVITY_CLOSE:int = 1;
        public static const YES:int = 2;
        public static const NO:int = 3;
        public static const SUCCESS:int = 4;
        public static const ALREADY_DO:int = 5;
        public static const NO_ENOUGH_COIN:int = 6;
        public static const NO_ACTIVITY_TIME:int = 7;
        public static const FAILURE:int = 8;
        public static const get_activity_state:Object = {module:166, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const notify:Object = {module:166, action:1, request:[], response:[Utils.UByteUtil]};
        public static const get_contribute_info:Object = {module:166, action:2, request:[], response:[Utils.IntUtil]};
        public static const contribute:Object = {module:166, action:3, request:[], response:[Utils.UByteUtil]};
        public static const get_call_of_boss_flag:Object = {module:166, action:4, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_activity_state", "notify", "get_contribute_info", "contribute", "get_call_of_boss_flag"];

        public function Mod_CallOfBoss_Base()
        {
            return;
        }// end function

    }
}
