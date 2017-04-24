SNAAAKII
========

Snaaakii is a simple, somewhat formally verified "snake" game. It's built on
an Entity–Component–System architecture, and it's a great place to practise

* Ada 2012,
* SPARK 2014,
* Integrating C with Ada,
* Formal techniques,
* Testing
* AI,
* Multiprocessing,
* Graphics,
* And much much more!

The general hierarchy of the code is like this:

Main
└── Game                                  ; Room size, generally useful constants
    ├── Game.Components                   ; Definitions of lots of components
    │   └── Game.Components.Collection    ; "Heterogeneous" collections of components
    ├── Game.Entities                     ; Helpers for making entities out of component collections
    ├── Game.Systems                      ; Methods that update entities by their components
    ├── Game.Round                        ; Step function and game state
    └── Game.UI                           ; Collection of input and output modules
        └── Game.UI.NCurses               ; NCurses specific backend
            └── Game.UI.NCurses.Curses_H  ; Very thin binding to the C library
            
