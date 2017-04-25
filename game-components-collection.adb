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

end Game.Components.Collection;
