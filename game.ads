package Game with SPARK_Mode is
   --  Controls game area size
   type Longitude is new Integer range 1 .. 18;
   type Latitude is new Integer range 1 .. 14;
   Longitude_Span : constant Longitude := Longitude'Last - Longitude'First;
   Latitude_Span : constant Latitude := Latitude'Last - Latitude'First;


   --  Controls maximum number of components per entity
   type Component_Index is new Positive range 1 .. 20;

   --  Controls maximum number of entities in the game
   type Entity_Index is new Positive range 1 .. 15;
end Game;
