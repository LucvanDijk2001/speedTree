boolean keyDown = false;
//int seed = int(random(10000000)); //use this for random seeds
int seed = 77371; //use this for set seeds

class Program
{
  //actual tree object
  Tree t;
  
  //tree properties
  int   iterations     = (int)random(12,15);          //amount of iterations for branch creation
  float startColor     = random(255);                 //starting color for the tree
  float xRoot          = width/2;                     //x starting point of the tree
  float yRoot          = height;                      //y starting point of the tree
  float initialDir     = 180;                         //the direction of the first branch (180 == UP)
  float dirChangeMin   = 20,     dirChangeMax   = 50; //inital angle between branches. gets a random value between the min and max
  float lenMin         = 100,    lenMax         = 240;//initial starting length of the branch. gets random value between the min and max
  float lenMultMin     = 0.6,    lenMultMax     = 0.8;//length multiplication for child branches. gets random value between the min and max
  float spawnChanceMin = 70,     spawnChanceMax = 90; //the chance for a new branch to spawn. gets random value between the min and max
  
  
  
  Program()
  {
    //initialize the seed
    randomSeed(seed);
    //create the tree
    CreateTree();
  }

  void Update()
  {
    //move tree (update)
    t.Move();

    //key press events
    if (keyPressed)
    {
      if (!keyDown)
      {
        keyDown = true;
        if (key == ' ')
        {
          //create a new tree
          seed = int(random(10000000));
          randomSeed(seed);
          CreateTree();
        }
      }
    } else
    {
      keyDown = false;
    }
  }

  void Show()
  {
    //show tree
    t.Show();
    
    //draw seed
    stroke(255);
    fill(255);
    textSize(20);
    text(seed, 10, 20);
  }
  
  void CreateTree()
  {
    t = new Tree(
    xRoot,
    yRoot, 
    initialDir, 
    random(dirChangeMin, dirChangeMax), 
    random(lenMin, lenMax), 
    random(lenMultMin, lenMultMax), 
    random(spawnChanceMin, spawnChanceMax), 
    iterations, 
    random(startColor)
    );
  }
}
