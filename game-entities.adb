with Game.Components;
with Game.Entities.Views;

package body Game.Entities with SPARK_Mode is
   package Position is
      new Game.Entities.Views
        (Game.Components.Position,
         Game.Components.Position'(1,1));
   package Appearance is
      new Game.Entities.Views
        (Game.Components.Appearance,
         Game.Components.Appearance'(' ', 0.0));

   function Snake
      return Entity
   is
      Self : Entity;
   begin
      Position.Set (Self, Game.Components.Position'(3, 2));
      Appearance.Set (Self, Game.Components.Appearance'('G', 1.0));
      return Self;
   end Snake;
end Game.Entities;
