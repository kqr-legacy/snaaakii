with Curses_H;

package body Game with SPARK_Mode is
   procedure Render is
      Status : Integer;
   begin
      for I in Natural (Game.Longitude'First) - 1 .. Natural (Game.Longitude'Last) + 1 loop
         Status := Curses_H.Mvaddch (0, Integer (I), '#');
         Status := Curses_H.Mvaddch (Integer (Game.Latitude'Last) + 1, Integer (I), '#');
      end loop;
      for I in Natural (Game.Latitude'First) - 1 .. Natural (Game.Latitude'Last) + 1 loop
         Status := Curses_H.Mvaddch (Integer (I), 0, '#');
         Status := Curses_H.Mvaddch (Integer (I), Integer (Game.Longitude'Last) + 1, '#');
      end loop;
   end Render;
end Game;
