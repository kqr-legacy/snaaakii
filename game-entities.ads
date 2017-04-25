private with Game.Components.Collection;

package Game.Entities with SPARK_Mode is
   type Entity is
      private;
   type Entity_Array is
      array (Entity_Index range <>) of Entity;
   
   function Snake return Entity;
private
   type Entity is
      tagged record
         Components : Game.Components.Collection.Storage;
      end record;
end Game.Entities;
