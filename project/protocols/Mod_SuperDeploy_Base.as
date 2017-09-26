package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SuperDeploy_Base extends Object
    {
        public static const SUCCEED:int = 0;
        public static const NOT_MY_ROLE:int = 1;
        public static const LEAVE_TEAM:int = 2;
        public static const NOT_ENOUGTH_LEVEL:int = 3;
        public static const CAN_NOT_DOWN_MAIN_ROLE:int = 4;
        public static const SPECIAL_ROLE:int = 5;
        public static const FULL_DEPLOY:int = 6;
        public static const DEPLOY_LIMIT:int = 7;
        public static const ERROR:int = 8;
        public static const super_deploy_list:Object = {module:46, action:0, request:[], response:[[Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil], [Utils.ByteUtil, Utils.IntUtil]]};
        public static const up_deploy:Object = {module:46, action:1, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const down_deploy:Object = {module:46, action:2, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const deploy_research_and_first_attack:Object = {module:46, action:3, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const new_deploy_grid_open_notify:Object = {module:46, action:4, request:[], response:[[Utils.ByteUtil]]};
        public static const my_deploy_list:Object = {module:46, action:5, request:[], response:[Utils.ByteUtil, [Utils.ByteUtil, Utils.StringUtil]]};
        public static const set_my_deploy:Object = {module:46, action:6, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const set_deploy_name:Object = {module:46, action:7, request:[Utils.ByteUtil, Utils.StringUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.StringUtil]};
        public static const Actions:Array = ["super_deploy_list", "up_deploy", "down_deploy", "deploy_research_and_first_attack", "new_deploy_grid_open_notify", "my_deploy_list", "set_my_deploy", "set_deploy_name"];

        public function Mod_SuperDeploy_Base()
        {
            return;
        }// end function

    }
}
