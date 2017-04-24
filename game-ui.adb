with Game.UI.NCurses;
pragma Elaborate_All (Game.UI.NCurses);

package body Game.UI with
   SPARK_Mode,
   Refined_State => (UI => Game.UI.NCurses.User_Terminal)
is
   function Is_Ready return Boolean is
     (Game.UI.NCurses.Is_Started)
   with
      Refined_Global => Game.UI.NCurses.User_Terminal,
      Refined_Depends => (Is_Ready'Result => Game.UI.NCurses.User_Terminal);

   procedure Init with
      Refined_Global => (In_Out => Game.UI.NCurses.User_Terminal),
      Refined_Depends => (Game.UI.Ncurses.User_Terminal =>+ null)
   is
   begin
      Game.UI.NCurses.Init;
   end Init;

   procedure Teardown with
      Refined_Global => (In_Out => Game.UI.NCurses.User_Terminal),
      Refined_Depends => (Game.UI.NCurses.User_Terminal =>+ null)
   is
   begin
      Game.UI.NCurses.Reset;
   end Teardown;
end Game.UI;
