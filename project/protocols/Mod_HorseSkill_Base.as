package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_HorseSkill_Base extends Object
    {
        public static const DEPLOY:int = 0;
        public static const NODEPLOY:int = 1;
        public static const REPLACE:int = 2;
        public static const SUCCESS:int = 3;
        public static const ERROR:int = 4;
        public static const NOT_ENOUGTH_YU_LING_DAN:int = 5;
        public static const NOT_ENOUGTH_INGOT:int = 6;
        public static const NOT_ENOUGTH_DAOYUAN:int = 7;
        public static const IS_SET:int = 8;
        public static const player_role_list:Object = {module:338, action:0, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.UByteUtil], [Utils.IntUtil, Utils.ByteUtil]]};
        public static const equip_horse_stone:Object = {module:338, action:1, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const taking_off_horse_stone:Object = {module:338, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const up_level_info:Object = {module:338, action:3, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil]]};
        public static const up_level:Object = {module:338, action:4, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const horse_list:Object = {module:338, action:5, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const set_horse:Object = {module:338, action:6, request:[Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const active_skill:Object = {module:338, action:7, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const skill_info:Object = {module:338, action:8, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_radom_skill:Object = {module:338, action:9, request:[Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const giving_up_radom_skill:Object = {module:338, action:10, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const set_new_skill:Object = {module:338, action:11, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const all_my_skill_list:Object = {module:338, action:12, request:[], response:[[Utils.IntUtil, Utils.ByteUtil]]};
        public static const add_yu_ling_dan:Object = {module:338, action:13, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["player_role_list", "equip_horse_stone", "taking_off_horse_stone", "up_level_info", "up_level", "horse_list", "set_horse", "active_skill", "skill_info", "get_radom_skill", "giving_up_radom_skill", "set_new_skill", "all_my_skill_list", "add_yu_ling_dan"];

        public function Mod_HorseSkill_Base()
        {
            return;
        }// end function

    }
}
