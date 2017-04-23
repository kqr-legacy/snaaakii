with Game.Snake;

package Game.Rendering with
   Abstract_State => Graphics
is
   procedure Render with
      Global => (Input => Game_State, In_Out => Graphics);

   procedure Render (Snake : Game.Snake.Object) with
      Global => (In_Out => Graphics);
private
end Game.Rendering;
