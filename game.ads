package Game with SPARK_Mode is
   type Absolute_Direction is (North, East, South, West, None);

   type Longitude is new Integer range 1 .. 18;
   type Latitude is new Integer range 1 .. 14;

   type Coordinate is record
      X : Longitude;
      Y : Latitude;
   end record;
   
   type Object is tagged record
      Position : Coordinate;
      Direction : Absolute_Direction;
   end record;
      
   function Ahead_In_Bounds (Self : Object) return Boolean is
     (case Self.Direction is
         when North => Self.Position.Y > Latitude'First,
         when East => Self.Position.X < Longitude'Last,
         when South => Self.Position.Y < Latitude'Last,
         when West => Self.Position.X > Longitude'First,
         when None => True);
   
   function Valid (Self : Object) return Boolean is
     (Self.Ahead_In_Bounds);
end Game;
