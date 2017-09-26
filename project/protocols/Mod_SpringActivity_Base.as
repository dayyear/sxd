package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SpringActivity_Base extends Object
    {
        public static const SEQUENCE_A:int = 0;
        public static const SEQUENCE_B:int = 1;
        public static const SEQUENCE_C:int = 2;
        public static const SEQUENCE_D:int = 3;
        public static const SEQUENCE_NULL:int = 4;
        public static const NEW_YEAR_DINNER:int = 5;
        public static const LOTTERY_TICKET:int = 6;
        public static const CHAT_BLESS:int = 7;
        public static const FRIEND_BLESS:int = 8;
        public static const CUMULATIVE_ACTIVITY:int = 9;
        public static const YES:int = 10;
        public static const NO:int = 11;
        public static const LOTTERY_TICKET_LOTTERY:int = 12;
        public static const REFRESH_ONLINE_AWARD:int = 13;
        public static const SUCCESS:int = 14;
        public static const ERROR:int = 15;
        public static const NON_LOTTERY:int = 16;
        public static const NON_ACTIVITY_TIME:int = 17;
        public static const NON_BET_TIME:int = 18;
        public static const REPEAT_NUMBER:int = 19;
        public static const NOT_ENOUGH_NUMBER:int = 20;
        public static const HAD_BET:int = 21;
        public static const HAD_AWARD:int = 22;
        public static const NON_GET_TIME:int = 23;
        public static const HAD_GET:int = 24;
        public static const HONG_BAO:int = 25;
        public static const MEI_JIU:int = 26;
        public static const GAO_DIAN:int = 27;
        public static const XIAN_HUA:int = 28;
        public static const NO_ENOUGH_COIN:int = 29;
        public static const TOO_LONG:int = 30;
        public static const NOT_FRIEND:int = 31;
        public static const ONLINE:int = 32;
        public static const NOT_ONLINE:int = 33;
        public static const OPEN:int = 34;
        public static const CLOSE:int = 35;
        public static const GOLD:int = 36;
        public static const NORMAL:int = 37;
        public static const ALREADY_BE_CATCH:int = 38;
        public static const CATCH_COUNT_LIMIT:int = 39;
        public static const LAST_TOPIC_UNCOMPLETE:int = 40;
        public static const FAILED:int = 41;
        public static const FUNCTION_NOT_OPEN:int = 42;
        public static const ITEM_PACK_FULL:int = 43;
        public static const NOT_ENOUGH_MONKEY:int = 44;
        public static const TIMES_LIMIT:int = 45;
        public static const CAN_GET:int = 46;
        public static const NOT_ENOUGH_TIMES:int = 47;
        public static const DRAGONBALL_PACK_FULL:int = 48;
        public static const FATE_PACK_FULL:int = 49;
        public static const NO_ENOUGH_BUY_TIMES:int = 50;
        public static const NO_ENOUGH_INGOT:int = 51;
        public static const UNDO:int = 52;
        public static const CORRECT:int = 53;
        public static const ONE:int = 54;
        public static const TWO:int = 55;
        public static const THREE:int = 56;
        public static const NO_ENOUGH_TIMES:int = 57;
        public static const DIE_STATE:int = 58;
        public static const get_activity_info:Object = {module:218, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, [Utils.UByteUtil, Utils.UByteUtil]]};
        public static const notify:Object = {module:218, action:1, request:[], response:[Utils.UByteUtil]};
        public static const new_year_supper_list:Object = {module:218, action:2, request:[], response:[[Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil]], Utils.ByteUtil]};
        public static const make_new_year_supper:Object = {module:218, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const get_player_lottery_ticket_info:Object = {module:218, action:11, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil], Utils.IntUtil, [Utils.ByteUtil]]};
        public static const bet_lottery_ticket_number:Object = {module:218, action:12, request:[[Utils.ByteUtil]], response:[Utils.UByteUtil]};
        public static const get_lottery_ticket_award:Object = {module:218, action:13, request:[], response:[Utils.UByteUtil]};
        public static const get_lottery_ticket_winner:Object = {module:218, action:14, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil]]};
        public static const bless_info:Object = {module:218, action:21, request:[], response:[Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const send_bless:Object = {module:218, action:22, request:[Utils.IntUtil, Utils.UByteUtil, Utils.StringUtil], response:[Utils.UByteUtil]};
        public static const get_friend_player_list:Object = {module:218, action:23, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const get_monkey_activity_info:Object = {module:218, action:24, request:[], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.ByteUtil]]};
        public static const notify_monkey_activity_status_change:Object = {module:218, action:25, request:[], response:[Utils.UByteUtil]};
        public static const notify_monkey_refresh:Object = {module:218, action:26, request:[], response:[[Utils.UByteUtil, Utils.ByteUtil]]};
        public static const player_catch_monkey:Object = {module:218, action:27, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil]]};
        public static const monkey_commit_answer:Object = {module:218, action:28, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.UByteUtil, [Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const get_exchange_award_info:Object = {module:218, action:29, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const exchange_award:Object = {module:218, action:30, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_online_award_info:Object = {module:218, action:31, request:[], response:[Utils.IntUtil, [Utils.ByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const get_online_award:Object = {module:218, action:32, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_banger_info:Object = {module:218, action:33, request:[], response:[[Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const buy_banger:Object = {module:218, action:34, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_guess_lantern_info:Object = {module:218, action:35, request:[], response:[Utils.ByteUtil, [Utils.ByteUtil, Utils.UByteUtil]]};
        public static const get_guess_lantern_topic:Object = {module:218, action:36, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const guess_lantern_commit_answer:Object = {module:218, action:37, request:[Utils.StringUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const guess_lantern_get_award:Object = {module:218, action:38, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_year_animal_info:Object = {module:218, action:39, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const attack_year_animal:Object = {module:218, action:40, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const light_banger_item_list:Object = {module:218, action:41, request:[], response:[[Utils.IntUtil, Utils.IntUtil]]};
        public static const get_monkey_activity_count:Object = {module:218, action:42, request:[], response:[Utils.ByteUtil, Utils.ByteUtil]};
        public static const Actions:Array = ["get_activity_info", "notify", "new_year_supper_list", "make_new_year_supper", "get_player_lottery_ticket_info", "bet_lottery_ticket_number", "get_lottery_ticket_award", "get_lottery_ticket_winner", "bless_info", "send_bless", "get_friend_player_list", "get_monkey_activity_info", "notify_monkey_activity_status_change", "notify_monkey_refresh", "player_catch_monkey", "monkey_commit_answer", "get_exchange_award_info", "exchange_award", "get_online_award_info", "get_online_award", "get_banger_info", "buy_banger", "get_guess_lantern_info", "get_guess_lantern_topic", "guess_lantern_commit_answer", "guess_lantern_get_award", "get_year_animal_info", "attack_year_animal", "light_banger_item_list", "get_monkey_activity_count"];

        public function Mod_SpringActivity_Base()
        {
            return;
        }// end function

    }
}
