package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_DanceAction_Base extends Object
    {
        public static const TURE:int = 0;
        public static const FALSE:int = 1;
        public static const DANCE:int = 2;
        public static const ACTION:int = 3;
        public static const SUCCESS:int = 4;
        public static const WITHOUT:int = 5;
        public static const FAILURE:int = 6;
        public static const get_dance_action_info:Object = {module:344, action:0, request:[], response:[[Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil]]};
        public static const use_action:Object = {module:344, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const notify_player_use_prop:Object = {module:344, action:2, request:[], response:[Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_dance_action_info", "use_action", "notify_player_use_prop"];

        public function Mod_DanceAction_Base()
        {
            return;
        }// end function

    }
}
