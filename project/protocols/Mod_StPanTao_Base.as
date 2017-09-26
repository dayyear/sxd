package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StPanTao_Base extends Object
    {
        public static const CLOSE:int = 0;
        public static const CALL:int = 1;
        public static const NOTICE:int = 2;
        public static const OPEN:int = 3;
        public static const SUCCESS:int = 4;
        public static const UNCALLABLE:int = 5;
        public static const CALLED:int = 6;
        public static const NO_ENOUGH_INGOT:int = 7;
        public static const NO_ENOUGH_COIN:int = 8;
        public static const CALL_LIMIT:int = 9;
        public static const FUNCTION_NO_OPEN:int = 10;
        public static const SAT:int = 11;
        public static const SUM:int = 12;
        public static const MON:int = 13;
        public static const TUES:int = 14;
        public static const TRUE:int = 15;
        public static const FALSE:int = 16;
        public static const PERMISSION_DENIED:int = 17;
        public static const SETTED:int = 18;
        public static const UNSETTABLE:int = 19;
        public static const UNBOUGHT:int = 20;
        public static const BOUGHT:int = 21;
        public static const SET:int = 22;
        public static const UNBUYABLE:int = 23;
        public static const NEW_FIGHT:int = 24;
        public static const CONTINUE_FIGHT:int = 25;
        public static const PICKABLE_PAN_TAO:int = 26;
        public static const NO_POWER:int = 27;
        public static const LEVEL_LIMIT:int = 28;
        public static const FUNCTION_ON_OPEN:int = 29;
        public static const FINISHED:int = 30;
        public static const NEXT_WAVE:int = 31;
        public static const ACTIVITY_CLOSE:int = 32;
        public static const TIMES_USE_UP:int = 33;
        public static const COUNT_USE_UP:int = 34;
        public static const FREE_TIME:int = 35;
        public static const NOTHING_TO_PICKUP:int = 36;
        public static const GOTTEN:int = 37;
        public static const WAVE_ERROR:int = 38;
        public static const FAILURE:int = 39;
        public static const NEW_PAN_TAO_CALL:int = 40;
        public static const get_activity_step:Object = {module:250, action:0, request:[], response:[Utils.UByteUtil]};
        public static const notify_step:Object = {module:250, action:1, request:[], response:[Utils.UByteUtil]};
        public static const get_call_info:Object = {module:250, action:2, request:[], response:[Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const call_pan_tao:Object = {module:250, action:3, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const get_pan_tao_time_info:Object = {module:250, action:4, request:[], response:[[Utils.ByteUtil], [Utils.UByteUtil, Utils.UByteUtil], Utils.UByteUtil, Utils.UByteUtil]};
        public static const set_open_time:Object = {module:250, action:5, request:[[Utils.UByteUtil]], response:[Utils.UByteUtil]};
        public static const buy_open_time:Object = {module:250, action:6, request:[], response:[Utils.UByteUtil]};
        public static const get_challenge_info:Object = {module:250, action:7, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const fight:Object = {module:250, action:8, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil]};
        public static const buy:Object = {module:250, action:9, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const call_assistant:Object = {module:250, action:10, request:[], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const pickup_pan_tao:Object = {module:250, action:11, request:[], response:[Utils.UByteUtil]};
        public static const get_box_info:Object = {module:250, action:12, request:[], response:[Utils.IntUtil, Utils.ShortUtil, [Utils.ByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]]};
        public static const get_box_award:Object = {module:250, action:13, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const activate_call:Object = {module:250, action:14, request:[], response:[Utils.UByteUtil]};
        public static const deactivate_call:Object = {module:250, action:15, request:[], response:[Utils.UByteUtil]};
        public static const notify:Object = {module:250, action:16, request:[], response:[Utils.UByteUtil]};
        public static const get_call_top_list:Object = {module:250, action:17, request:[], response:[[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil]]};
        public static const onekey_pick_up_pan_tao:Object = {module:250, action:18, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_activity_step", "notify_step", "get_call_info", "call_pan_tao", "get_pan_tao_time_info", "set_open_time", "buy_open_time", "get_challenge_info", "fight", "buy", "call_assistant", "pickup_pan_tao", "get_box_info", "get_box_award", "activate_call", "deactivate_call", "notify", "get_call_top_list", "onekey_pick_up_pan_tao"];

        public function Mod_StPanTao_Base()
        {
            return;
        }// end function

    }
}
