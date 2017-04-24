package body Game.Logic with SPARK_Mode is
   procedure Step (Self : in out Object) is
   begin
      case Self.Direction is
         when North =>
            Self.Position.Y := Self.Position.Y - 1;
         when South =>
            Self.Position.Y := Self.Position.Y + 1;
         when East =>
            Self.Position.X := Self.Position.X + 1;
         when West =>
            Self.Position.X := Self.Position.X - 1;
         when None =>
            null;
      end case;
   end Step;

   procedure Step (Self : in out Game.Snake.Object) is
   begin
      Self.Tail (Self.Tail'First + 1 .. Self.Tail'Last) :=
         Self.Tail (Self.Tail'First .. Self.Tail'Last - 1);
      Self.Tail (Self.Tail'First) := Self.Position;
      
      Step (Object (Self));
   end Step;
end Game.Logic;
