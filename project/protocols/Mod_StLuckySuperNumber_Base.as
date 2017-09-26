package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StLuckySuperNumber_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const ERROR:int = 1;
        public static const get_lucky_super_number_info:Object = {module:311, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil]};
        public static const draw:Object = {module:311, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const rank_list:Object = {module:311, action:2, request:[], response:[[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_lucky_super_number_info", "draw", "rank_list"];

        public function Mod_StLuckySuperNumber_Base()
        {
            return;
        }// end function

    }
}
