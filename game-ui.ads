package Game.UI with
   SPARK_Mode,
   Abstract_State => UI,
   Initializes => UI
is
   function Is_Ready return Boolean with
      Global => UI,
      Depends => (Is_Ready'Result => UI);

   procedure Init with
      Post => Is_Ready,
      Global => (In_Out => UI),
      Depends => (UI =>+ null);

   procedure Teardown with
      Pre => Is_Ready,
      Post => not Is_Ready,
      Global => (In_Out => UI),
      Depends => (UI =>+ null);
end Game.UI;
