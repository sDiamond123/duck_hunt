class gun 
{
  int x;
  int y;
  int h;
  int w;
  
  gun (int a, int b,int c, int d)
  {
    x=a;
    y=b;
    h=c;
    w=d;
  }
  void update (int a, int b)
  {
    x=a;
    y=b;
  }
  void render ()
  {
    line (x-w/2,y,x+w/2,y);
    line (x,y-h/2,x,y+h/2);
  }
}
