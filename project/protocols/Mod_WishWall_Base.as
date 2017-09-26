package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_WishWall_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NOT_IN_ACTIVITY:int = 1;
        public static const FUNCTION_NO_OPEN:int = 2;
        public static const HAD_WISH:int = 3;
        public static const FAILURE:int = 4;
        public static const PACK_FULL:int = 5;
        public static const NOT_REALIZE:int = 6;
        public static const HAD_GET:int = 7;
        public static const get_wish_wall_info:Object = {module:278, action:0, request:[], response:[[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil], [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil]};
        public static const wish:Object = {module:278, action:1, request:[[Utils.IntUtil]], response:[Utils.UByteUtil]};
        public static const get_award:Object = {module:278, action:2, request:[], response:[Utils.UByteUtil]};
        public static const notify:Object = {module:278, action:3, request:[], response:[Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil]};
        public static const Actions:Array = ["get_wish_wall_info", "wish", "get_award", "notify"];

        public function Mod_WishWall_Base()
        {
            return;
        }// end function

    }
}
