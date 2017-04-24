with Game.Snake;

package Game.Round with SPARK_Mode is
   Snake : Game.Snake.Object;

   procedure Start with
      Post => Valid_State,
      Global => (Output => Snake),
      Depends => (Snake => null);
   
   procedure Update with
      Pre => Valid_State,
      Global => (In_Out => Snake),
      Depends => (Snake =>+ null);
   
   function Valid_State return Boolean with
      Global => (Input => Snake),
      Depends => (Valid_State'Result => Snake);

end Game.Round;
