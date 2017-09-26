package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ClientFlag_Base extends Object
    {
        public static const get_all_flag:Object = {module:335, action:0, request:[], response:[[Utils.ShortUtil, Utils.ByteUtil]]};
        public static const get_single_mod_flag:Object = {module:335, action:1, request:[Utils.ShortUtil], response:[Utils.ShortUtil, Utils.ByteUtil]};
        public static const Actions:Array = ["get_all_flag", "get_single_mod_flag"];

        public function Mod_ClientFlag_Base()
        {
            return;
        }// end function

    }
}
