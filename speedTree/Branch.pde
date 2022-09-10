class Branch
{
  int id;
  Branch[] children = new Branch[2];
  PVector startPos = new PVector(0, 0);
  PVector endPos = new PVector(0, 0);
  float dir, len, oldDir, orDir; // branch direciton, length, last frame direction, original direction
  float c; //branch color
  int depth; //branch depth 
  float sinAmt = random(5, 20);//amount of sway in branches
  float ranSin = random(0.5);//sin offset to make it look more organic

  Branch(PVector sp, float d, float l, int xx, float col) 
  {
    c = col;
    c+= random(30);
    if (c > 255) {
      c-=255;
    }
    id = xx;
    startPos = sp;
    dir = d;
    oldDir = d;
    orDir = d;
    len = l;
    endPos.x = startPos.x + sin(radians(dir))*len;
    endPos.y = startPos.y + cos(radians(dir))*len;
  }
  
  void Move() 
  {
    //increase color
    c += 2;
    if (c > 255) {
      c-=255;
    }

    //swaying calculation
    if (depth > 0)
    {
      dir = orDir + (sin(time+ranSin) * sinAmt)*((height/max(startPos.y, 60)*0.2));
    }

    //rotate self and children with parent branch if direction changed
    if (dir != oldDir)
    {
      //set new endPosition
      endPos.x = startPos.x + sin(radians(dir))*len;
      endPos.y = startPos.y + cos(radians(dir))*len;
      
      //rotate children
      for (int i = 0; i < children.length; i++)
      {
        if (children[i] != null)
        {
          children[i].Rotate(dir-oldDir);
          children[i].startPos = endPos;
        }
      }
    }
    
    //save old direction
    oldDir = dir;
  } 
  void Show() 
  {
    //draw branch
    noFill();
    strokeWeight(len/30);
    stroke(c, 255, 255);
    line(startPos.x, startPos.y, endPos.x, endPos.y);
    if (children[0] == null && children[1] == null)
    {
      circle(endPos.x, endPos.y, len);
    }
  }

  void Rotate(float amount)
  {
    dir += amount;
  }
}
