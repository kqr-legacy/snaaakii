package Game.Components.Collection with SPARK_Mode is
   type Storage is tagged private;

   function Valid (Self : Storage) return Boolean with
      Global => null;
   
   function Get (Self : Storage; CI : Component_Index) return Component'Class
   with
      Pre'Class => Self.Valid,
      Post'Class => Self.Valid,
      Global => null;

   function Free_Slot (Self : Storage; CI : Component_Index) return Boolean is
     (Self.Get (CI) not in No_Component'Class)
   with
      Pre'Class => Self.Valid,
      Post'Class => Self.Valid,
      Global => null;

   function Free_Slots (Self : Storage) return Natural with
      Pre'Class => Self.Valid,
      Post'Class => Self.Valid,
      Global => null;
   
   procedure Init (Self : out Storage) with
      Post'Class => Self.Valid and then Self.Free_Slots > 0,
      Global => null;

   procedure Set
     (Self : in out Storage;
      CI : Component_Index;
      New_Component : Component'Class)
   with 
      Pre'Class => Self.Valid,
      Post'Class => Self.Valid and then Self.Get (CI) = New_Component;

private
   pragma SPARK_Mode (Off);

   type Component_Ptr is access all Component'Class;
   type Component_Array is array (Component_Index) of Component_Ptr;
   type Storage is tagged record
      Contents : Component_Array;
   end record;

   function Get (Self : Storage; CI : Component_Index) return Component'Class is
     (Self.Contents (CI).all);
   
   function Valid (Self : Storage) return Boolean is
     (for all CI in Component_Index => Self.Contents (CI) /= null);

end Game.Components.Collection;
