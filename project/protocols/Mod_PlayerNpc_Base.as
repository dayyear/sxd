package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_PlayerNpc_Base extends Object
    {
        public static const FREE:int = 0;
        public static const PAY:int = 1;
        public static const SUCCESS:int = 2;
        public static const NOT_ENOUGTH_INGOT:int = 3;
        public static const NOT_ENOUGTH_GRID:int = 4;
        public static const ERROR:int = 5;
        public static const total_ingot_info:Object = {module:158, action:0, request:[], response:[Utils.LongUtil]};
        public static const player_npc_info:Object = {module:158, action:1, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const present_ingot:Object = {module:158, action:2, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["total_ingot_info", "player_npc_info", "present_ingot"];

        public function Mod_PlayerNpc_Base()
        {
            return;
        }// end function

    }
}
