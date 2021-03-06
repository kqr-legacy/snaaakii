pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);
with Ada.Real_Time; use type Ada.Real_Time.Time;

with NCurses;
with Game;
with Game.Entities;
with Game.Components;
with Game.Systems;

procedure Main with SPARK_Mode is
   pragma Warnings (GNATProve, Off, "initialization");
   Next_Frame : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   pragma Warnings (GNATProve, On, "initialization");

   Entities : Game.Entities.Entity_Array (Game.Entity_Index);
begin
   NCurses.Init;
   Entities (1) := Game.Entities.Snake;
   loop
      NCurses.Clear;
      for EI in Game.Entity_Index loop
         Game.Systems.Render (Entities (EI));
      end loop;
      NCurses.Draw ('X', 2, 2);
      NCurses.Refresh;

      pragma Warnings (GNATProve, Off, "unused assignment");
      Next_Frame := Next_Frame + Ada.Real_Time.Milliseconds (500);
      pragma Warnings (GNATProve, On, "unused assignment");
      pragma Warnings (GNATProve, Off, "statement has no effect");
      delay until Next_Frame;
      pragma Warnings (GNATProve, On, "statement has no effect");
   end loop;
   NCurses.Reset;
end Main;
