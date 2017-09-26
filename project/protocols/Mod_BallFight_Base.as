package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_BallFight_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const SCORE_LIMIT:int = 1;
        public static const FAILED:int = 2;
        public static const LACK_OF_TIMES:int = 3;
        public static const LACK_OF_SCORE:int = 4;
        public static const PACK_FULL:int = 5;
        public static const open_panel:Object = {module:300, action:0, request:[], response:[Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const ball_fight_game_over:Object = {module:300, action:1, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const get_exchange_info:Object = {module:300, action:2, request:[], response:[Utils.ShortUtil, [Utils.ByteUtil, Utils.ByteUtil]]};
        public static const exchange:Object = {module:300, action:3, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil]};
        public static const Actions:Array = ["open_panel", "ball_fight_game_over", "get_exchange_info", "exchange"];

        public function Mod_BallFight_Base()
        {
            return;
        }// end function

    }
}
