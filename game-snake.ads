with Curses_H;

package Game.Snake with SPARK_Mode is
   type Object is tagged private;

   function Empty_Ahead (Self : Object) return Boolean;
   function Init return Object with
      Post'Class => Init'Result.Empty_Ahead;
   procedure Turn (Self : in out Object; Direction : Absolute_Direction);
   procedure Advance (Self : in out Object) with
      Pre'Class => Self.Empty_Ahead;

   procedure Render (Self : Object) with
      Pre'Class => Curses_H.User_Terminal,
      Post'Class => Curses_H.User_Terminal,
      Global => Curses_H.User_Terminal;
private
   Max_Length : constant Positive
      := Natural (Longitude'Last - Longitude'First)
       * Natural (Latitude'Last - Latitude'First);
   type Snake_Length is new Positive range 1 .. Max_Length;
   type Coordinate_Array is array (Snake_Length range <>) of Coordinate;

   type Object is tagged record
      Position : Coordinate;
      Direction : Absolute_Direction;
      Tail : Coordinate_Array (Snake_Length);
      Length : Snake_Length;
   end record;
   
   function Get_Tail (Self : Object) return Coordinate_Array is
     (Self.Tail (Self.Tail'First .. Self.Tail'First + Self.Length - 2));
   
   function Ahead_In_Bounds (Self : Object) return Boolean is
     (case Self.Direction is
         when North => Self.Position.Y > Latitude'First,
         when East => Self.Position.X < Longitude'Last,
         when South => Self.Position.Y < Latitude'Last,
         when West => Self.Position.X > Longitude'First);

   function Knotted (Self : Object) return Boolean is
     (for some I in Self.Get_Tail'Range => Self.Position = Self.Get_Tail (I));

   function Empty_Ahead (Self : Object) return Boolean is
     (Self.Ahead_In_Bounds and then not Self.Knotted);
end Game.Snake;
