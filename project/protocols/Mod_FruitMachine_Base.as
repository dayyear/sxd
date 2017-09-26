package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_FruitMachine_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NON_ACTIVITY_TIME:int = 1;
        public static const NO_BET_FRUIT:int = 2;
        public static const NO_ENOUGH_CURRENCY:int = 3;
        public static const NO_ENOUGH_SCORE:int = 4;
        public static const NO_REMAIN_NUMBER:int = 5;
        public static const PACK_FULL:int = 6;
        public static const get_activity_info:Object = {module:186, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_score:Object = {module:186, action:1, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const start_player:Object = {module:186, action:4, request:[[Utils.ShortUtil, Utils.ShortUtil]], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, [Utils.ShortUtil]]};
        public static const player_score_exchange_info:Object = {module:186, action:5, request:[], response:[Utils.IntUtil, [Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const exchange_award:Object = {module:186, action:6, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_activity_info", "get_player_score", "start_player", "player_score_exchange_info", "exchange_award"];

        public function Mod_FruitMachine_Base()
        {
            return;
        }// end function

    }
}
