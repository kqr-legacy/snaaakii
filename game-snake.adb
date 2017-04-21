package body Game.Snake with SPARK_Mode is
   function Init return Object is
      Centre : Coordinate :=
        (Longitude'First + (Longitude'Last - Longitude'First)/2,
         Latitude'First + (Latitude'Last - Latitude'First)/2);
      Self : Object;
   begin
      Self.Position := Centre;
      Self.Direction := North;
      Self.Tail := (others => (1,1));
      Self.Length := 1;
      return Self;
   end Init;
   
   procedure Turn (Self : in out Object; Direction : Absolute_Direction) is
   begin
      Self.Direction := Direction;
   end Turn;
   
   procedure Advance (Self : in out Object) is
   begin
      for I in reverse Self.Tail'Range loop
         if I = Self.Tail'First then
            Self.Tail (I) := Self.Position;
         else
            Self.Tail (I) := Self.Tail (I - 1);
         end if;
         pragma Loop_Invariant (Self.Ahead_In_Bounds);
      end loop;

      case Self.Direction is
         when North =>
            Self.Position.Y := Self.Position.Y - 1;
         when South =>
            Self.Position.Y := Self.Position.Y + 1;
         when East =>
            Self.Position.X := Self.Position.X + 1;
         when West =>
            Self.Position.X := Self.Position.X - 1;
      end case;
   end Advance;

   procedure Render (Self : Object) is
      Status : Integer;
   begin
      Status := Curses_H.Mvaddch (Integer (Self.Position.Y), Integer (Self.Position.X), 'b');
      for Coord of Self.Get_Tail loop
         Status := Curses_H.Mvaddch (Integer (Coord.Y), Integer (Coord.X), 's');
      end loop;
   end Render;
end Game.Snake;
