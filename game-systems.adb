with Game.Components;
with Game.Entities.Views;
pragma Elaborate_All (Game.Entities.Views);

package body Game.Systems with SPARK_Mode is
   package Position is
      new Game.Entities.Views
        (Game.Components.Position,
         Game.Components.Position'(1,1));
   package Appearance is
      new Game.Entities.Views
        (Game.Components.Appearance,
         Game.Components.Appearance'(' ', 0.0));

   procedure Render (Entity : Game.Entities.Entity) is
   begin
      if Position.Exists (Entity) and Appearance.Exists (Entity) then
         NCurses.Draw
           (Appearance.Get (Entity).Symbol,
            Natural (Position.Get (Entity).X - Longitude'First),
            Natural (Position.Get (Entity).Y - Latitude'First));
      end if;
   end Render;

end Game.Systems;
