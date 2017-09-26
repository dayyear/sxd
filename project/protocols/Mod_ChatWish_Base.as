package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ChatWish_Base extends Object
    {
        public static const WORLD:int = 0;
        public static const LABA:int = 1;
        public static const CHAT_ROOM:int = 2;
        public static const CHAT_ROOM_LABA:int = 3;
        public static const SUCCESS:int = 4;
        public static const FAILED:int = 5;
        public static const get_key_word:Object = {module:142, action:1, request:[], response:[[Utils.ShortUtil], [Utils.UByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil]]]};
        public static const chat_with_key_word:Object = {module:142, action:2, request:[Utils.UByteUtil, Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_key_word", "chat_with_key_word"];

        public function Mod_ChatWish_Base()
        {
            return;
        }// end function

    }
}
