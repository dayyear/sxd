package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StUndergroundPalace_Base extends Object
    {
        public static const SEQUENCE_A:int = 0;
        public static const SEQUENCE_B:int = 1;
        public static const SEQUENCE_C:int = 2;
        public static const SEQUENCE_D:int = 3;
        public static const SEQUENCE_NULL:int = 4;
        public static const SUCCESS:int = 5;
        public static const ST_UNION_LEVEL_LIMIT:int = 6;
        public static const FAILED:int = 7;
        public static const OPEN:int = 8;
        public static const UNOPEN:int = 9;
        public static const HAS_NO_MONSTER:int = 10;
        public static const FIGHT_EVENT:int = 11;
        public static const DICE_EVENT:int = 12;
        public static const GUESS_EVENT:int = 13;
        public static const ANSWER_EVENT:int = 14;
        public static const HAS_NO_USED_BOX:int = 15;
        public static const DIG_TIMES_LIMIT:int = 16;
        public static const ITEM_PACK_FULL:int = 17;
        public static const BUY_TIMES_LIMIT:int = 18;
        public static const LACK_OF_INGOT:int = 19;
        public static const ACTIVITY_TIME_OVER:int = 20;
        public static const DIG_TIME_OVER:int = 21;
        public static const ST_UNION_ANNOUNCEMENT:int = 22;
        public static const ALL_SERVER_ANNOUNCEMENT:int = 23;
        public static const ACTIVITY_OPEN:int = 24;
        public static const ACTIVITY_CLOSE:int = 25;
        public static const get_activity_info:Object = {module:255, action:0, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const get_player_st_underground_palace_info:Object = {module:255, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil], [Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil], [Utils.IntUtil, Utils.ByteUtil]]};
        public static const hit_monster:Object = {module:255, action:2, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], Utils.ByteUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil]};
        public static const handler_event:Object = {module:255, action:3, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const dig:Object = {module:255, action:4, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const buy_dig_times:Object = {module:255, action:5, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const notify_box_change:Object = {module:255, action:6, request:[], response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.IntUtil, Utils.ByteUtil]]};
        public static const notify_monster_position_change:Object = {module:255, action:7, request:[], response:[Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const notify_activity_over:Object = {module:255, action:8, request:[], response:[Utils.UByteUtil]};
        public static const notify_refresh_all_box:Object = {module:255, action:9, request:[], response:[[Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil], [Utils.IntUtil, Utils.ByteUtil]]};
        public static const notify_announcement:Object = {module:255, action:10, request:[], response:[Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_activity_status:Object = {module:255, action:11, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_activity_info", "get_player_st_underground_palace_info", "hit_monster", "handler_event", "dig", "buy_dig_times", "notify_box_change", "notify_monster_position_change", "notify_activity_over", "notify_refresh_all_box", "notify_announcement", "notify_activity_status"];

        public function Mod_StUndergroundPalace_Base()
        {
            return;
        }// end function

    }
}
