package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_FairyTree_Base extends Object
    {
        public static const OPEN:int = 0;
        public static const NOT_OPEN:int = 1;
        public static const SUCCESS:int = 2;
        public static const FAIL:int = 3;
        public static const FARM_NOT_CLEAN:int = 4;
        public static const NEED_NUM:int = 5;
        public static const NEED_INGOT:int = 6;
        public static const is_fairy_tree_open:Object = {module:135, action:0, request:[], response:[Utils.UByteUtil]};
        public static const open_fairy_tree:Object = {module:135, action:1, request:[], response:[Utils.UByteUtil]};
        public static const get_fairy_tree_info:Object = {module:135, action:2, request:[], response:[Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]]};
        public static const use_fairy_tree_coin:Object = {module:135, action:3, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const use_fairy_tree_expr:Object = {module:135, action:4, request:[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const notify_fairy_tree_harvest:Object = {module:135, action:5, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const notify_coin_fairy_tree_harvest:Object = {module:135, action:6, request:[], response:[Utils.ShortUtil]};
        public static const Actions:Array = ["is_fairy_tree_open", "open_fairy_tree", "get_fairy_tree_info", "use_fairy_tree_coin", "use_fairy_tree_expr", "notify_fairy_tree_harvest", "notify_coin_fairy_tree_harvest"];

        public function Mod_FairyTree_Base()
        {
            return;
        }// end function

    }
}
