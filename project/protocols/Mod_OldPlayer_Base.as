package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_OldPlayer_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const ERROR:int = 1;
        public static const IS_RECEIVE:int = 2;
        public static const TIME_FULL:int = 3;
        public static const CODE_NOT_EXIST:int = 4;
        public static const CODE_USE:int = 5;
        public static const MY_CODE:int = 6;
        public static const get_activity_info:Object = {module:88, action:0, request:[], response:[Utils.ByteUtil]};
        public static const get_old_player_info:Object = {module:88, action:1, request:[], response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil]};
        public static const receive_old_player_gift:Object = {module:88, action:2, request:[], response:[Utils.UByteUtil]};
        public static const notify_receive_old_player_gift_result:Object = {module:88, action:3, request:[], response:[Utils.UByteUtil]};
        public static const exchange_Invitation_award:Object = {module:88, action:4, request:[Utils.StringUtil], response:[Utils.UByteUtil]};
        public static const notify_exchange_Invitation_award_result:Object = {module:88, action:5, request:[], response:[Utils.UByteUtil]};
        public static const notify_old_player_status:Object = {module:88, action:6, request:[], response:[Utils.ByteUtil]};
        public static const Actions:Array = ["get_activity_info", "get_old_player_info", "receive_old_player_gift", "notify_receive_old_player_gift_result", "exchange_Invitation_award", "notify_exchange_Invitation_award_result", "notify_old_player_status"];

        public function Mod_OldPlayer_Base()
        {
            return;
        }// end function

    }
}
