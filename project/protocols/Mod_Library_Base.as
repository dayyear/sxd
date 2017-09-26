package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Library_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCESS:int = 2;
        public static const PLAYER_LEVEL_LIMIT:int = 3;
        public static const NOT_ENOUGH_XIAN_LING:int = 4;
        public static const NOT_ENOUGH_STAR_SOUL:int = 5;
        public static const OTHER_ROLE_JOB_LIMIT:int = 6;
        public static const MAIN_ROLE_JOB_LIMIT:int = 7;
        public static const FULL_LEVEL:int = 8;
        public static const INVALID_ROLE_JOB_ID:int = 9;
        public static const NO_HAVE:int = 10;
        public static const NOT_ENOUGH_COIN:int = 11;
        public static const get_library_info:Object = {module:85, action:1, request:[], response:[[Utils.ByteUtil, Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil]};
        public static const up_library_level:Object = {module:85, action:2, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const use_stunt_skill:Object = {module:85, action:3, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const activate_library_upgrade:Object = {module:85, action:4, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_library_info", "up_library_level", "use_stunt_skill", "activate_library_upgrade"];

        public function Mod_Library_Base()
        {
            return;
        }// end function

    }
}
