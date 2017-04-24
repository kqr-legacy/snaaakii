with Game.Components;

package body Game.Round with SPARK_Mode is

   procedure Start is
      Snake : Game.Entities.Entity;
   begin
      Snake.Components.Init;
      Snake.Add_Component (Game.Components.Position'(3, 4));
      Entities (1) := Snake;
   end Start;

   procedure Step is
   begin
      null;
   end Step;

end Game.Round;
