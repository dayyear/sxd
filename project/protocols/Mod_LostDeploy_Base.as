package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_LostDeploy_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCESS:int = 2;
        public static const NO_ENOUGH_LING_ZHU:int = 3;
        public static const MAX_LEVEL:int = 4;
        public static const get_player_lost_deploy_info:Object = {module:228, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, [Utils.ShortUtil, Utils.UByteUtil], Utils.UByteUtil]};
        public static const activate_artifact:Object = {module:228, action:1, request:[], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const get_player_lost_deploy_data:Object = {module:228, action:2, request:[], response:[Utils.IntUtil, Utils.ShortUtil]};
        public static const auto_activate_artifact:Object = {module:228, action:3, request:[], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const Actions:Array = ["get_player_lost_deploy_info", "activate_artifact", "get_player_lost_deploy_data", "auto_activate_artifact"];

        public function Mod_LostDeploy_Base()
        {
            return;
        }// end function

    }
}
