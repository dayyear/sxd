package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Chat_Base extends Object
    {
        public static const ACTIVITY:int = 0;
        public static const WORLD:int = 1;
        public static const FACTION:int = 2;
        public static const FACTION_WAR:int = 3;
        public static const ST_TOWN:int = 4;
        public static const ST_UNION:int = 5;
        public static const SAINT_AREA:int = 6;
        public static const CHAT_ROOM:int = 7;
        public static const TIME_DIFF:int = 8;
        public static const DISABLE:int = 9;
        public static const SUCCESS:int = 10;
        public static const NORIGHT:int = 11;
        public static const ISTESTER:int = 12;
        public static const DISABLED:int = 13;
        public static const EXIT_IN_LIST:int = 14;
        public static const FACTION_INVITE:int = 15;
        public static const SPEAKER:int = 16;
        public static const NOT_INGOT:int = 17;
        public static const SPEAKER_COUNT_LIMIT:int = 18;
        public static const NOT_SPEAKER:int = 19;
        public static const FAILURE:int = 20;
        public static const FORBID:int = 21;
        public static const LISTEN:int = 22;
        public static const chat_with_players:Object = {module:6, action:0, request:[Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil], response:[Utils.IntUtil, Utils.UByteUtil]};
        public static const bro_to_players:Object = {module:6, action:1, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil]]};
        public static const disable_player_talk:Object = {module:6, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const shield_player_talk:Object = {module:6, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const shield_player_list:Object = {module:6, action:4, request:[], response:[[Utils.IntUtil, Utils.IntUtil]]};
        public static const fav_friend_achievement_msg:Object = {module:6, action:5, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.UByteUtil, Utils.IntUtil]};
        public static const send_all:Object = {module:6, action:6, request:[Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil], response:[Utils.UByteUtil]};
        public static const send_all_message:Object = {module:6, action:7, request:[], response:[Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil]};
        public static const buy_speaker:Object = {module:6, action:8, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_speaker_count:Object = {module:6, action:9, request:[], response:[Utils.ShortUtil]};
        public static const send_speaker:Object = {module:6, action:10, request:[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil], response:[Utils.UByteUtil]};
        public static const send_all_speaker_message:Object = {module:6, action:11, request:[], response:[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil]};
        public static const enter_st_channel:Object = {module:6, action:12, request:[], response:[Utils.UByteUtil]};
        public static const enter_saint_channel:Object = {module:6, action:13, request:[], response:[Utils.UByteUtil]};
        public static const get_channel_forbidden_info:Object = {module:6, action:14, request:[], response:[[Utils.UByteUtil, Utils.UByteUtil]]};
        public static const forbid_channel:Object = {module:6, action:15, request:[Utils.UByteUtil, Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["chat_with_players", "bro_to_players", "disable_player_talk", "shield_player_talk", "shield_player_list", "fav_friend_achievement_msg", "send_all", "send_all_message", "buy_speaker", "get_speaker_count", "send_speaker", "send_all_speaker_message", "enter_st_channel", "enter_saint_channel", "get_channel_forbidden_info", "forbid_channel"];

        public function Mod_Chat_Base()
        {
            return;
        }// end function

    }
}
