package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StLogin_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FAILED:int = 1;
        public static const login:Object = {module:94, action:0, request:[Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["login"];

        public function Mod_StLogin_Base()
        {
            return;
        }// end function

    }
}
