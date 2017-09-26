package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Children_Base extends Object
    {
        public static const YOU_NIAN:int = 0;
        public static const SHAO_NIAN:int = 1;
        public static const QING_NIAN:int = 2;
        public static const MALE:int = 3;
        public static const FEMALE:int = 4;
        public static const YES:int = 5;
        public static const NO:int = 6;
        public static const SUCCESS:int = 7;
        public static const FUNCTION_UNOPEN:int = 8;
        public static const TOO_LONG:int = 9;
        public static const FORBIDDEN:int = 10;
        public static const FAILED:int = 11;
        public static const LACK_OF_ATTRIBUTE_POINT:int = 12;
        public static const UNDO:int = 13;
        public static const DONE:int = 14;
        public static const ALREADY_DONE:int = 15;
        public static const HUNGRY_LIMIT:int = 16;
        public static const FEELING_LIMIT:int = 17;
        public static const LACK_OF_INGOT:int = 18;
        public static const LACK_OF_GROWTH_GOLD:int = 19;
        public static const CAN:int = 20;
        public static const CANNT:int = 21;
        public static const LACK_OF_BOOK_SCRAP:int = 22;
        public static const YEAR_LIMIT:int = 23;
        public static const CAN_GET:int = 24;
        public static const CANNT_GET:int = 25;
        public static const ALREADY_GET:int = 26;
        public static const PACK_FULL:int = 27;
        public static const CHILDREN_COUNT_LIMIT:int = 28;
        public static const NOT_GET:int = 29;
        public static const NON_ATTEND_SCHOOL:int = 30;
        public static const ON_SCHOOL:int = 31;
        public static const END:int = 32;
        public static const TIMES_LIMIT:int = 33;
        public static const LACK_OF_SUPERNATURAL_SCRAP:int = 34;
        public static const PRACTICE_NOT_END:int = 35;
        public static const NON_QING_NIAN:int = 36;
        public static const LACK_OF_SHI_MEN_LING:int = 37;
        public static const FULL_VALUE:int = 38;
        public static const HAS_NO_ITEM:int = 39;
        public static const get_info:Object = {module:312, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, [Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.ShortUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil], [Utils.ByteUtil], [Utils.ByteUtil], Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil], Utils.ByteUtil]};
        public static const rename:Object = {module:312, action:1, request:[Utils.IntUtil, Utils.StringUtil], response:[Utils.UByteUtil]};
        public static const set_attribute_point:Object = {module:312, action:2, request:[Utils.IntUtil, [Utils.IntUtil, Utils.ShortUtil]], response:[Utils.UByteUtil]};
        public static const get_care_info:Object = {module:312, action:3, request:[Utils.IntUtil], response:[[Utils.ByteUtil, Utils.UByteUtil]]};
        public static const take_care:Object = {module:312, action:4, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil]]};
        public static const get_toy_info:Object = {module:312, action:5, request:[Utils.IntUtil], response:[[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const player_toy:Object = {module:312, action:6, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil]]};
        public static const get_feed_info:Object = {module:312, action:7, request:[Utils.IntUtil], response:[[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const player_feed:Object = {module:312, action:8, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil]]};
        public static const get_learn_info:Object = {module:312, action:9, request:[Utils.IntUtil], response:[Utils.ByteUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.UByteUtil]]};
        public static const player_learn:Object = {module:312, action:10, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_skill_book_package_info:Object = {module:312, action:11, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil], [Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const upgrade_skill_book_level:Object = {module:312, action:12, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, [Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const reset_attribute_point:Object = {module:312, action:13, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const escape_learn:Object = {module:312, action:14, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const equip_skill_book:Object = {module:312, action:15, request:[Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.ByteUtil]]};
        public static const up_deploy:Object = {module:312, action:16, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const is_xian_lu_can_get:Object = {module:312, action:17, request:[], response:[Utils.UByteUtil]};
        public static const get_xian_lu:Object = {module:312, action:18, request:[], response:[Utils.UByteUtil]};
        public static const use_xian_lu:Object = {module:312, action:19, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.UByteUtil]};
        public static const get_role_war_attribute:Object = {module:312, action:20, request:[Utils.IntUtil], response:[Utils.StringUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const get_stunt_info:Object = {module:312, action:21, request:[Utils.IntUtil], response:[[Utils.ShortUtil, Utils.UByteUtil, Utils.UByteUtil]]};
        public static const set_stunt:Object = {module:312, action:22, request:[Utils.IntUtil, Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil]};
        public static const get_supernatural_info:Object = {module:312, action:23, request:[Utils.IntUtil], response:[[Utils.ShortUtil, Utils.UByteUtil, Utils.UByteUtil]]};
        public static const set_supernatural:Object = {module:312, action:24, request:[Utils.IntUtil, Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const set_follow_children:Object = {module:312, action:25, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_school_info:Object = {module:312, action:26, request:[Utils.IntUtil], response:[[Utils.ByteUtil, Utils.UByteUtil]]};
        public static const attend_school:Object = {module:312, action:27, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_study_info:Object = {module:312, action:28, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.ByteUtil, Utils.UByteUtil, [Utils.ByteUtil, Utils.ByteUtil], Utils.ByteUtil, Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil], Utils.ShortUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil]]};
        public static const get_practice_info:Object = {module:312, action:29, request:[Utils.IntUtil], response:[[Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]]};
        public static const buy_growth_gold:Object = {module:312, action:30, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const buy_shi_men_ling:Object = {module:312, action:31, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const challenge:Object = {module:312, action:32, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil]]};
        public static const get_supernatural_package_info:Object = {module:312, action:33, request:[Utils.IntUtil], response:[Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil], [Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const upgrade_supernatural:Object = {module:312, action:34, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, [Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const buy_supnatural_scrap:Object = {module:312, action:35, request:[Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, [Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const buy_skill_book_scrap:Object = {module:312, action:36, request:[Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, [Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const player_study:Object = {module:312, action:37, request:[Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.ByteUtil], Utils.ByteUtil, Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil], Utils.ShortUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const get_deploy_children_info:Object = {module:312, action:38, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil], Utils.ShortUtil, Utils.ShortUtil]};
        public static const get_xi_sui_dan_use_info:Object = {module:312, action:39, request:[], response:[[Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.StringUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]]};
        public static const use_xi_sui_dan:Object = {module:312, action:40, request:[Utils.ShortUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const down_deploy:Object = {module:312, action:41, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const notify_study_task:Object = {module:312, action:42, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_info", "rename", "set_attribute_point", "get_care_info", "take_care", "get_toy_info", "player_toy", "get_feed_info", "player_feed", "get_learn_info", "player_learn", "get_skill_book_package_info", "upgrade_skill_book_level", "reset_attribute_point", "escape_learn", "equip_skill_book", "up_deploy", "is_xian_lu_can_get", "get_xian_lu", "use_xian_lu", "get_role_war_attribute", "get_stunt_info", "set_stunt", "get_supernatural_info", "set_supernatural", "set_follow_children", "get_school_info", "attend_school", "get_study_info", "get_practice_info", "buy_growth_gold", "buy_shi_men_ling", "challenge", "get_supernatural_package_info", "upgrade_supernatural", "buy_supnatural_scrap", "buy_skill_book_scrap", "player_study", "get_deploy_children_info", "get_xi_sui_dan_use_info", "use_xi_sui_dan", "down_deploy", "notify_study_task"];

        public function Mod_Children_Base()
        {
            return;
        }// end function

    }
}
