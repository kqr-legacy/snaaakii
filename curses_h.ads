package Curses_H with SPARK_Mode is
   User_Terminal : Boolean := False with Ghost;

   Key_Down : constant Integer := 8#402#;
   Key_Up : constant Integer := 8#403#;
   Key_Right : constant Integer := 8#404#;
   Key_Left : constant Integer := 8#405#;

   type Window_Ptr is private;

   pragma Warnings (GNATProve, Off, "function result");
   function Initscr return Window_Ptr with
      Post => User_Terminal,
      Global => User_Terminal,
      Import => True,
      Convention => C,
      External_Name => "initscr";
   pragma Warnings (GNATProve, On, "function result");

   function Mvaddch (Y : Integer; X : Integer; C : Character) return Integer with
      Pre => User_Terminal,
      Global => User_Terminal,
      Import => True,
      Convention => C,
      External_Name => "mvaddch";
   
   function Clear return Integer with
      Pre => User_Terminal,
      Global => User_Terminal,
      Import => True,
      Convention => C,
      External_Name => "clear";
   
   function Getmaxy return Integer with
      Pre => User_Terminal,
      Global => User_Terminal,
      Post => Getmaxy'Result in 0 .. 1000,
      Import => True,
      Convention => C,
      External_Name => "getmaxy";
   
   function Refresh return Integer with
      Pre => User_Terminal,
      Global => User_Terminal,
      Import => True,
      Convention => C,
      External_Name => "refresh";

   function Cbreak return Integer with
      Pre => User_Terminal,
      Global => User_Terminal,
      Import => True,
      Convention => C,
      External_Name => "cbreak";

   function Noecho return Integer with
      Pre => User_Terminal,
      Global => User_Terminal,
      Import => True,
      Convention => C,
      External_Name => "noecho";

   function Keypad (Window : Window_Ptr; On_Off : Integer) return Integer with
      Pre => User_Terminal,
      Global => User_Terminal,
      Import => True,
      Convention => C,
      External_Name => "keypad";

   function Nodelay (Window : Window_Ptr; On_Off : Integer) return Integer with
      Pre => User_Terminal,
      Global => User_Terminal,
      Import => True,
      Convention => C,
      External_Name => "nodelay";

   function Getch return Integer with
      Pre => User_Terminal,
      Global => User_Terminal,
      Import => True,
      Convention => C,
      External_Name => "getch";

   function Endwin return Integer with
      Pre => User_Terminal,
      Global => User_Terminal,
      Import => True,
      Convention => C,
      External_Name => "endwin";
private
   pragma SPARK_Mode (Off);
   type Window_Null is null record;
   type Window_Ptr is access Window_Null;
end Curses_H;
