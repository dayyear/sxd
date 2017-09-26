package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StRanking_Base extends Object
    {
        public static const get_st_ranking:Object = {module:174, action:0, request:[Utils.ShortUtil], response:[[Utils.IntUtil, Utils.StringUtil, Utils.LongUtil, Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil], [Utils.IntUtil, Utils.StringUtil, Utils.LongUtil, Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil]]};
        public static const get_have_award_st_ranking:Object = {module:174, action:1, request:[], response:[[Utils.ShortUtil]]};
        public static const Actions:Array = ["get_st_ranking", "get_have_award_st_ranking"];

        public function Mod_StRanking_Base()
        {
            return;
        }// end function

    }
}
