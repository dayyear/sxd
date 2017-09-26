package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ChildrenPracticeProperty_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NO_TIMES:int = 1;
        public static const NO_GROWTH_GONTH:int = 2;
        public static const NO_GOLD:int = 3;
        public static const MAX_LEVEL:int = 4;
        public static const FAILURE:int = 5;
        public static const NO_CASTING_POINT_NUM:int = 6;
        public static const NO_GHOST_NUM:int = 7;
        public static const NO_CHILDREN_PRACTICE_LEVEL:int = 8;
        public static const NO_CHENG_SHENG:int = 9;
        public static const NO_SKILL:int = 10;
        public static const MAX_SKILL_LEVEL:int = 11;
        public static const get_children_practice_property_info:Object = {module:343, action:0, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.IntUtil], [Utils.ByteUtil, Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const refining:Object = {module:343, action:1, request:[Utils.ByteUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const children_practice:Object = {module:343, action:2, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil], [Utils.ByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_children_practice_property_info", "refining", "children_practice"];

        public function Mod_ChildrenPracticeProperty_Base()
        {
            return;
        }// end function

    }
}
