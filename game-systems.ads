with NCurses;
with Game.Entities;

package Game.Systems with SPARK_Mode is

   procedure Render (Entity : Game.Entities.Entity) with
      Global => NCurses.User_Terminal;

end Game.Systems;
