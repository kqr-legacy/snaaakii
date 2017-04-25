package NCurses with
   SPARK_Mode,
   Abstract_State => User_Terminal,
   Initializes => User_Terminal
is
   type Key_Press is (Left, Right, Up, Down, Q, None);

   function Is_Started return Boolean;
   
   procedure Init with
      Post => Is_Started,
      Global => (In_Out => User_Terminal);

   procedure Get_Last_Key (Key : out Key_Press) with
      Pre => Is_Started,
      Post => Is_Started,
      Global => (In_Out => User_Terminal);
   
   procedure Draw (Symbol : Character; X : Natural; Y : Natural) with
      Pre => Is_Started,
      Post => Is_Started,
      Global => (In_Out => User_Terminal);
   
   procedure Clear with
      Pre => Is_Started,
      Post => Is_Started,
      Global => (In_Out => User_Terminal);

   procedure Refresh with
      Pre => Is_Started,
      Post => Is_Started,
      Global => (In_Out => User_Terminal);
   
   procedure Reset with
      Pre => Is_Started,
      Post => not Is_Started,
      Global => (In_Out => User_Terminal);

private
   Initialised : Boolean := False with Part_Of => User_Terminal;

   Err : constant Integer := -1;
   Key_Down : constant Integer := 8#402#;
   Key_Up : constant Integer := 8#403#;
   Key_Right : constant Integer := 8#404#;
   Key_Left : constant Integer := 8#405#;
   Key_Q : constant Integer := Character'Pos ('q');

   function Valid_Key_Press (C_Key : Integer) return Boolean is
     (C_Key = Key_Up or C_Key = Key_Down or
      C_Key = Key_Left or C_Key = Key_Right or
      C_Key = Key_Q or C_Key = Err);

   function To_Key_Press (C_Key : Integer) return Key_Press is
     (case C_Key is
         when Key_Up => Up,
         when Key_Down => Down,
         when Key_Left => Left,
         when Key_Right => Right,
         when Key_Q => Q,
         when others => None)
   with
      Pre => Valid_Key_Press (C_Key);
end NCurses;
