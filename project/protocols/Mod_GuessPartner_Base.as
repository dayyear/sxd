package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_GuessPartner_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const PACK_FULL:int = 1;
        public static const ERROR:int = 2;
        public static const RIGHT:int = 3;
        public static const WRONG:int = 4;
        public static const guess_partner_info:Object = {module:369, action:0, request:[], response:[Utils.IntUtil]};
        public static const start_guess:Object = {module:369, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil]]};
        public static const scrape:Object = {module:369, action:2, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const guess:Object = {module:369, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["guess_partner_info", "start_guess", "scrape", "guess"];

        public function Mod_GuessPartner_Base()
        {
            return;
        }// end function

    }
}
