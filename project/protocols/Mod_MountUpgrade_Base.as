package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_MountUpgrade_Base extends Object
    {
        public static const ATTACK:int = 0;
        public static const DEFENSE:int = 1;
        public static const BALANCE:int = 2;
        public static const MAIN_ROLE:int = 3;
        public static const PARTNER_ROLE:int = 4;
        public static const SUCCESS:int = 5;
        public static const FUNCTION_UNOPEN:int = 6;
        public static const NONE:int = 7;
        public static const FAILED:int = 8;
        public static const LACK_OF_FEED_POINT:int = 9;
        public static const OTHER_LEVEL_LIMIT:int = 10;
        public static const HIGHER_THAN_MAIN:int = 11;
        public static const MAIN_LEVEL_LIMIT:int = 12;
        public static const LACK_OF_MOUNT_POINT:int = 13;
        public static const get_info:Object = {module:265, action:0, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const active_rune_point:Object = {module:265, action:1, request:[Utils.UByteUtil, Utils.UByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const upgrade_rune_skill:Object = {module:265, action:2, request:[Utils.UByteUtil, Utils.UByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil]};
        public static const active_rune_skill:Object = {module:265, action:3, request:[Utils.UByteUtil, Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const set_is_show_rune:Object = {module:265, action:4, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_info", "active_rune_point", "upgrade_rune_skill", "active_rune_skill", "set_is_show_rune"];

        public function Mod_MountUpgrade_Base()
        {
            return;
        }// end function

    }
}
