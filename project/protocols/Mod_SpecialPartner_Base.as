package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SpecialPartner_Base extends Object
    {
        public static const IS_INVITED:int = 0;
        public static const IS_CANINVITE:int = 1;
        public static const IS_CANTINVITE:int = 2;
        public static const MS_COMPLETED:int = 3;
        public static const MS_NOCOMPLETED:int = 4;
        public static const MS_CANCOMPLETE:int = 5;
        public static const MCR_SUCCESS:int = 6;
        public static const MCR_ALREADY_GET:int = 7;
        public static const MCR_CANT_GET:int = 8;
        public static const MCR_GET_ERROR:int = 9;
        public static const MCR_BAG_FULL:int = 10;
        public static const ICR_SUCCESS:int = 11;
        public static const ICR_NO_INGOT:int = 12;
        public static const ICR_ERROR:int = 13;
        public static const ICR_VIPLV_ERROR:int = 14;
        public static const IPR_SUCCESS:int = 15;
        public static const IPR_CANT_INVITE:int = 16;
        public static const IPR_ERROR:int = 17;
        public static const IPR_FULL_PARTNER:int = 18;
        public static const IPR_NO_COIN:int = 19;
        public static const IPR_NO_FAME:int = 20;
        public static const get_partner_info:Object = {module:67, action:0, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]]};
        public static const get_mission_award:Object = {module:67, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const ingot_complete:Object = {module:67, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil]]};
        public static const invite_partner:Object = {module:67, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_partner_info", "get_mission_award", "ingot_complete", "invite_partner"];

        public function Mod_SpecialPartner_Base()
        {
            return;
        }// end function

    }
}
