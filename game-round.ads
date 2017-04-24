with Game.Entities;

package Game.Round with SPARK_Mode is

   Entities : Game.Entities.Entity_Array (Entity_Index);

   procedure Start with
      Global => (Output => Entities),
      Depends => (Entities => null);

--   procedure Step with
--      Global => (In_Out => Game_State),
--      Depends => (Game_State =>+ null);

end Game.Round;
