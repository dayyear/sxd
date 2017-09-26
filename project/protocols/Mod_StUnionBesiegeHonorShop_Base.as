package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StUnionBesiegeHonorShop_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NO_ENOUGH_HONOR:int = 1;
        public static const FUNCTION_NO_OPEN:int = 2;
        public static const ALREADY_BOUGHT:int = 3;
        public static const buy:Object = {module:224, action:0, request:[Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_bought_list:Object = {module:224, action:1, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil, Utils.ByteUtil]]};
        public static const Actions:Array = ["buy", "get_bought_list"];

        public function Mod_StUnionBesiegeHonorShop_Base()
        {
            return;
        }// end function

    }
}
