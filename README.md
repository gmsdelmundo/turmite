# Turmite

## Introduction
This program is a variation of Langton's Ant, a type of 2-dimensional Turing machine, in which more states are present, allowing for more complex patterns. This was made with Java using Processing 3.

## Examples
### LR movement pattern (Langton's Ant)
[![https://gyazo.com/f0dfc3fd0a25334f76cccebd0f57c8d5](https://i.gyazo.com/f0dfc3fd0a25334f76cccebd0f57c8d5.gif)](https://gyazo.com/f0dfc3fd0a25334f76cccebd0f57c8d5)

### RLLR movement pattern
[![https://gyazo.com/f4558c9b7d2a83e6d6ef2f3ce4e4ec66](https://i.gyazo.com/f4558c9b7d2a83e6d6ef2f3ce4e4ec66.gif)](https://gyazo.com/f4558c9b7d2a83e6d6ef2f3ce4e4ec66)

### LLRR movement pattern
[![https://gyazo.com/8213dfca2cc61f683091248ba8a65f25](https://i.gyazo.com/8213dfca2cc61f683091248ba8a65f25.gif)](https://gyazo.com/8213dfca2cc61f683091248ba8a65f25)

### LRRRRRLLR movement pattern
[![https://gyazo.com/3944fd4c8b44dea3a430ea6cf12a4136](https://i.gyazo.com/3944fd4c8b44dea3a430ea6cf12a4136.gif)](https://gyazo.com/3944fd4c8b44dea3a430ea6cf12a4136)

### RRLLLRLLLRRR movement pattern
[![https://gyazo.com/cad0703c1476afd6d38c4af7b5555072](https://i.gyazo.com/cad0703c1476afd6d38c4af7b5555072.gif)](https://gyazo.com/cad0703c1476afd6d38c4af7b5555072)

## Code
### Global variables
`grid_length` is used to set the length of each grid square.  
`movement` is the array that stores the movement pattern which can be manually set by the user, while `grid_color` randomly sets the colors that correspond with each movement rule in the pattern.  
`dir` governs which direction the turmite originally faces.  
`dps` and `fps` both control the speed of the turmite. The difference, however, is `dps` sets how many times the turmite moves within one frame, while 'fps' dictates the amount of frames played in one second.

### void setup()
`setup()` is the function that automatically runs when the program is initialized.  
`size()` determines the canvas size.  
`noStroke()` disables borders for anything drawn.  
`frameRate()` sets the frame rate.  
`background(0)` sets the background color of the canvas to black. The color can be changed by using other RGB values (e.g. `background(255, 255, 255)`) will set the background color to be white).  
Both the `movement` and `grid_color` arrays are instantiated in this function.

### void draw()
`draw()` is a function that will, by default, automatically loop after the last line. This is also the function used to move the turmite depending on the movement pattern.

## Further Improvements and Modifications
One improvement would be to fix the problem with the counting of steps since it is double counted when moving to a black tile. Another improvement would be to add more keyboard functionality, such as pressing R to restart.