package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SmallScoreGame_Base extends Object
    {
        public static const FILL_PIN:int = 0;
        public static const SUCCESS:int = 1;
        public static const SCORE_LIMIT:int = 2;
        public static const FAILED:int = 3;
        public static const open_panel:Object = {module:319, action:0, request:[Utils.UByteUtil], response:[Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const game_over:Object = {module:319, action:1, request:[Utils.UByteUtil, Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const Actions:Array = ["open_panel", "game_over"];

        public function Mod_SmallScoreGame_Base()
        {
            return;
        }// end function

    }
}
