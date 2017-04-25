with Game.Components;
with Game.Components.Collection;

package body Game.Entities.Views with SPARK_Mode is
   
   function Count
     (Self : Entity)
      return Natural
   is
      Count : Natural := 0;
   begin
      for CI in Component_Index loop
         if Self.Components.Get (CI) in Component_Type'Class then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end Count;
   
   function Empty_Slots
     (Self : Entity)
      return Natural
   is
      Count : Natural := 0;
   begin
      for CI in Component_Index loop
         if Self.Components.Get (CI) in Game.Components.No_Component'Class then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end Empty_Slots;

   procedure Set
     (Self : in out Entity;
      Component : Component_Type)
   is begin
      if Count (Self) = 0 then
         for CI in Component_Index loop
            if Self.Components.Get (CI) in Game.Components.No_Component'Class then
               Self.Components.Set (CI, Component);
               return;
            end if;
         end loop;
      else
         Modify (Self, Component);
      end if;
   end Set;

   procedure Delete
     (Self : in out Entity)
   is
      Empty : Game.Components.No_Component;
   begin
      for CI in Component_Index loop
         if Self.Components.Get (CI) in Component_Type'Class then
            Self.Components.Set (CI, Empty);
            return;
         end if;
      end loop;
   end Delete;
   
   procedure Modify
     (Self : in out Entity;
      Component : Component_Type)
   is begin
      for CI in Component_Index loop
         pragma Loop_Invariant (Count (Self) = 1);
         if Self.Components.Get (CI) in Component_Type'Class then
            Self.Components.Set (CI, Component);
         end if;
      end loop;
   end Modify;
   
   function Get
     (Self : Entity)
      return Component_Type
   is begin
      for CI in Component_Index loop
         if Self.Components.Get (CI) in Component_Type'Class then
            return Component_Type (Self.Components.Get (CI));
         end if;
      end loop;
      return Default_Component;
   end Get;

end Game.Entities.Views;
