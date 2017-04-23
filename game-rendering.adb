with NCurses;

package body Game.Rendering with
   Refined_State => (Graphics => NCurses.User_Terminal)
is
   procedure Render with
      Refined_Global => (Input => Game_Snake, In_Out => NCurses.User_Terminal)
   is
   begin
      Render (Game_Snake);
   end Render;

   procedure Render (Self : Game.Snake.Object) with
      Refined_Global => (In_Out => NCurses.User_Terminal)
   is
   begin
      NCurses.Draw ('h', Slef.Position);
      for I in Self.Get_Tail'Range loop
         pragma Loop_Invariant (NCurses.Is_Started);
         NCurses.Draw ('t', Self.Get_Tail (I));
      end loop;
   end Render;
end Game.Rendering;
