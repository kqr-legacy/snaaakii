package Game.Components.Collection with SPARK_Mode is
   type Storage is tagged private;

   function Get
     (Self : Storage;
      CI : Component_Index)
      return Component'Class
   with
--      Post'Class => Get'Result in Component'Class;
      Global => null;

   procedure Set
     (Self : in out Storage;
      CI : Component_Index;
      New_Component : Component'Class)
   with 
      Post'Class => Self.Get (CI) = New_Component;

private
   pragma SPARK_Mode (Off);

   type Component_Ptr is
      access all Component'Class;
   type Component_Array is
      array (Component_Index) of Component_Ptr;
   type Storage is
      tagged record
         Contents : Component_Array;
      end record;

   function Get
     (Self : Storage;
      CI : Component_Index)
      return Component'Class
   is
     (Self.Contents (CI).all);
   
end Game.Components.Collection;
