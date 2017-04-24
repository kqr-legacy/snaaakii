with NCurses;

package Game.Food with SPARK_Mode, Abstract_State => Food_Location is
   function Is_At (Position : Coordinate) return Boolean;

   procedure Respawn with
      Global => (Output => Food_Location);

   procedure Render with
      Pre => NCurses.Is_Initialised,
      Post => NCurses.Is_Initialised,
      Global => (Input => Food_Location, In_Out => NCurses.User_Terminal);
private
   Food_Position : Coordinate with
      Part_Of => Food_Location;

   function Is_At (Position : Coordinate) return Boolean is
     (Position = Food_Position);
end Game.Food;
