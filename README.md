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


├── Game
│   ├── Game.Logic (rules?)
│   ├── Game.Snake

Main
├── Game
├── game-food.adb
├── game-food.ads
├── game-logic.adb
├── game-logic.ads
├── game-random_coordinate.adb
├── game-random_coordinate.ads
├── game-round.adb
├── game-round.ads
├── game-snake.ads
├── game-ui.adb
├── game-ui.ads
├── game-ui-ncurses.adb
├── game-ui-ncurses.ads
├── game-ui-ncurses-curses_h.adb
├── game-ui-ncurses-curses_h.ads
├── game-ui-rendering.adb
├── game-ui-rendering.ads
├── main.adb
├── README
└── snake.gpr
