package Game.Components is

type Component is abstract tagged null record;

type Position is new Component with record
   X : Integer;
   Y : Integer;
end record;

end Game.Components;
