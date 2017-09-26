package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_WorldCupGuess_Base extends Object
    {
        public static const WORLD_CUP_CLOSE:int = 0;
        public static const WORLD_CUP_8:int = 1;
        public static const WORLD_CUP_8_COMPLETE:int = 2;
        public static const WORLD_CUP_4:int = 3;
        public static const WORLD_CUP_4_COMPLETE:int = 4;
        public static const WORLD_CUP_2:int = 5;
        public static const WORLD_CUP_2_COMPLETE:int = 6;
        public static const WORLD_CUP_1:int = 7;
        public static const WORLD_CUP_1_COMPLETE:int = 8;
        public static const OPEN:int = 9;
        public static const CLOSE:int = 10;
        public static const SUCCESS:int = 11;
        public static const NOT_OPEN:int = 12;
        public static const ALREADY_GUESS:int = 13;
        public static const ERROR:int = 14;
        public static const WIN:int = 15;
        public static const LOSE:int = 16;
        public static const NOT_RESULT:int = 17;
        public static const CAN_GET:int = 18;
        public static const NOT_CAN_GET:int = 19;
        public static const ALREADY_GET:int = 20;
        public static const XIAO_ZU:int = 21;
        public static const BA_QIANG:int = 22;
        public static const SI_QIANG:int = 23;
        public static const BAN_JUE_SAI:int = 24;
        public static const JUE_SAI:int = 25;
        public static const NOT_AWARD:int = 26;
        public static const CAN_BET:int = 27;
        public static const IS_BET:int = 28;
        public static const CAN_NOT_BET:int = 29;
        public static const get_world_cup_guess_status:Object = {module:163, action:0, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_world_cup_guess_info:Object = {module:163, action:1, request:[], response:[[Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const do_guess:Object = {module:163, action:2, request:[Utils.ShortUtil, [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const get_team_status:Object = {module:163, action:3, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil]};
        public static const get_player_16_info:Object = {module:163, action:4, request:[], response:[[Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil]};
        public static const get_player_top_award:Object = {module:163, action:5, request:[], response:[Utils.UByteUtil]};
        public static const get_sup_list:Object = {module:163, action:6, request:[], response:[Utils.UByteUtil, [Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil], Utils.IntUtil]};
        public static const tao_tai_guess:Object = {module:163, action:7, request:[Utils.ShortUtil, Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const get_player_bet:Object = {module:163, action:8, request:[], response:[[Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil]]};
        public static const get_player_bet_number:Object = {module:163, action:9, request:[Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_bet_status:Object = {module:163, action:10, request:[], response:[[Utils.ShortUtil, Utils.UByteUtil]]};
        public static const Actions:Array = ["get_world_cup_guess_status", "get_player_world_cup_guess_info", "do_guess", "get_team_status", "get_player_16_info", "get_player_top_award", "get_sup_list", "tao_tai_guess", "get_player_bet", "get_player_bet_number", "get_player_bet_status"];

        public function Mod_WorldCupGuess_Base()
        {
            return;
        }// end function

    }
}
