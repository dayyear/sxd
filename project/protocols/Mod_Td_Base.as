package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Td_Base extends Object
    {
        public static const ALIVE:int = 0;
        public static const DEAD:int = 1;
        public static const SUCCESS:int = 2;
        public static const NO_OPEN:int = 3;
        public static const ALREADY_ENTER:int = 4;
        public static const ERROR:int = 5;
        public static const NO_ENTER_RACE:int = 6;
        public static const IN_WAR:int = 7;
        public static const ARRIVE:int = 8;
        public static const get_race_players:Object = {module:143, action:0, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil], Utils.ShortUtil]};
        public static const enter:Object = {module:143, action:1, request:[], response:[Utils.UByteUtil]};
        public static const quit_race:Object = {module:143, action:2, request:[], response:[Utils.UByteUtil]};
        public static const move_to:Object = {module:143, action:3, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const move_to_finally:Object = {module:143, action:4, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const fight:Object = {module:143, action:5, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const notify_move_to:Object = {module:143, action:6, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_enter_race:Object = {module:143, action:7, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil]};
        public static const notify_quit_race:Object = {module:143, action:8, request:[], response:[Utils.IntUtil]};
        public static const notify_monster_in:Object = {module:143, action:9, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const notify_monster_out:Object = {module:143, action:10, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_race_players", "enter", "quit_race", "move_to", "move_to_finally", "fight", "notify_move_to", "notify_enter_race", "notify_quit_race", "notify_monster_in", "notify_monster_out"];

        public function Mod_Td_Base()
        {
            return;
        }// end function

    }
}
