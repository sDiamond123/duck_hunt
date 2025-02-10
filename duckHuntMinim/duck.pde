int level=1;
class duck 
{
  float y1;
  PImage [] duck;
  float x;
  float y;
  float dir;
  int w;
  int h;
  int state;
  int ToD;
  int frameCounter;
  int frameCounter2;
  int dis;
  /*states:
  1: right
  2: left
  3: hit
  4: falling
  5: over
  */
  AudioPlayer q2;
  AudioPlayer h2;
  AudioPlayer fa2;
  AudioPlayer fl2;
  duck (int a, int b, PImage [] p)
  {
    q2=quack;
    h2=hit;
    fa2=fall;
    fl2=flap;
    dis=int (random (0,3));
    x=a;
    y=b;
    dir=(int)random (0,2);
    w=75;
    h=75;
    duck=p;
    ToD=0;
    frameCounter=0;
    frameCounter2=0;
    y1=y;
    if (dir==0)
    {
      state=1;
      dir=radians(-1*random (30,90));
    }
    else
    {
      state=2;
      dir=radians(-1*random (90,150));
    }
  }
  void update ()
  {
    frameCounter++;
    if (frameCounter%10==0)
    {
      frameCounter2++;
       if (state<3 && int(random(0,20))==1)
        {
            if (state==1)
          {
            state=2;
            //x-=w/2;
            dir=radians(-1*random (90,270));
          }
          else
          {
           state=1;
           //x+=w/2;
            dir=radians(-1*random (-90,90));
          }
        }
    }
    if (state==7)
    {
      x+=cos(dir)*level*3/4;
      y+=sin(dir)*level*3/4;
      if (y<-h)
      {
        state=6;
      }
    }
    if (state<3)
    {
      x+=cos(dir)*level*3/4;
      y+=sin(dir)*level*3/4;
      if (x>=width-w/2||x<=w/2 && y>h/2)
      {
        if (state==1)
        {
          state=2;
          dir=radians(-1*random (90,270));
        }
        else
        {
         state=1;
          dir=radians(-1*random (-90,90));
        }
      }
      if (y>y1 || frameCounter2>5 &&y>y1-20)
      {
        float rand=random(0,180);
        dir=radians(-1*(rand));
        if (rand<90)
        {
          state=1;
        }
        else
        {
          state=2;
        }
      }
      else if (y<=h/2)
      {
        float rand=random(180,360);
        dir=radians(-1*(rand));
        if (rand<270)
        {
          state=2;
        }
        else
        {
          state=1;
        }
      }
    }
    else if (state==3)
    {
      if (frameCounter2>=ToD+6)
      {
        state=4;
      }
    }
    else if (state==4)
    {
      fa2.play();
      if (y<=y1+h/2)
      {
      y+=5;
      }
      else
      {
        fa2.pause();
        fa2.rewind();
        h2.play();
        h2.rewind();
        state=5;
      }
    }
  }
  void render()
  {
    if (state<3)
    {
      fill (255/2);
      //rect (x,y,w,h);
      int negate=0;
      if (degrees(-dir)>=90 && degrees(-dir)<=270)
      {
          negate=3;
      }
      if ((frameCounter2+dis)%3==2)
      {
        q2.play();
        q2.rewind();
      }
      if ((frameCounter2+dis)%3==3)
      {
        fl2.play();
        fl2.rewind();
      }
      image (duck[(frameCounter2+dis)%3+negate],x,y,w,h);
    }
    else if (state==3)
    {
      image (duck[6],x,y,w,h);
    }
    else if (state==7)
    {
      if ((frameCounter2+dis)%3==2)
      {
        q2.play();
        q2.rewind();
      }
      if ((frameCounter2+dis)%3==3)
      {
        fl2.play();
        fl2.rewind();
      }
      int negate=9;
      image (duck[(frameCounter2+dis)%3+negate],x,y,duck[(frameCounter2+dis)%3+negate].width*3,duck[(frameCounter2+dis)%3+negate].height*3);
    }
    else
    {
      image (duck[frameCounter2%2+7],x,y,w,h);
    }
  }
  
}
