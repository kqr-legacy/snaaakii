with Game.Components;
use type Game.Components.Component;
with Game.Components.Collection;

package Game.Entities with SPARK_Mode is
   type Entity is tagged record
      Components : Game.Components.Collection.Storage;
   end record;

   type Entity_Array is array (Entity_Index range <>) of Entity;
   
   procedure Add_Component
      (Self : in out Entity; Component : Game.Components.Component'Class)
   with
      Pre'Class => Self.Components.Valid and then (for Some CI in Component_Index => Self.Components.Free_Slot (CI)),
      Post'Class => Self.Components.Valid and then (for Some CI in Component_Index => Self.Components.Get (Ci) = Component),
      Global => null;
end Game.Entities;
