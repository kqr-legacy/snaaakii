package Game.Snake with SPARK_Mode is
   Max_Length : constant Positive
      := Natural (Longitude'Last - Longitude'First)
       * Natural (Latitude'Last - Latitude'First);
   type Snake_Length is new Positive range 1 .. Max_Length;
   type Coordinate_Array is array (Snake_Length range <>) of Coordinate;

   type Object is new Game.Object with record
      Tail : Coordinate_Array (Snake_Length);
      Length : Snake_Length;
   end record;
   
   function Get_Tail (Self : Object) return Coordinate_Array is
     (Self.Tail (Self.Tail'First .. Self.Tail'First + Self.Length - 2));

   function Has_Knot (Self : Object) return Boolean is
     (for some I in Self.Get_Tail'Range => Self.Position = Self.Get_Tail (I));

   function Valid (Self : Object) return Boolean is
     (Game.Object (Self).Valid and then not Self.Has_Knot);

end Game.Snake;
