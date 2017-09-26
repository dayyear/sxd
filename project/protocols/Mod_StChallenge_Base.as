package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StChallenge_Base extends Object
    {
        public static const DIFFICULT_NULL:int = 0;
        public static const DIFFICULT_SSSS:int = 1;
        public static const DIFFICULT_SSS:int = 2;
        public static const DIFFICULT_SS:int = 3;
        public static const DIFFICULT_S:int = 4;
        public static const CAN_GET:int = 5;
        public static const CANNT_GET:int = 6;
        public static const HAD_GET:int = 7;
        public static const YES:int = 8;
        public static const NO:int = 9;
        public static const SUCCESS:int = 10;
        public static const HAD_CHALLENGE:int = 11;
        public static const INVALID_CHOOSE:int = 12;
        public static const FAILED:int = 13;
        public static const UNCHOOSE_DIFFICULT:int = 14;
        public static const UNCHOOSE_WAR_CHANGE:int = 15;
        public static const UNCHOOSE_STUNT:int = 16;
        public static const UNCHOOSE_SUPERNATURAL:int = 17;
        public static const get_player_st_challenge_info:Object = {module:136, action:1, request:[], response:[Utils.ShortUtil, [Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const customizing_info:Object = {module:136, action:2, request:[], response:[Utils.ShortUtil, [Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil], Utils.UByteUtil, [Utils.IntUtil, Utils.UByteUtil], [Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil], [Utils.ShortUtil], [Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const choose_difficult_type:Object = {module:136, action:3, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.UByteUtil]};
        public static const choose_war_change:Object = {module:136, action:4, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const change_monster_deploy:Object = {module:136, action:5, request:[Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const change_stunt:Object = {module:136, action:6, request:[Utils.ByteUtil, Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ShortUtil]};
        public static const change_supernatural:Object = {module:136, action:7, request:[Utils.ByteUtil, Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ShortUtil]};
        public static const start_challenge:Object = {module:136, action:8, request:[], response:[Utils.UByteUtil, Utils.ShortUtil, [Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil], [Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil], Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_award:Object = {module:136, action:9, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const get_end_li_bao_info:Object = {module:136, action:10, request:[], response:[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const get_end_li_bao:Object = {module:136, action:20, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const Actions:Array = ["get_player_st_challenge_info", "customizing_info", "choose_difficult_type", "choose_war_change", "change_monster_deploy", "change_stunt", "change_supernatural", "start_challenge", "get_award", "get_end_li_bao_info", "get_end_li_bao"];

        public function Mod_StChallenge_Base()
        {
            return;
        }// end function

    }
}
