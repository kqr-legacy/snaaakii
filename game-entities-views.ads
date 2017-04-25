with Game.Components;

generic
   type Component_Type (<>) is
      new Game.Components.Component with private;
   
   --  We only need this because SPARK is being really stupid about returns
   Default_Component : Component_Type;

package Game.Entities.Views with SPARK_Mode is

   function Count
     (Self : Entity)
      return Natural;
   
   function Empty_Slots
     (Self : Entity)
      return Natural;
   
   function Exists
     (Self : Entity)
      return Boolean
   is
     (Count (Self) = 1);

   procedure Set
     (Self : in out Entity;
      Component : Component_Type)
   with
      Pre => (if Count (Self) = 0 then Empty_Slots (Self) > 0),
      Post => Get (Self) = Component;
   
   procedure Delete
     (Self : in out Entity)
   with
      Pre => Count (Self) > 0,
      Post => Count (Self) = 0;
   
   procedure Modify
     (Self : in out Entity;
      Component : Component_Type)
   with
      Pre => Count (Self) = 1,
      Post => Get (Self) = Component;
   
   function Get
     (Self : Entity)
      return Component_Type
   with
      Pre => Count (Self) = 1;

end Game.Entities.Views;
