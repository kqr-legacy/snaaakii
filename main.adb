pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);

with Ada.Real_Time;

with Curses_H;

with Game;
with Game.Logic;
with Game.Snake;

procedure Main with SPARK_Mode is
   
   procedure NCurses_Init is
      Window : Curses_H.Window_Ptr;
      Status : Integer;
   begin
      Window := Curses_H.Initscr;
      Status := Curses_H.Cbreak;
      Status := Curses_H.Noecho;
      Status := Curses_H.Nodelay (Window, 1);
      Status := Curses_H.Keypad (Window, 1);
   end NCurses_Init;
   
   procedure NCurses_Get_Last_Key (Key : out Integer) is
      Temp : Integer;
   begin
      Key := -1;
      loop
         Temp := Curses_H.Getch;
         exit when Temp not in Curses_H.Key_Down .. Curses_H.Key_Left;
         Key := Temp;
      end loop;
   end NCurses_Get_Last_Key;

   Snake : Game.Snake.Object := Game.Snake.Init;

   Last_Input : Integer;
   use type Ada.Real_Time.Time;
   Next_Frame : Ada.Real_Time.Time := Ada.Real_Time.Clock;
begin
   NCurses_Init;
   loop
      pragma Loop_Invariant (Curses_H.User_Terminal and Snake.Empty_Ahead);

      NCurses_Get_Last_Key (Last_Input);
      case Last_Input is
         when Curses_H.Key_Up => Snake.Turn (Game.North);
         when Curses_H.Key_Right => Snake.Turn (Game.West);
         when Curses_H.Key_Down => Snake.Turn (Game.South);
         when Curses_H.Key_Left => Snake.Turn (Game.East);
         when others => pragma Assert (Last_Input = -1);
      end case;
      
      pragma Assert (Snake.Empty_Ahead);
      if Snake.Empty_Ahead then
         Game.Logic.Step (Snake);
      else
         exit;
      end if;

      declare
         Status : Integer;
      begin
         Status := Curses_H.Clear;
         Snake.Render;
         Game.Render;
         Status := Curses_H.Refresh;
      end;

      Next_Frame := Next_Frame + Ada.Real_Time.Milliseconds (500);
      delay until Next_Frame;
   end loop;
   declare
      Status : Integer;
   begin
      Status := Curses_H.Endwin;
   end;
end Main;
