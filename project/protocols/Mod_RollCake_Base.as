package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_RollCake_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FAILURE:int = 1;
        public static const NOT_ENOUGH_INGOT:int = 2;
        public static const NO_CHANG_LUCK_TIMES:int = 3;
        public static const NO_RECORD:int = 4;
        public static const HAVE_RECORD:int = 5;
        public static const roll:Object = {module:38, action:0, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const get_count:Object = {module:38, action:2, request:[], response:[Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const reroll:Object = {module:38, action:3, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const get_award:Object = {module:38, action:4, request:[], response:[Utils.UByteUtil]};
        public static const get_state:Object = {module:38, action:5, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const is_auto:Object = {module:38, action:6, request:[], response:[Utils.ByteUtil]};
        public static const set_auto:Object = {module:38, action:7, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["roll", "get_count", "reroll", "get_award", "get_state", "is_auto", "set_auto"];

        public function Mod_RollCake_Base()
        {
            return;
        }// end function

    }
}
