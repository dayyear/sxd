package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StEightImmortals_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const NORMAL:int = 2;
        public static const ASSISTANT:int = 3;
        public static const ENEMY:int = 4;
        public static const HEALTH_ITEM:int = 5;
        public static const AWARD:int = 6;
        public static const ONE:int = 7;
        public static const TWO:int = 8;
        public static const THREE:int = 9;
        public static const SUCCESS:int = 10;
        public static const FUNCTION_NO_OPEN:int = 11;
        public static const MISSION_LOCK:int = 12;
        public static const LEVEL_LIMIT:int = 13;
        public static const ERROR_MISSION:int = 14;
        public static const ERROR:int = 15;
        public static const CAN_NOT_CHANGE_ROLES:int = 16;
        public static const EMPTY_HEALTH:int = 17;
        public static const NO_ENTER_MISSION:int = 18;
        public static const HEALTH_ITEM_STAGE:int = 19;
        public static const ASSISTANT_STAGE:int = 20;
        public static const NOTHING_TO_FIGHT:int = 21;
        public static const ALREADY_GOT:int = 22;
        public static const STAR_LEVEL_ERROR:int = 23;
        public static const NO_COMPLETE:int = 24;
        public static const ACCEPT:int = 25;
        public static const REJECT:int = 26;
        public static const NOTHING_TO_ACCEPT:int = 27;
        public static const ALREADY_ACCPET:int = 28;
        public static const NO_HEALTH_ITEM:int = 29;
        public static const ALREADY_USE:int = 30;
        public static const TRUE:int = 31;
        public static const FALSE:int = 32;
        public static const MISSION_COMPLETE:int = 33;
        public static const A:int = 34;
        public static const B:int = 35;
        public static const NO_TIMES:int = 36;
        public static const MISSION_ERROR:int = 37;
        public static const FAILURE:int = 38;
        public static const get_finished_missions:Object = {module:129, action:0, request:[Utils.UByteUtil], response:[[Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil]]};
        public static const enter_mission:Object = {module:129, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil], [Utils.ByteUtil], Utils.ByteUtil, Utils.ByteUtil]};
        public static const fight:Object = {module:129, action:2, request:[], response:[Utils.UByteUtil, [[Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil]], Utils.ByteUtil, Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil], [Utils.ByteUtil], Utils.IntUtil, Utils.ShortUtil]};
        public static const get_award:Object = {module:129, action:3, request:[Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const accept_assistant:Object = {module:129, action:4, request:[Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const use_health_item:Object = {module:129, action:5, request:[], response:[Utils.UByteUtil]};
        public static const get_period_one_flag:Object = {module:129, action:6, request:[], response:[Utils.UByteUtil]};
        public static const notify_period_one_finished:Object = {module:129, action:7, request:[], response:[Utils.UByteUtil]};
        public static const get_period_two_flag:Object = {module:129, action:8, request:[], response:[Utils.UByteUtil]};
        public static const notify_period_two_finished:Object = {module:129, action:9, request:[], response:[Utils.UByteUtil]};
        public static const use_health_prop:Object = {module:129, action:10, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const Actions:Array = ["get_finished_missions", "enter_mission", "fight", "get_award", "accept_assistant", "use_health_item", "get_period_one_flag", "notify_period_one_finished", "get_period_two_flag", "notify_period_two_finished", "use_health_prop"];

        public function Mod_StEightImmortals_Base()
        {
            return;
        }// end function

    }
}
