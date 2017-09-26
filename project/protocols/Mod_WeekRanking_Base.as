package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_WeekRanking_Base extends Object
    {
        public static const RANKING_TYPE_MISSION:int = 0;
        public static const RANKING_TYPE_FAME:int = 1;
        public static const RANKING_TYPE_STATE_POINT:int = 2;
        public static const RANKING_TYPE_COIN:int = 3;
        public static const get_week_ranking:Object = {module:56, action:0, request:[], response:[[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.LongUtil]]]};
        public static const get_week_ranking_first_player:Object = {module:56, action:1, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const notify_week_ranking_type:Object = {module:56, action:2, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_week_ranking", "get_week_ranking_first_player", "notify_week_ranking_type"];

        public function Mod_WeekRanking_Base()
        {
            return;
        }// end function

    }
}
