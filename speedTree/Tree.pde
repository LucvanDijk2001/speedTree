class Tree
{
  //list of branches
  ArrayList<Branch> branches = new ArrayList<Branch>();
  //int to keep track of id count
  int cid = 0;
  //color increase variable for nice rainbow effect
  float ci;
  
  //tree creation
  Tree(float x, float y, float dir, float dirChange, float len, float lenMult, float spawnChance, int iterations, float c)
  {
    //calculate color increase based on iterations
    ci = 255/iterations;
    
    //generate branches
    GenerateBranches(x, y, dir, dirChange, len, lenMult, spawnChance, iterations, null, true, c);
    
    //loop over branches and assign their depth
    for (int i = 0; i < branches.size(); i++)
    {
      if (branches.get(i).children[0] != null)
      {
        branches.get(i).children[0].depth = branches.get(i).depth + 1;
      }
      if (branches.get(i).children[1] != null)
      {
        branches.get(i).children[1].depth = branches.get(i).depth + 1;
      }
    }
  }

  void Move()
  {
    //update branches
    for (int i = 0; i < branches.size(); i++)
    {
      branches.get(i).Move();
    }
  }

  void Show()
  {
    //show branches
    for (int i = 0; i < branches.size(); i++)
    {
      branches.get(i).Show();
    }
  }

  void GenerateBranches(float x, float y, float d, float dc, float l, float lm, float sc, int i, Branch parent, boolean left, float c)
  {
    //increase id
    cid++;
    
    //initialize random value for branch angle added to original angle
    float r = random(-dc, dc);
    
    //set random angle to 0 if branch is root
    if (cid == 1) {
      r = 0;
    }
    
    //create a new branch
    Branch p = new Branch(new PVector(x, y), d+r, l+random(0, max(5, l/5)), cid, c);
    
    //add branch to arraylist
    branches.add(p);
    
    //assign self to parent as child
    if (parent != null)
    {
      if (left)
      {
        parent.children[0] = p;
      } else
      {
        parent.children[1] = p;
      }
    }
    
    //if iterations > 0 recurse
    if (i > 0)
    {
      i--;
      
      //calculate new branch starting position
      float newX = x + sin(radians(d+r))*l;
      float newY = y + cos(radians(d+r))*l;
      
      //generate 2 new branches
      if (random(100) < sc)
      {
        GenerateBranches(newX, newY, d+dc, dc, l*lm, lm, sc, i, p, true, c+ci);
      }
      if (random(100) < sc)
      {
        GenerateBranches(newX, newY, d-dc, dc, l*lm, lm, sc, i, p, false, c+ci);
      }
    }
  }
}
