package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StVoting_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FAILD:int = 1;
        public static const get_voting_info:Object = {module:97, action:0, request:[], response:[Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil]]};
        public static const voting:Object = {module:97, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_voting_info", "voting"];

        public function Mod_StVoting_Base()
        {
            return;
        }// end function

    }
}
