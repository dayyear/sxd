package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_LinkFate_Base extends Object
    {
        public static const DEPLOY:int = 0;
        public static const NODEPLOY:int = 1;
        public static const REPLACE:int = 2;
        public static const UNLOCK:int = 3;
        public static const LOCK:int = 4;
        public static const SUCCESS:int = 5;
        public static const NON_SAME_LINK_FATE_DISH:int = 6;
        public static const NON_EMPTY_GRID:int = 7;
        public static const SAME_PROPERTY_STONE:int = 8;
        public static const LINK_FATE_LOCK:int = 9;
        public static const FAILED:int = 10;
        public static const LINK_FATE_STONE_PACK_FULL:int = 11;
        public static const YES:int = 12;
        public static const NO:int = 13;
        public static const PLAYER_ROLE_LINKED:int = 14;
        public static const PLAYER_ROLE_NOT_EXIST:int = 15;
        public static const MAX_LEVEL:int = 16;
        public static const EMPTY_GRID:int = 17;
        public static const NO_ENOUGH_INGOT:int = 18;
        public static const NOT_ENOUGH_GRID:int = 19;
        public static const NOT_ENOUGH_BOX:int = 20;
        public static const NOT_ENOUGH_INGOT:int = 21;
        public static const NOT_ACTIVITY_TIME:int = 22;
        public static const NOT_BUY_COUNT:int = 23;
        public static const NEED_ADVANCED:int = 24;
        public static const LACK_OF_SCRAP:int = 25;
        public static const ALREADY_UNLOCK:int = 26;
        public static const get_link_fate_info:Object = {module:232, action:0, request:[], response:[Utils.ShortUtil, [Utils.ByteUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ShortUtil], [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil], Utils.UByteUtil, Utils.ShortUtil]};
        public static const equip_link_fate_stone:Object = {module:232, action:1, request:[Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]]};
        public static const take_off_link_fate_stone:Object = {module:232, action:2, request:[Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]]};
        public static const get_no_link_player_role_list:Object = {module:232, action:3, request:[Utils.ByteUtil], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.ShortUtil]]};
        public static const player_role_link_fate:Object = {module:232, action:4, request:[Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_player_link_fate_stone_pack:Object = {module:232, action:10, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]]};
        public static const move_link_fate_stone:Object = {module:232, action:11, request:[Utils.IntUtil, Utils.ShortUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]]};
        public static const merge_link_fate_stone:Object = {module:232, action:12, request:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]]};
        public static const auto_merge_link_fate_stone:Object = {module:232, action:13, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const classify_pack_grid:Object = {module:232, action:14, request:[], response:[Utils.UByteUtil]};
        public static const get_player_link_fate_stone_warehouse:Object = {module:232, action:15, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]]};
        public static const classify_warehouse_grid:Object = {module:232, action:16, request:[], response:[Utils.UByteUtil]};
        public static const get_link_fate_box:Object = {module:232, action:30, request:[], response:[[Utils.IntUtil, Utils.IntUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const open_link_fate_box:Object = {module:232, action:31, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const notify_golden:Object = {module:232, action:32, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const buy_golden_link_fate_box:Object = {module:232, action:33, request:[], response:[Utils.UByteUtil]};
        public static const one_key_open_box:Object = {module:232, action:34, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const advanced:Object = {module:232, action:35, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const switch_war_mutual:Object = {module:232, action:36, request:[Utils.ByteUtil, Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const unlock_link_fate:Object = {module:232, action:37, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_link_fate_info", "equip_link_fate_stone", "take_off_link_fate_stone", "get_no_link_player_role_list", "player_role_link_fate", "get_player_link_fate_stone_pack", "move_link_fate_stone", "merge_link_fate_stone", "auto_merge_link_fate_stone", "classify_pack_grid", "get_player_link_fate_stone_warehouse", "classify_warehouse_grid", "get_link_fate_box", "open_link_fate_box", "notify_golden", "buy_golden_link_fate_box", "one_key_open_box", "advanced", "switch_war_mutual", "unlock_link_fate"];

        public function Mod_LinkFate_Base()
        {
            return;
        }// end function

    }
}
