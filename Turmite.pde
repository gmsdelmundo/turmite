//-------------------------------------------------------------------//
//Editor: Gian Miguel Del Mundo                                      //
//Creation date: 2 June 2016                                         //
//Latest edit date: 4 June 2016                                      //
//Edit made: x and y are set in setup() instead of outside function  // 
//-------------------------------------------------------------------//

//Set variables
int x, y;                  //Initial turmite position
int grid_length = 10;      //Set grid length
color[] grid_color;        //Array storing all the corresponding colors for the movement pattern
int movement[] = {0, 1};   //Array storing the movement pattern where 0 = left, 1 = right
int num_of_moves = movement.length;  //Set number of moves in the movement pattern
int dir = 3;               //Check the direction of the turmite where 0 = North, 1 = East, 2 = South, 3 = West
int dps = 120;               //Number of times draw() is looped during one frame
int fps = 1;             //Frame rate
int step = 0;              //Number of steps taken by the turmite

void setup()         //Function that runs before drawing anything
{
  size(1920, 1080);  //Set the size of the canvas
  noStroke();        //No borders
  frameRate(fps);    //Set frame rate
  background(0);     //Set background to black

  grid_color = new color[num_of_moves];  //Instantiate the array
  
  x = width / 2;
  y = height / 2;
  
  for (int i = 0; i < num_of_moves; i++)
  {
    grid_color[i] = color(random(255), random(255), random(255));  //Set the colors of the movement pattern
    if (grid_color[i] == color(0, 0, 0))  
    {
      grid_color[i] = color(0, 0, 1);   //Set minimum color value
    }

    for (int j = 0; j < i; j++)  //Check for any duplicate colors to make sure all colors are unique
    {
      if (grid_color[j] == grid_color[i])
      {
        while (grid_color[j] == grid_color[i])
        {
          grid_color[j] = color(random(255), random(255), random(255));
        }
      }
    }
  }
}

void draw() //Begin drawing
{  
  surface.setTitle(step + " steps");
  
  for (int times = 0; times < dps; times++)
  {        
    color temp = get(x, y);  //Get the color of the current grid square

    for (int i = 0; i < num_of_moves; i++)
    {
      if (temp == grid_color[i])  //To find the index to use for movement[]
      {
        int j = i;
        j++;
        if (j >= num_of_moves)
        {
          j = 0;
        }

        fill(grid_color[j]); //Change the color of the current rectangle
        rectMode(CENTER);    //Coordinates of any rectangle is measured using its center
        rect(x, y, grid_length, grid_length); //Draw a rectangle
  
        if (movement[i] == 0)  //Turn left
        {
          switch(dir)
          {
          case 0:  //If pointing North, turn West and move forward
            x -= grid_length;
            dir = 3;
            break;
  
          case 1:  //If pointing East, turn North and move forward
            y -= grid_length;
            dir = 0;
            break;
  
          case 2:  //If pointing South, turn East and move forward
            x += grid_length;
            dir = 1;
            break;
  
          case 3:  //If pointing West, turn South and move forward
            y += grid_length;
            dir = 2;
            break;
          }
        } 
        else if (movement[i] == 1)  //Turn right
        {
          switch(dir)
          {
          case 0:  //If inting North, turn East and move forward
            x += grid_length;
            dir = 1;
            break;
  
          case 1:  //If pointing East, turn South and move forward
            y += grid_length;
            dir = 2;
            break;
  
          case 2:  //If pointing South, turn West and move forward
            x -= grid_length;
            dir = 3;
            break;
  
          case 3:  //If pointing West, turn North and move forward
            y -= grid_length;
            dir = 0;
            break;
          }
        }
      } 
      
      else if (temp == color(0, 0, 0))
      {
        fill(grid_color[0]); //Change the color of the current rectangle
        rectMode(CENTER);    //Coordinates of any rectangle is measured using its center
        rect(x, y, grid_length, grid_length); //Draw a rectangle
      }
    }
    
    step++;  //Increment step of the turmite by 1
  }
}