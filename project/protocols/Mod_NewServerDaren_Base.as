package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_NewServerDaren_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const ITEM_PACK_FULL:int = 1;
        public static const FATE_PACK_FULL:int = 2;
        public static const FUNCTION_NO_OPEN:int = 3;
        public static const ERROE:int = 4;
        public static const new_server_daren_info:Object = {module:227, action:0, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil], [Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil], Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const receive_quest_award:Object = {module:227, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const receive_complete_quest_award:Object = {module:227, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["new_server_daren_info", "receive_quest_award", "receive_complete_quest_award"];

        public function Mod_NewServerDaren_Base()
        {
            return;
        }// end function

    }
}
