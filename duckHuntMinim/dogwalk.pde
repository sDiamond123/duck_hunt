class dogWalk
{
  boolean over;
  int dogX;
  int dogY;
  int h;
  int w;
  int dogSPDx;
  int dogSPDy;
  int stage;
  int maxH;
  int minH;
  int frameCounter;
  int frameCounter2;
  int lastMove;
  int state;
  int barks;
  boolean walker;
  dogWalk ( boolean a)
  {
    h=100;
    w=200;
    if (!a)
    {
    dogX=-w/2;
    }
    else
    {
      dogX=w/2;
    }
    dogY=height-h;
    dogSPDx=20;
    dogSPDy=30;
    over=false;
    stage=1;
    maxH=height/2;
    minH=height+h;
    lastMove=-100;
    walker=true;
    state=0;
    barks=0;
  }
  void update ()
  {
    frameCounter++;
    if (frameCounter%4==0)
    {
      frameCounter2++;
    }
    if (stage==1)
    {
      if (frameCounter2>=lastMove+2)
      {
        lastMove=frameCounter2;
        if (state==0 && !walker)
        {
          walker=true;
        }
        else if (state==0 && walker)
        {
          walker=false;
        }
        if (state<4)
        {
        dogX+=dogSPDx;
        if (dogX>=width/2)
        {
          stage++;
        }
        }
        state++;
        if (walker)
        {
        state=state%10;
        }
        else
        {
          state=state%4;
        }
      }
    }
    else if (stage==2)
    {
      if (frameCounter2>=lastMove+5)
      {
        bark.play();
        bark.rewind();
        lastMove=frameCounter2;
        stage++;
      }
    }
    else if (stage==3)
    {
      if (frameCounter2>=lastMove+1)
      {
        lastMove=frameCounter2;
        dogY-=dogSPDy;
        if (dogY<=maxH)
        {
          stage++;
        }
      }
    }
    else if (stage==4)
    {
      if (frameCounter2>=lastMove+1)
      {
        lastMove=frameCounter2;
        dogY+=dogSPDy;
        if (dogY>=minH)
        {
          stage++;
        }
      }
    }
    else if (stage==5)
    {
      over=true;
    }
  }
  void render ()
  {
    int loadMe=0;
    if (stage==1)
    {
      loadMe=state;
      if (loadMe>=4)
      {
        loadMe=3+state%2;
      }
    }
    else if (stage==2)
    {
      loadMe=5;
    }
    else if (stage==3)
    {
      loadMe=7;
    }
    else
    {
      loadMe=6;
    }
    PImage dog;
    dog=walkingDog[loadMe];
    displayBackground();
    if (stage<4)
    {
    image (background,width/2,height/2);
    image (dog,dogX,dogY-50,w,h);
    }
    else
    {
      image (dog,dogX,dogY-50,w,h);
      image (background,width/2,height/2);
    }
    if (stage<2)
    {
      image (UI[10],width/2,height/4);
      digit=new int[0];
      makeDigits(level,sigFigs(level));
      digit=revInt(digit);
      for (int i=0;i<digit.length;i++)
      {
        image (nums[1][digit[i]],i*35+width/2-((sigFigs(level)-1)*35)/2,height/4+20,35,35);
      }
    }
  }
}
