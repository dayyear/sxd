package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StVoice_Base extends Object
    {
        public static const RACE_TYPE_CLOSE:int = 0;
        public static const RACE_TYPE_SUPERTOWN_RACE:int = 1;
        public static const RACE_TYPE_WORLD_RACE:int = 2;
        public static const RACE_STEP_ROUND_1:int = 3;
        public static const RACE_STEP_ROUND_2:int = 4;
        public static const RACE_STEP_ROUND_3:int = 5;
        public static const RACE_STEP_ROUND_SHOW:int = 6;
        public static const GROUP_TYPE_NEWEST:int = 7;
        public static const GROUP_TYPE_HOTEST:int = 8;
        public static const CAN:int = 9;
        public static const CANNT:int = 10;
        public static const YES:int = 11;
        public static const NO:int = 12;
        public static const CAN_JOIN:int = 13;
        public static const JOINED:int = 14;
        public static const CANNT_JOIN:int = 15;
        public static const TAO_TAI:int = 16;
        public static const BE_JUBAO:int = 17;
        public static const GAME_OVER:int = 18;
        public static const SUCCESS:int = 19;
        public static const NOT_IN_ACTIVITY:int = 20;
        public static const ALREADY_DONE:int = 21;
        public static const FAILED:int = 22;
        public static const get_race_step:Object = {module:307, action:0, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, [Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.UByteUtil], Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const update_step:Object = {module:307, action:1, request:[], response:[Utils.UByteUtil]};
        public static const get_player_info_list:Object = {module:307, action:2, request:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.UByteUtil], Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_info_by_nickname:Object = {module:307, action:3, request:[Utils.UByteUtil, Utils.StringUtil], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.UByteUtil]]};
        public static const zan:Object = {module:307, action:4, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const cai:Object = {module:307, action:5, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const jubao:Object = {module:307, action:6, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const commit:Object = {module:307, action:7, request:[Utils.StringUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_check_code:Object = {module:307, action:8, request:[], response:[Utils.IntUtil, Utils.StringUtil]};
        public static const Actions:Array = ["get_race_step", "update_step", "get_player_info_list", "get_player_info_by_nickname", "zan", "cai", "jubao", "commit", "get_check_code"];

        public function Mod_StVoice_Base()
        {
            return;
        }// end function

    }
}
