package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_GridGame_Base extends Object
    {
        public static const ACTIVITY_OPEN:int = 0;
        public static const ACTIVITY_CLOSE:int = 1;
        public static const SUCCESS:int = 2;
        public static const NOT_OPEN:int = 3;
        public static const NOT_ENOUGH_COUNT:int = 4;
        public static const MAX_GRID:int = 5;
        public static const CD_TIME:int = 6;
        public static const DRAGONBALL_NO_FREE_GRID:int = 7;
        public static const CHAOS_MONSTER_PACK_FULL:int = 8;
        public static const CHAOS_ITEM_PACK_FULL:int = 9;
        public static const NOT_ENOUGH_FATE_GRID:int = 10;
        public static const NOT_ENOUGH_GRID:int = 11;
        public static const NOT_ENOUGH_INGOT:int = 12;
        public static const get_grid_game_status:Object = {module:171, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const player_grid_game_info:Object = {module:171, action:1, request:[], response:[Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const award_list:Object = {module:171, action:2, request:[], response:[[Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]]};
        public static const do_grid_game:Object = {module:171, action:3, request:[], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, [Utils.ShortUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["get_grid_game_status", "player_grid_game_info", "award_list", "do_grid_game"];

        public function Mod_GridGame_Base()
        {
            return;
        }// end function

    }
}
