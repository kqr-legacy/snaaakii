with Game.Round;
with Game.Snake;
use type Game.Snake.Snake_Length;

package Game.Logic with SPARK_Mode is
   procedure Step (Self : in out Object) with
      Pre => Self.Valid,
      Global => null,
      Depends => (Self =>+ null);

   procedure Step (Self : in out Game.Snake.Object) with
      Pre => Self.Valid,
      Global => null,
      Depends => (Self =>+ null);

end Game.Logic;
