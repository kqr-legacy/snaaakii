pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);
with Ada.Real_Time; use type Ada.Real_Time.Time;

with Game.Round;

procedure Main with SPARK_Mode is
begin
   Game.Round.Start;
end Main;

--with Game.Round;
--with Game.UI;
--with Game.UI.Rendering;

--procedure Main with SPARK_Mode is
--   pragma Warnings (GNATProve, Off, "initialization");
--   Next_Frame : Ada.Real_Time.Time := Ada.Real_Time.Clock;
--   pragma Warnings (GNATProve, On, "initialization");
--begin
--   Game.UI.Init;
--   Game.Round.Start;
--   loop
--      pragma Loop_Invariant (Game.UI.Is_Ready and Game.Round.Valid_State);
--      Game.Round.Update;
--
--      -- TODO: write "decision" component which does updates which aren't dumb
--      --       simple position += velocity updates (this includes collecting
--      --       user inputs for user controlled entities.)
--      -- TODO: finish rendering component which renders entities (this is necessarily ncurses dependent)

--      declare
--         Input : NCurses.Key_Press;
--         Requested_Direction : Game.Absolute_Direction;
--      begin
--         NCurses.Get_Last_Key (Input);
--         case Input is
--            when NCurses.Up => Requested_Direction := Game.North;
--            when NCurses.Right => Requested_Direction := Game.West;
--            when NCurses.Down => Requested_Direction := Game.South;
--            when NCurses.Left => Requested_Direction := Game.East;
--            when NCurses.None => Requested_Direction := Game.None;
--            when NCurses.Q => exit;
--         end case;

-- --   procedure Turn (Self : in out Object; Direction : Absolute_Direction) is
-- --   begin
-- --      if Direction /= None then
-- --         Self.Direction := Direction;
-- --      end if;
-- --   end Turn;
--         Game.Step (Requested_Direction);
--      end;

--      Game.UI.Rendering.Render;
--
--      pragma Warnings (GNATProve, Off, "unused assignment");
--      Next_Frame := Next_Frame + Ada.Real_Time.Milliseconds (500);
--      pragma Warnings (GNATProve, On, "unused assignment");
--      pragma Warnings (GNATProve, Off, "statement has no effect");
--      delay until Next_Frame;
--      pragma Warnings (GNATProve, On, "statement has no effect");
--
--      if not Game.Round.Valid_State then
--         exit;
--      end if;
--   end loop;
--
--   Game.UI.Teardown;
--end Main;
