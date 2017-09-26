package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SuperTownUpdateFeedback_Base extends Object
    {
        public static const OPEN:int = 0;
        public static const CLOSE:int = 1;
        public static const ST_SUPER_SPORT:int = 2;
        public static const ST_PRACTICE_ROOM:int = 3;
        public static const ST_MINE:int = 4;
        public static const ST_TAKE_BIBLE:int = 5;
        public static const ST_ARENA:int = 6;
        public static const get_feedback_info:Object = {module:342, action:0, request:[], response:[Utils.UByteUtil, [Utils.UByteUtil]]};
        public static const Actions:Array = ["get_feedback_info"];

        public function Mod_SuperTownUpdateFeedback_Base()
        {
            return;
        }// end function

    }
}
