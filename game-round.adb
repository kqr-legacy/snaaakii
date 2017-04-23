with Game.Snake;
with Game.Logic;

package body Game.Round with
   SPARK_Mode,
   Refined_State => (Game_State => Current_Snake)
is
   Current_Snake : Snake.Object;

   procedure Start with
      Refined_Global => (Output => Current_Snake),
      Refined_Depends => (Current_Snake => null)
   is
      Centre : Coordinate :=
        (Longitude'First + (Longitude'Last - Longitude'First)/2,
         Latitude'First + (Latitude'Last - Latitude'First)/2);
   begin
      Current_Snake.Position := Centre;
      Current_Snake.Direction := North;
      Current_Snake.Tail := (others => (1,1));
      Current_Snake.Length := 1;
--   Game.Food.Respawn;
   end Start;
   
   procedure Update with
      Refined_Global => (In_Out => Current_Snake),
      Refined_Depends => (Current_Snake =>+ null)
   is
   begin
      Game.Logic.Step (Current_Snake);
   end Update;

   function Valid_State return Boolean is
     (Current_Snake.Valid)
   with
      Refined_Global => (Input => Current_Snake),
      Refined_Depends => (Valid_State'Result => Current_Snake);

end Game.Round;
