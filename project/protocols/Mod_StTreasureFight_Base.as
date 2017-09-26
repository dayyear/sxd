package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StTreasureFight_Base extends Object
    {
        public static const ACTIVITY_OPEN:int = 0;
        public static const ACTIVITY_CLOSE:int = 1;
        public static const SUCCESS:int = 2;
        public static const ALREADY_IN_GAME:int = 3;
        public static const REJOIN_MATCH:int = 4;
        public static const CLOSE:int = 5;
        public static const NO_MATCH:int = 6;
        public static const FAILURE:int = 7;
        public static const BOSS:int = 8;
        public static const HIGH:int = 9;
        public static const NORMAL:int = 10;
        public static const ALIVE:int = 11;
        public static const KILLED:int = 12;
        public static const OTHER_KILLING:int = 13;
        public static const KILLING:int = 14;
        public static const GOLDEN:int = 15;
        public static const PURPLE:int = 16;
        public static const BLUE:int = 17;
        public static const NONE:int = 18;
        public static const HAS_NO_KEY:int = 19;
        public static const CD_TIME:int = 20;
        public static const OTHER_OPENING:int = 21;
        public static const DAY_LIMIT:int = 22;
        public static const PACK_FULL:int = 23;
        public static const LACK_OF_KEY:int = 24;
        public static const OPENING:int = 25;
        public static const get_activity_state:Object = {module:305, action:0, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const notify_state_change:Object = {module:305, action:1, request:[], response:[Utils.UByteUtil]};
        public static const join_match:Object = {module:305, action:2, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const quit_match:Object = {module:305, action:3, request:[], response:[Utils.UByteUtil]};
        public static const notify_match_count_change:Object = {module:305, action:4, request:[], response:[Utils.ByteUtil]};
        public static const notify_game_start:Object = {module:305, action:5, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil], [Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const kill_monster:Object = {module:305, action:6, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const notify_monster_disappear:Object = {module:305, action:7, request:[], response:[Utils.ByteUtil]};
        public static const notify_monster_state_change:Object = {module:305, action:8, request:[], response:[Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_drop_self:Object = {module:305, action:9, request:[], response:[Utils.ByteUtil, Utils.UByteUtil, Utils.UByteUtil, [Utils.UByteUtil, Utils.ByteUtil]]};
        public static const notify_key_change:Object = {module:305, action:10, request:[], response:[Utils.IntUtil, [Utils.UByteUtil, Utils.ByteUtil]]};
        public static const rob_key:Object = {module:305, action:11, request:[Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil]};
        public static const notify_open_box_start:Object = {module:305, action:12, request:[], response:[[Utils.ByteUtil, Utils.UByteUtil]]};
        public static const open_box:Object = {module:305, action:13, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const notify_box_disappear:Object = {module:305, action:14, request:[], response:[Utils.ByteUtil]};
        public static const notify_box_open:Object = {module:305, action:15, request:[], response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_open_box_failed:Object = {module:305, action:16, request:[], response:[Utils.ByteUtil, Utils.IntUtil]};
        public static const notify_award:Object = {module:305, action:17, request:[], response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const notify_game_over:Object = {module:305, action:18, request:[], response:[[Utils.UByteUtil, Utils.ByteUtil]]};
        public static const quit_game:Object = {module:305, action:19, request:[], response:[Utils.UByteUtil]};
        public static const get_player_opened_box_list:Object = {module:305, action:20, request:[], response:[[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil]]};
        public static const Actions:Array = ["get_activity_state", "notify_state_change", "join_match", "quit_match", "notify_match_count_change", "notify_game_start", "kill_monster", "notify_monster_disappear", "notify_monster_state_change", "notify_drop_self", "notify_key_change", "rob_key", "notify_open_box_start", "open_box", "notify_box_disappear", "notify_box_open", "notify_open_box_failed", "notify_award", "notify_game_over", "quit_game", "get_player_opened_box_list"];

        public function Mod_StTreasureFight_Base()
        {
            return;
        }// end function

    }
}
