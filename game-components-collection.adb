with Ada.Unchecked_Deallocation;

package body Game.Components.Collection with SPARK_Mode => Off is

   procedure Init (Self : out Storage) is
      Component : No_Component;
   begin
      for CI in Component_Index loop
         Self.Set (CI, Component);
      end loop;
   end Init;

   procedure Set (Self : in out Storage; CI : Component_Index; New_Component : Component'Class) is
      procedure Free is new Ada.Unchecked_Deallocation
        (Component'Class, Component_Ptr);
   begin
      Free (Self.Contents (CI));
      Self.Contents (CI) := new Component'Class'(New_Component);
   end Set;

   function Free_Slots (Self : Storage) return Natural is
      Count : Natural := 0;
   begin
      for CI in Component_Index loop
         if Self.Free_Slot (CI) then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end Free_Slots;
end Game.Components.Collection;
