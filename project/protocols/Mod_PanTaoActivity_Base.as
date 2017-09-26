package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_PanTaoActivity_Base extends Object
    {
        public static const ACTIVITY_OPEN:int = 0;
        public static const ACTIVITY_CLOSE:int = 1;
        public static const NEW_FIGHT:int = 2;
        public static const CONTINUE_FIGHT:int = 3;
        public static const PICKABLE_PAN_TAO:int = 4;
        public static const NO_POWER:int = 5;
        public static const LEVEL_LIMIT:int = 6;
        public static const FUNCTION_ON_OPEN:int = 7;
        public static const FINISHED:int = 8;
        public static const NEXT_WAVE:int = 9;
        public static const TIMES_USE_UP:int = 10;
        public static const YES:int = 11;
        public static const NO:int = 12;
        public static const SUCCESS:int = 13;
        public static const NOT_ENOUGH_WAVE:int = 14;
        public static const HAD_GET:int = 15;
        public static const FAILED:int = 16;
        public static const COUNT_USE_UP:int = 17;
        public static const NO_ENOUGH_INGOT:int = 18;
        public static const NOTHING_TO_PICKUP:int = 19;
        public static const get_activity_state:Object = {module:149, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify:Object = {module:149, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_pan_tao_info:Object = {module:149, action:2, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const fight:Object = {module:149, action:3, request:[], response:[Utils.UByteUtil, [[Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil]], Utils.ByteUtil, Utils.ShortUtil]};
        public static const wave_extra_award_info:Object = {module:149, action:4, request:[], response:[Utils.ShortUtil, [Utils.ShortUtil, Utils.UByteUtil]]};
        public static const get_wave_extra_award:Object = {module:149, action:5, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const buy_challenge_count:Object = {module:149, action:6, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const buy_assistant:Object = {module:149, action:7, request:[], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const pickup_pan_tao:Object = {module:149, action:8, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_activity_state", "notify", "get_player_pan_tao_info", "fight", "wave_extra_award_info", "get_wave_extra_award", "buy_challenge_count", "buy_assistant", "pickup_pan_tao"];

        public function Mod_PanTaoActivity_Base()
        {
            return;
        }// end function

    }
}
