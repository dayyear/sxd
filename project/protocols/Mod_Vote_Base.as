package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Vote_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const RE_VOTE:int = 1;
        public static const ACTIVITY_CLOSE:int = 2;
        public static const LEVEL_LIMIT:int = 3;
        public static const VOTE_COUNT_ERROR:int = 4;
        public static const NO_FRIEND:int = 5;
        public static const RE_INVITE:int = 6;
        public static const TRUE:int = 7;
        public static const FALSE:int = 8;
        public static const GOTTEN:int = 9;
        public static const NO_VOTE:int = 10;
        public static const PACKAGE_FULL:int = 11;
        public static const get_vote_info:Object = {module:304, action:0, request:[], response:[[Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil], [Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil], Utils.IntUtil]};
        public static const vote:Object = {module:304, action:1, request:[[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]], response:[Utils.UByteUtil]};
        public static const invite:Object = {module:304, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_award_info:Object = {module:304, action:3, request:[], response:[[Utils.IntUtil, Utils.IntUtil], Utils.UByteUtil]};
        public static const get_award:Object = {module:304, action:4, request:[], response:[Utils.UByteUtil]};
        public static const get_invite_list:Object = {module:304, action:5, request:[], response:[Utils.ByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.UByteUtil, Utils.UByteUtil]]};
        public static const Actions:Array = ["get_vote_info", "vote", "invite", "get_award_info", "get_award", "get_invite_list"];

        public function Mod_Vote_Base()
        {
            return;
        }// end function

    }
}
