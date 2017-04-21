with Curses_H;

package Game with SPARK_Mode is
   type Absolute_Direction is (North, East, South, West);
   type Relative_Direction is (Left, Right);

   type Longitude is new Integer range 1 .. 18;
   type Latitude is new Integer range 1 .. 14;

   type Coordinate is record
      X : Longitude;
      Y : Latitude;
   end record;
   
   procedure Render with
      Pre => Curses_H.User_Terminal,
      Post => Curses_H.User_Terminal,
      Global => Curses_H.User_Terminal;
end Game;
