package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Marry_Base extends Object
    {
        public static const UNMARRIED:int = 0;
        public static const PROPOSE:int = 1;
        public static const BE_MARRY:int = 2;
        public static const ENGAGEMENT:int = 3;
        public static const MARRY:int = 4;
        public static const DIVORCE:int = 5;
        public static const BE_DIVORCE:int = 6;
        public static const FOR_LIFE:int = 7;
        public static const LOVE_SANSEI:int = 8;
        public static const LOVE_MILLION_YEARS:int = 9;
        public static const YES:int = 10;
        public static const NO:int = 11;
        public static const PROPOSE_RING:int = 12;
        public static const SUCCESS:int = 13;
        public static const NO_ENOUGH_PLAYER_LEVEL:int = 14;
        public static const SAME_GENDER:int = 15;
        public static const TO_NON_UNMARRIED:int = 16;
        public static const NO_ENOUGH_INGOT:int = 17;
        public static const PLAYER_NOT_EXIST:int = 18;
        public static const NON_PROPOSE:int = 19;
        public static const NON_BE_MARRY:int = 20;
        public static const REVOKE_PROPOSE:int = 21;
        public static const NO_ENOUGH_COIN:int = 22;
        public static const INTIMACY_FULL:int = 23;
        public static const DAY_LIMIT:int = 24;
        public static const NORMAL:int = 25;
        public static const ADVANCED:int = 26;
        public static const LUXURY:int = 27;
        public static const HAS_BOOKING:int = 28;
        public static const TIME_BOOKING:int = 29;
        public static const NO_ENOUGH_INTIMACY:int = 30;
        public static const NON_WEDDING_TIME:int = 31;
        public static const HAD_SEND:int = 32;
        public static const NO_ENOUGH_GET_COUNT:int = 33;
        public static const SELF_CANNT_GET:int = 34;
        public static const NO_ENOUGH_TOTAL_COUNT:int = 35;
        public static const RECEIVE_PROPOSE:int = 36;
        public static const RECEIVE_INVITATION_CARD:int = 37;
        public static const NEW_WEDDING:int = 38;
        public static const WEDDING_RED_CHANGE:int = 39;
        public static const TOWN_RED_CHANGE:int = 40;
        public static const INTIMACY_CHANGE:int = 41;
        public static const BLESS:int = 42;
        public static const RECEIVE_DIVORCE:int = 43;
        public static const DIVORCE_SUCCESS:int = 44;
        public static const REFUSE_DIVORCE:int = 45;
        public static const NO_ENOUGH_TIME:int = 46;
        public static const ONLINE:int = 47;
        public static const NOT_ONLINE:int = 48;
        public static const NOT_ENOUGH_ITEM:int = 49;
        public static const NON_MARRY_STATUS:int = 50;
        public static const MARRY_DAY:int = 51;
        public static const PACK_FULL:int = 52;
        public static const is_self_be_marry:Object = {module:206, action:1, request:[], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.StringUtil, Utils.UByteUtil, Utils.StringUtil, Utils.IntUtil]};
        public static const get_player_marry_status:Object = {module:206, action:2, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.UByteUtil], Utils.StringUtil, Utils.UByteUtil]};
        public static const player_propose:Object = {module:206, action:3, request:[Utils.StringUtil, Utils.UByteUtil, Utils.StringUtil], response:[Utils.UByteUtil]};
        public static const revoke_propose:Object = {module:206, action:4, request:[], response:[Utils.UByteUtil]};
        public static const refuse_propose:Object = {module:206, action:5, request:[], response:[Utils.UByteUtil]};
        public static const agree_propose:Object = {module:206, action:6, request:[], response:[Utils.UByteUtil]};
        public static const get_player_engagement_info:Object = {module:206, action:7, request:[], response:[[Utils.ShortUtil, Utils.StringUtil], Utils.ShortUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, [Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.UByteUtil]};
        public static const give_gift:Object = {module:206, action:8, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const get_today_wedding_time:Object = {module:206, action:11, request:[], response:[[Utils.IntUtil, Utils.UByteUtil]]};
        public static const booking_wedding_celebration:Object = {module:206, action:12, request:[Utils.UByteUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_today_wedding:Object = {module:206, action:13, request:[], response:[[Utils.IntUtil, [Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil], Utils.UByteUtil, Utils.IntUtil]]};
        public static const join_wedding:Object = {module:206, action:14, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const send_invitation_card:Object = {module:206, action:16, request:[], response:[Utils.UByteUtil]};
        public static const get_player_invitation_card:Object = {module:206, action:17, request:[], response:[[Utils.IntUtil, [Utils.ShortUtil, Utils.StringUtil], Utils.IntUtil]]};
        public static const player_close_invitation_card:Object = {module:206, action:18, request:[Utils.IntUtil], response:[]};
        public static const enjoy_wedding_food:Object = {module:206, action:19, request:[], response:[Utils.UByteUtil]};
        public static const player_get_wedding_red_envelopes:Object = {module:206, action:20, request:[], response:[Utils.UByteUtil]};
        public static const get_wedding_red_envelope_count:Object = {module:206, action:21, request:[], response:[Utils.ShortUtil]};
        public static const town_send_red_envelopes:Object = {module:206, action:22, request:[], response:[Utils.UByteUtil]};
        public static const get_town_red_envelopes:Object = {module:206, action:23, request:[], response:[Utils.UByteUtil]};
        public static const get_town_red_envelope_count:Object = {module:206, action:24, request:[], response:[Utils.ShortUtil, Utils.ShortUtil]};
        public static const get_player_wedding_celebration_info:Object = {module:206, action:25, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const notify:Object = {module:206, action:26, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const remove_engagement:Object = {module:206, action:27, request:[], response:[Utils.UByteUtil]};
        public static const get_town_wedding:Object = {module:206, action:28, request:[], response:[Utils.IntUtil, [Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil], Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const get_wedding_st_lover_info:Object = {module:206, action:29, request:[Utils.IntUtil], response:[[Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil], Utils.UByteUtil]};
        public static const get_player_join_wedding_info:Object = {module:206, action:30, request:[], response:[Utils.ShortUtil]};
        public static const get_player_marry_info:Object = {module:206, action:31, request:[], response:[Utils.ShortUtil, Utils.UByteUtil, Utils.ShortUtil]};
        public static const send_bless:Object = {module:206, action:32, request:[], response:[]};
        public static const unmarried_friend:Object = {module:206, action:33, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.UByteUtil]]};
        public static const get_player_divorce_info:Object = {module:206, action:34, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const protocol_divorce:Object = {module:206, action:35, request:[], response:[Utils.UByteUtil]};
        public static const force_divorce:Object = {module:206, action:36, request:[], response:[Utils.UByteUtil]};
        public static const agree_divorce:Object = {module:206, action:37, request:[], response:[Utils.UByteUtil]};
        public static const refuse_divorce:Object = {module:206, action:38, request:[], response:[Utils.UByteUtil]};
        public static const is_self_be_divorce:Object = {module:206, action:39, request:[], response:[Utils.UByteUtil, Utils.StringUtil]};
        public static const get_marry_box:Object = {module:206, action:40, request:[], response:[Utils.UByteUtil]};
        public static const is_marry_boon_activity:Object = {module:206, action:41, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["is_self_be_marry", "get_player_marry_status", "player_propose", "revoke_propose", "refuse_propose", "agree_propose", "get_player_engagement_info", "give_gift", "get_today_wedding_time", "booking_wedding_celebration", "get_today_wedding", "join_wedding", "send_invitation_card", "get_player_invitation_card", "player_close_invitation_card", "enjoy_wedding_food", "player_get_wedding_red_envelopes", "get_wedding_red_envelope_count", "town_send_red_envelopes", "get_town_red_envelopes", "get_town_red_envelope_count", "get_player_wedding_celebration_info", "notify", "remove_engagement", "get_town_wedding", "get_wedding_st_lover_info", "get_player_join_wedding_info", "get_player_marry_info", "send_bless", "unmarried_friend", "get_player_divorce_info", "protocol_divorce", "force_divorce", "agree_divorce", "refuse_divorce", "is_self_be_divorce", "get_marry_box", "is_marry_boon_activity"];

        public function Mod_Marry_Base()
        {
            return;
        }// end function

    }
}
