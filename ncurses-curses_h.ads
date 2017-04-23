private package NCurses.Curses_H with
   SPARK_Mode,
   Abstract_State => (Terminal_Effects with Part_Of => NCurses.User_Terminal),
   Initializes => Curses_H.Terminal_Effects
is
   type Window_Ptr is private;
   
   procedure Initscr (Window : out Window_Ptr) with
      Global => (In_Out => Terminal_Effects);

   procedure Mvaddch (Y : Integer; X : Integer; C : Character) with
      Global => (In_Out => Terminal_Effects);

   procedure Clear with
      Global => (In_Out => Terminal_Effects);

   procedure Refresh with
      Global => (In_Out => Terminal_Effects);

   procedure Cbreak with
      Global => (In_Out => Terminal_Effects);

   procedure Noecho with
      Global => (In_Out => Terminal_Effects);

   procedure Keypad (Window : Window_Ptr; On_Off : Integer) with
      Global => (In_Out => Terminal_Effects);

   procedure Nodelay (Window : Window_Ptr; On_Off : Integer) with
      Global => (In_Out => Terminal_Effects);

   procedure Getch (Symbol : out Integer) with
      Global => (In_Out => Terminal_Effects);

   procedure Endwin with
      Global => (In_Out => Terminal_Effects);

private
   pragma SPARK_Mode (Off);
   type Window_Null is null record;
   type Window_Ptr is access Window_Null;
end NCurses.Curses_H;
