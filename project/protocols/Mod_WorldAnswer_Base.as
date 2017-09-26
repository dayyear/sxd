package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_WorldAnswer_Base extends Object
    {
        public static const notify_answer_will_begin_after_one_minute:Object = {module:164, action:0, request:[], response:[Utils.IntUtil]};
        public static const notify_question:Object = {module:164, action:1, request:[], response:[Utils.StringUtil, Utils.ByteUtil]};
        public static const notify_result_and_award_player_list:Object = {module:164, action:2, request:[], response:[Utils.StringUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil], Utils.IntUtil]};
        public static const Actions:Array = ["notify_answer_will_begin_after_one_minute", "notify_question", "notify_result_and_award_player_list"];

        public function Mod_WorldAnswer_Base()
        {
            return;
        }// end function

    }
}
