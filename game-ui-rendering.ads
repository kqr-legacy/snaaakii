with Game.Round;
with Game.Snake;

package Game.UI.Rendering with
   SPARK_Mode,
   Abstract_State => Graphics
is
   procedure Render with
      Global => (Input => Game.Round.Snake, In_Out => Graphics);

   procedure Render (Snake : Game.Snake.Object) with
      Global => (In_Out => Graphics);
private
end Game.UI.Rendering;
