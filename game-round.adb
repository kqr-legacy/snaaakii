with Game.Logic;

package body Game.Round with SPARK_Mode is
   procedure Start is
      Centre : Coordinate :=
        (Longitude'First + (Longitude'Last - Longitude'First)/2,
         Latitude'First + (Latitude'Last - Latitude'First)/2);
   begin
      Snake.Position := Centre;
      Snake.Direction := North;
      Snake.Tail := (others => (1,1));
      Snake.Length := 1;
--   Game.Food.Respawn;
   end Start;
   
   procedure Update is
   begin
      Game.Logic.Step (Snake);
   end Update;

   function Valid_State return Boolean is
     (Snake.Valid);

end Game.Round;
