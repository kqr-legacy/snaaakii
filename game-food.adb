with Game.Random_Coordinate;

package body Game.Food with
   SPARK_Mode,
   Refined_State => (Food_Location => Food_Position)
is
   procedure Respawn --with
--      Refined_Global => Food_Position
   is
   begin
      Game.Random_Coordinate.Random (Food_Position);
   end Respawn;

   procedure Render is
   begin
      NCurses.Draw ('o', Food_Position);
   end Render;
end Game.Food;
