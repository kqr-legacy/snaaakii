with Game.UI.NCurses.Curses_H;

package body Game.UI.NCurses with
   SPARK_Mode,
   Refined_State => (User_Terminal => (Initialised, Curses_H.Terminal_Effects))
is
   function Is_Started return Boolean is (Initialised);

   procedure Init is
      Window : Curses_H.Window_Ptr;
   begin
      Curses_H.Initscr (Window);
      Curses_H.Cbreak;
      Curses_H.Noecho;
      Curses_H.Nodelay (Window, 1);
      Curses_H.Keypad (Window, 1);
      Initialised := True;
   end Init;

   procedure Draw (Symbol : Character; X : Longitude; Y : Latitude) is
   begin
      Curses_H.Mvaddch
        (Integer (Y),
         Integer (X),
         Symbol);
   end Draw;
   
   procedure Get_Last_Key (Key : out Key_Press) is
      C_Key : Integer;
      Temp : Key_Press;
   begin
      Key := None;
      loop
         Curses_H.Getch (C_Key);
         if Valid_Key_Press (C_Key) then
            Temp := To_Key_Press (C_Key);
            exit when Temp = None;
            Key := Temp;
         end if;
      end loop;
   end Get_Last_Key;

   procedure Clear is
   begin
      Curses_H.Clear;
   end Clear;

   procedure Refresh is
   begin
      Curses_H.Refresh;
   end Refresh;
   
   procedure Reset is
   begin
      Curses_H.Endwin;
      Initialised := False;
   end Reset;
end Game.UI.NCurses;
