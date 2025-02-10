class open
{
  int selection;
  boolean over;
  int score;
  open (int c)
  {
    over=false;
    score=c;
    selection=1;
  }
  void update (int a, boolean b)
  {
    if (a<height/3)
    {
      selection=1;
    }
    else if (a<(height*2/3))
    {
      selection=2;
    }
    else
    {
      selection=3;
    }
    if (b)
    {
      over=true;
    }
  }
  void render()
  {
    image (opening[0],width/2,height/2,width,height);
    image (opening [1],width/4-20,(selection-1)*37+300,50,37);
    digit=new int[0];
    makeDigits(score,6);
    digit=revInt(digit);
    for (int i=0;i<digit.length;i++)
    {
      image (nums[1][digit[i]],i*20+width/2+75,height-100,20,20);
    }
    //strokeWeight(7);
    //line (width/8,height-65,width*7/8,height-65);
    //strokeWeight(3);
  }
}
