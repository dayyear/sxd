package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Artifact_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FAILURE:int = 1;
        public static const GRID_ID_ERROR:int = 2;
        public static const NO_THIS_PLAYER:int = 3;
        public static const HAD_EQUIP:int = 4;
        public static const NO_ENOUGH_MATE:int = 5;
        public static const get_artifact_info:Object = {module:380, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const unlock_skill:Object = {module:380, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const equip:Object = {module:380, action:2, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil]]};
        public static const get_make_artifact_info:Object = {module:380, action:3, request:[], response:[[Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const make_artifact:Object = {module:380, action:4, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_artifact_info", "unlock_skill", "equip", "get_make_artifact_info", "make_artifact"];

        public function Mod_Artifact_Base()
        {
            return;
        }// end function

    }
}
