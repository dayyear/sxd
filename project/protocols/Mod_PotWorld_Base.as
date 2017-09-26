package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_PotWorld_Base extends Object
    {
        public static const LOCK:int = 0;
        public static const UNLOCK:int = 1;
        public static const CAN_UNLOCK:int = 2;
        public static const YES:int = 3;
        public static const NO:int = 4;
        public static const SUCCESS:int = 5;
        public static const FAIL:int = 6;
        public static const CAN_NOT_UPGRADE:int = 7;
        public static const NEED_DATA:int = 8;
        public static const NEED_POT_LEVEL:int = 9;
        public static const NEED_PLAYER_LEVEL:int = 10;
        public static const NEED_UNLOCK:int = 11;
        public static const NEED_UNLOCK_BUILDING:int = 12;
        public static const PACK_FULL:int = 13;
        public static const CD_TIME:int = 14;
        public static const NEED_ITEM:int = 15;
        public static const MERGE_LIMIT:int = 16;
        public static const ALREADY_UNLOCK:int = 17;
        public static const NEED_ROLE_LEVEL:int = 18;
        public static const HAVE_BUFF:int = 19;
        public static const FUNCTION_NO_OPEN:int = 20;
        public static const NO_FOREVER_ZHU_FU:int = 21;
        public static const ZHU_FU_LOCK:int = 22;
        public static const NO_ENOUGH_XIAN_ZHI:int = 23;
        public static const ALREADY_DID_FOREVER:int = 24;
        public static const get_info:Object = {module:235, action:1, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const get_store_info:Object = {module:235, action:2, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const get_fu_info:Object = {module:235, action:4, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.LongUtil], Utils.UByteUtil]]};
        public static const get_merge_info:Object = {module:235, action:5, request:[Utils.IntUtil], response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.LongUtil]]};
        public static const get_pack_info:Object = {module:235, action:6, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const move_item:Object = {module:235, action:7, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const upgrade_building:Object = {module:235, action:8, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const buy_item:Object = {module:235, action:9, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const merge_item:Object = {module:235, action:10, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const unlock_item:Object = {module:235, action:11, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const sort_pot_world_pack:Object = {module:235, action:12, request:[], response:[Utils.UByteUtil]};
        public static const get_player_fu_list:Object = {module:235, action:13, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const upgrade_fu:Object = {module:235, action:14, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_merge_item:Object = {module:235, action:15, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const clean_pack_item:Object = {module:235, action:16, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_forever_zhu_fu_list:Object = {module:235, action:17, request:[], response:[[Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const do_forever:Object = {module:235, action:18, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_info", "get_store_info", "get_fu_info", "get_merge_info", "get_pack_info", "move_item", "upgrade_building", "buy_item", "merge_item", "unlock_item", "sort_pot_world_pack", "get_player_fu_list", "upgrade_fu", "get_merge_item", "clean_pack_item", "get_forever_zhu_fu_list", "do_forever"];

        public function Mod_PotWorld_Base()
        {
            return;
        }// end function

    }
}
