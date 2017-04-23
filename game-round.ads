package Game.Round with
   SPARK_Mode,
   Abstract_State => (Game_State)
is
   procedure Start with
      Post => Valid_State,
      Global => (Output => Game_State),
      Depends => (Game_State => null);
   
   procedure Update with
      Pre => Valid_State,
      Global => (In_Out => Game_State),
      Depends => (Game_State =>+ null);
   
   function Valid_State return Boolean with
      Global => (Input => Game_State),
      Depends => (Valid_State'Result => Game_State);

end Game.Round;
