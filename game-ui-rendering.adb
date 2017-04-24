with Game.UI.NCurses;

package body Game.UI.Rendering with
   SPARK_Mode,
   Refined_State => (Graphics => Game.UI.NCurses.User_Terminal)
is
   procedure Render with
      Refined_Global => (Input => Game_Snake, In_Out => Game.UI.NCurses.User_Terminal)
   is
   begin
      Game.UI.NCurses.Clear;
      Render (Game.Round.Snake);
      Game.UI.NCurses.Refresh;
   end Render;

   procedure Render (Self : Game.Snake.Object) with
      Refined_Global => (In_Out => Game.UI.NCurses.User_Terminal)
   is
   begin
      Game.UI.NCurses.Draw ('h', Self.Position);
      for I in Self.Get_Tail'Range loop
         pragma Loop_Invariant (Game.UI.NCurses.Is_Started);
         Game.UI.NCurses.Draw ('t', Self.Get_Tail (I));
      end loop;
   end Render;
end Game.UI.Rendering;
