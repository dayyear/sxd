package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_RockGame_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FAILED:int = 1;
        public static const GAME_OVER:int = 2;
        public static const MAX_MULTIPLE:int = 3;
        public static const NO_ENOUGH_INGOT:int = 4;
        public static const get_rock_game_status:Object = {module:204, action:0, request:[], response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const player_rock_game:Object = {module:204, action:1, request:[], response:[[Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const do_rock_game:Object = {module:204, action:2, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const activate_multiple:Object = {module:204, action:3, request:[], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const get_award:Object = {module:204, action:4, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_rock_game_status", "player_rock_game", "do_rock_game", "activate_multiple", "get_award"];

        public function Mod_RockGame_Base()
        {
            return;
        }// end function

    }
}
