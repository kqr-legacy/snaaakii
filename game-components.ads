with Ada.Real_Time;

package Game.Components with SPARK_Mode is
   type Component is abstract tagged record
      null;
   end record;
   
   type No_Component is new Component with null record;
   
   type Position is new Component with record
      X : Longitude;
      Y : Latitude;
   end record;
   
   Max_Speed : constant Integer := Integer'Max
     (Integer (Longitude_Span),
      Integer (Latitude_Span));
   type Speed is new Integer range -Max_Speed .. +Max_Speed;
   type Velocity is new Component with record
      DX : Speed;
      DY : Speed;
   end record;
   
   type Action is abstract new Component with null record;
   type Turn is abstract new Action with null record;
   type North is new Turn with null record;
   type South is new Turn with null record;
   type West is new Turn with null record;
   type East is new Turn with null record;
      
   type Player is new Component with record
      Control_Enabled : Boolean;
   end record;
   
   type Fading is new Component with record 
      Duration : Ada.Real_Time.Time_Span;
   end record;
   
   type Channel is delta 0.1 range 0.0 .. 1.0;
   type Appearance is new Component with record
      Symbol : Character;
      Opacity : Channel;
   end record;
   
   type Hunger is new Component with null record;
   type Nutrients is new Component with null record;
   type Rigidity is new Component with null record;
end Game.Components;
