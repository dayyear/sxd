package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ServerChatRoom_Base extends Object
    {
        public static const MALE:int = 0;
        public static const FEMALE:int = 1;
        public static const ON:int = 2;
        public static const OFF:int = 3;
        public static const UNDO:int = 4;
        public static const DONE:int = 5;
        public static const TIMES_LIMIT:int = 6;
        public static const YES:int = 7;
        public static const NO:int = 8;
        public static const SUCCESS:int = 9;
        public static const NOT_OPEN:int = 10;
        public static const FREE:int = 11;
        public static const HOT:int = 12;
        public static const FULL:int = 13;
        public static const FORBIDDEN:int = 14;
        public static const FAILED:int = 15;
        public static const HAS_NOT:int = 16;
        public static const LACK_OF_COINS:int = 17;
        public static const LACK_OF_INGOT:int = 18;
        public static const INVAILD_LOGIN_CODE:int = 19;
        public static const ROOM_FULL:int = 20;
        public static const PLAYER_HAS_QUIT:int = 21;
        public static const LACK_OF_DAOYUAN:int = 22;
        public static const PACK_FULL:int = 23;
        public static const ALREADY_DONE:int = 24;
        public static const TIME_DIFF:int = 25;
        public static const NO_SPEAKER:int = 26;
        public static const DISABLE:int = 27;
        public static const NOT_ADMIN:int = 28;
        public static const OPEN:int = 29;
        public static const CLOSE:int = 30;
        public static const NOT_IN_ACTIVITY:int = 31;
        public static const PREPARE:int = 32;
        public static const HAS_GET:int = 33;
        public static const CAN_FEED:int = 34;
        public static const CAN_ESCORT:int = 35;
        public static const ESCORTING:int = 36;
        public static const INGOT_ESCORTING:int = 37;
        public static const ESCORT_DONE:int = 38;
        public static const HAS_FEED:int = 39;
        public static const CANNT_FEED:int = 40;
        public static const NORMAL:int = 41;
        public static const INGOT:int = 42;
        public static const FULL_HUNGRY:int = 43;
        public static const NOT_HUNGRY:int = 44;
        public static const get_recent_room_list:Object = {module:336, action:0, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil]]};
        public static const get_chat_room_status:Object = {module:336, action:1, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const get_player_info:Object = {module:336, action:2, request:[], response:[Utils.IntUtil, Utils.ShortUtil, [Utils.ByteUtil, Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.StringUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, [Utils.ByteUtil, Utils.UByteUtil, Utils.StringUtil], [Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil], Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const set_player_info:Object = {module:336, action:3, request:[Utils.StringUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil], response:[Utils.UByteUtil]};
        public static const set_permissions:Object = {module:336, action:4, request:[[Utils.ByteUtil, Utils.UByteUtil]], response:[Utils.UByteUtil]};
        public static const set_up_medal:Object = {module:336, action:5, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_thanks_gift_info:Object = {module:336, action:6, request:[], response:[[Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const buy_thanks_gift:Object = {module:336, action:7, request:[Utils.ByteUtil, Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const buy_loudspeaker:Object = {module:336, action:9, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const get_rank_info:Object = {module:336, action:10, request:[], response:[[Utils.ByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.ByteUtil]]};
        public static const get_chat_room_logincode:Object = {module:336, action:11, request:[Utils.ByteUtil], response:[Utils.ByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil]};
        public static const login_chat_room:Object = {module:336, action:12, request:[Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_other_info:Object = {module:336, action:13, request:[Utils.StringUtil, Utils.StringUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, [Utils.ByteUtil, Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.StringUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, [Utils.ByteUtil, Utils.UByteUtil, Utils.StringUtil], [Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil], Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const get_gift_info:Object = {module:336, action:14, request:[], response:[[Utils.ByteUtil, Utils.UByteUtil]]};
        public static const send_gift:Object = {module:336, action:15, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const approve:Object = {module:336, action:16, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const report:Object = {module:336, action:17, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const send_speaker:Object = {module:336, action:18, request:[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil], response:[Utils.UByteUtil]};
        public static const notify_server_speaker_message:Object = {module:336, action:19, request:[], response:[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const chat_with_players:Object = {module:336, action:20, request:[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil], response:[Utils.IntUtil, Utils.UByteUtil]};
        public static const notify_chat_message:Object = {module:336, action:21, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const disable_chat:Object = {module:336, action:22, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const notify_medal_owner_enter:Object = {module:336, action:23, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const send_war_report:Object = {module:336, action:24, request:[Utils.StringUtil], response:[Utils.UByteUtil]};
        public static const notify_war_report:Object = {module:336, action:25, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.StringUtil]};
        public static const get_answer_activity_status:Object = {module:336, action:26, request:[], response:[Utils.UByteUtil]};
        public static const notify_answer_activity_open:Object = {module:336, action:27, request:[], response:[Utils.IntUtil]};
        public static const notify_answer_activity_close:Object = {module:336, action:28, request:[], response:[[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil]]};
        public static const brocast_answer_topic:Object = {module:336, action:29, request:[], response:[Utils.StringUtil]};
        public static const get_answer_topic:Object = {module:336, action:30, request:[], response:[Utils.UByteUtil, Utils.StringUtil]};
        public static const notify_answer_activity_award_ingot_player:Object = {module:336, action:31, request:[], response:[[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil]]};
        public static const brocast_chat_room_red_bag_status:Object = {module:336, action:32, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_chat_room_red_bag_status:Object = {module:336, action:33, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const open_red_bag:Object = {module:336, action:34, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const notify_red_bag_ingot_player:Object = {module:336, action:35, request:[], response:[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil]};
        public static const notify_be_approved:Object = {module:336, action:36, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil]};
        public static const notify_recv_gift:Object = {module:336, action:37, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ShortUtil]};
        public static const notify_answer_activity_award:Object = {module:336, action:38, request:[], response:[[Utils.IntUtil, Utils.IntUtil]]};
        public static const get_player_pet_escort_info:Object = {module:336, action:40, request:[], response:[Utils.IntUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil]};
        public static const get_other_pet_escort_info:Object = {module:336, action:41, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil]};
        public static const feed_pet:Object = {module:336, action:42, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const escort_pet:Object = {module:336, action:43, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const get_pet_escort_award:Object = {module:336, action:44, request:[], response:[Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const get_pet_feed_record:Object = {module:336, action:45, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil]]};
        public static const feed_other_pet:Object = {module:336, action:46, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const notify_be_feed:Object = {module:336, action:47, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil]};
        public static const Actions:Array = ["get_recent_room_list", "get_chat_room_status", "get_player_info", "set_player_info", "set_permissions", "set_up_medal", "get_thanks_gift_info", "buy_thanks_gift", "buy_loudspeaker", "get_rank_info", "get_chat_room_logincode", "login_chat_room", "get_other_info", "get_gift_info", "send_gift", "approve", "report", "send_speaker", "notify_server_speaker_message", "chat_with_players", "notify_chat_message", "disable_chat", "notify_medal_owner_enter", "send_war_report", "notify_war_report", "get_answer_activity_status", "notify_answer_activity_open", "notify_answer_activity_close", "brocast_answer_topic", "get_answer_topic", "notify_answer_activity_award_ingot_player", "brocast_chat_room_red_bag_status", "get_chat_room_red_bag_status", "open_red_bag", "notify_red_bag_ingot_player", "notify_be_approved", "notify_recv_gift", "notify_answer_activity_award", "get_player_pet_escort_info", "get_other_pet_escort_info", "feed_pet", "escort_pet", "get_pet_escort_award", "get_pet_feed_record", "feed_other_pet", "notify_be_feed"];

        public function Mod_ServerChatRoom_Base()
        {
            return;
        }// end function

    }
}
