package body NCurses.Curses_H with
   SPARK_Mode => Off
is
   procedure Initscr (Window : out Window_Ptr) is
      function C_Initscr return Window_Ptr with
         Import => True,
         Convention => C,
         External_Name => "initscr";

   begin
      Window := C_Initscr;
      Initialised := True;
   end Initscr;

   procedure Mvaddch (Y : Integer; X : Integer; C : Character) is
      function C_Mvaddch (Y : Integer; X : Integer; C : Character) return Integer with
         Import => True,
         Convention => C,
         External_Name => "mvaddch";

      Status : Integer;
   begin
      Status := C_Mvaddch (Y, X, C);
   end Mvaddch;
   
   procedure Clear is
      function C_Clear return Integer with
         Import => True,
         Convention => C,
         External_Name => "clear";

      Status : Integer;
   begin
      Status := C_Clear;
   end Clear;
   
   procedure Refresh is
      function C_Refresh return Integer with
         Import => True,
         Convention => C,
         External_Name => "refresh";

      Status : Integer;
   begin
      Status := C_Refresh;
   end Refresh;

   procedure Cbreak is
      function C_Cbreak return Integer with
         Import => True,
         Convention => C,
         External_Name => "cbreak";

      Status : Integer;
   begin
      Status := C_Cbreak;
   end Cbreak;

   procedure Noecho is
      function C_Noecho return Integer with
         Import => True,
         Convention => C,
         External_Name => "noecho";

      Status : Integer;
   begin
      Status := C_Noecho;
   end Noecho;

   procedure Keypad (Window : Window_Ptr; On_Off : Integer) is
      function C_Keypad (Window : Window_Ptr; On_Off : Integer) return Integer with
         Import => True,
         Convention => C,
         External_Name => "keypad";

      Status : Integer;
   begin
      Status := C_Keypad (Window, On_Off);
   end Keypad;

   procedure Nodelay (Window : Window_Ptr; On_Off : Integer) is
      function C_Nodelay (Window : Window_Ptr; On_Off : Integer) return Integer with
         Import => True,
         Convention => C,
         External_Name => "nodelay";
      
      Status : Integer;
   begin
      Status := C_Nodelay (Window, ON_Off);
   end Nodelay;

   procedure Getch (Symbol : out Integer) is
      function C_Getch return Integer with
         Import => True,
         Convention => C,
         External_Name => "getch";
   begin
      Symbol := C_Getch;
   end Getch;

   procedure Endwin is
      function C_Endwin return Integer with
         Import => True,
         Convention => C,
         External_Name => "endwin";

      Status : Integer;
   begin
      Status := C_Endwin;
      Initialised := False;
   end Endwin;
end NCurses.Curses_H;
