class score
{
  int val;
  float x;
  float y;
  int sig;
  int w;
  int frameCounter;
  int frameCounter2;
  score (int a, float b, float c, int d, int e)
  {
    val=a;
    x=b;
    y=c;
    w=d;
    sig=e;
    frameCounter=0;
    frameCounter2=0;
    if (x>=width-(sig*w)/2)
    {
      x-=150;
    }
  }
  boolean expired ()
  {
    frameCounter++;
    if (frameCounter%5==0)
    {
      frameCounter2++;
    }
    if (frameCounter2>=20)
    {
      return true;
    }
    return false;
  }
  void render ()
  {
    digit=new int[0];
    makeDigits(val,sig);
    digit=revInt(digit);
    for (int i=0;i<digit.length;i++)
    {
      image (nums[2][digit[i]],i*w+x-(sig*w)/2,y,w,w);
    }
  }
}
