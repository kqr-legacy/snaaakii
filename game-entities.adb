package body Game.Entities with SPARK_Mode is
   procedure Add_Component
      (Self : in out Entity; Component : Game.Components.Component'Class) is
      Available : Component_Index;
   begin
      for CI in Component_Index loop
         pragma Loop_Invariant
           (Self.Components.Valid and then
              (for Some CJ in CI .. Component_Index'Last =>
                  Self.Components.Free_Slot (CJ)));

         Available := CI;
         exit when Self.Components.Free_Slot (CI);
      end loop;
      pragma Assert (Self.Components.Free_Slot (Available));
      Self.Components.Set (Available, Component);
   end Add_Component;
end Game.Entities;
