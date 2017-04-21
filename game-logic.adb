package body Game.Logic is
   procedure Step (Current_Snake : in out Game.Snake.Object) is
   begin
      if Current_Snake.Empty_Ahead then
         Current_Snake.Advance;
      end if;
   end Step;
end Game.Logic;
