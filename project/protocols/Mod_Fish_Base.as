package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Fish_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NOT_ENOUGH_FISHHOOK:int = 1;
        public static const NOT_ENOUGH_FATE_GRID:int = 2;
        public static const ITEM_PACK_FULL:int = 3;
        public static const FIVE_ELEMENTS_PACK_FULL:int = 4;
        public static const DRAGONBALL_NO_FREE_GRID:int = 5;
        public static const CAN_JUAN_PACK_FULL:int = 6;
        public static const get_player_fishhook:Object = {module:217, action:0, request:[], response:[Utils.IntUtil]};
        public static const do_fishing:Object = {module:217, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_player_fishhook", "do_fishing"];

        public function Mod_Fish_Base()
        {
            return;
        }// end function

    }
}
