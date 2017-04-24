with Ada.Numerics.Discrete_Random;

package body Game.Random_Coordinate with SPARK_Mode => Off is
   package Random_Longitude is new Ada.Numerics.Discrete_Random (Longitude);
   Longitude_Generator : Random_Longitude.Generator;
   
   package Random_Latitude is new Ada.Numerics.Discrete_Random (Latitude);
   Latitude_Generator : Random_Latitude.Generator;
   
   procedure Random (Coord : out Coordinate) is
   begin
      Coord.X := Random_Longitude.Random (Longitude_Generator);
      Coord.Y := Random_Latitude.Random (Latitude_Generator);
   end Random;
begin
   Random_Longitude.Reset (Longitude_Generator);
   Random_Latitude.Reset (Latitude_Generator);
end Game.Random_Coordinate;
