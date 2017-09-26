package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ElixirSoul_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const ELIXIR_SOUL_NOT_OPEN:int = 1;
        public static const DONE:int = 2;
        public static const UNDO:int = 3;
        public static const HAS_NO_ENOUGH_ELIXIR:int = 4;
        public static const PRE_ELIXIR_SOUL_NOT_ACTIVATE:int = 5;
        public static const LACK_OF_UPGRADE_ELIXIR:int = 6;
        public static const ALREADY_ACTIVATED:int = 7;
        public static const ELIXIR_SOUL_NOT_ACTIVATE:int = 8;
        public static const PRE_ELIXIR_SOUL_SKILL_NOT_ACTIVATE:int = 9;
        public static const LACK_OF_STATE_POINT:int = 10;
        public static const IS_MAIN_ROLE:int = 11;
        public static const FAILURE:int = 12;
        public static const get_role_info:Object = {module:347, action:0, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.UByteUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const activate_elixir_soul:Object = {module:347, action:1, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const activate_elixir_soul_skill:Object = {module:347, action:2, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_exchange_list:Object = {module:347, action:3, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]]};
        public static const exchange_soul:Object = {module:347, action:4, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_role_info", "activate_elixir_soul", "activate_elixir_soul_skill", "get_exchange_list", "exchange_soul"];

        public function Mod_ElixirSoul_Base()
        {
            return;
        }// end function

    }
}
