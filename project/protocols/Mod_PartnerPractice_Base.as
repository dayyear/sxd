package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_PartnerPractice_Base extends Object
    {
        public static const CHALLENGE:int = 0;
        public static const PRACTICE:int = 1;
        public static const NEXT:int = 2;
        public static const YES:int = 3;
        public static const NO:int = 4;
        public static const SUCCESS:int = 5;
        public static const NOT_IN_DEPLOY:int = 6;
        public static const FINISHED:int = 7;
        public static const FUNCTION_NO_OPEN:int = 8;
        public static const SAME:int = 9;
        public static const FAILURE:int = 10;
        public static const OTHER_PRACTICE:int = 11;
        public static const NOT_PARTNER:int = 12;
        public static const NOT_ENOUGH_INGOT:int = 13;
        public static const TIMES_LIMIT:int = 14;
        public static const LIMIT:int = 15;
        public static const MAX_LIMIT:int = 16;
        public static const NOT_EXIST_GRID:int = 17;
        public static const MAIN_ROLE_LIMIT:int = 18;
        public static const LEVEL_LIMIT:int = 19;
        public static const COMPLETE_ALL:int = 20;
        public static const CD_TIME:int = 21;
        public static const FIGHTEN:int = 22;
        public static const get_partner_practice_info:Object = {module:306, action:0, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const select_partner:Object = {module:306, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const start_practice:Object = {module:306, action:2, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const speed_practice:Object = {module:306, action:3, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const stop_practice:Object = {module:306, action:4, request:[], response:[Utils.UByteUtil]};
        public static const enter_fight:Object = {module:306, action:5, request:[], response:[Utils.UByteUtil]};
        public static const call_mirror:Object = {module:306, action:6, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_deploy_info:Object = {module:306, action:7, request:[], response:[[Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const deploy:Object = {module:306, action:8, request:[Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const fight:Object = {module:306, action:9, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const get_role_war_attribute:Object = {module:306, action:10, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_partner_practice_info", "select_partner", "start_practice", "speed_practice", "stop_practice", "enter_fight", "call_mirror", "get_deploy_info", "deploy", "fight", "get_role_war_attribute"];

        public function Mod_PartnerPractice_Base()
        {
            return;
        }// end function

    }
}
