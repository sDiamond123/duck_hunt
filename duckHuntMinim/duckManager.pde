class duckManager 
{
  int pDucksHit;
  int shots;
  gun Gunner;
  int [] duckshit;
  int duck;
  int totDucks;
  int curDucks;
  boolean over;
  boolean duckStart;
  boolean ducksOver;
  boolean dogOver;
  boolean flyAway;
  boolean gameOVER;
  boolean perfect;
  int ducksHit;
  float dogX;
  float dogY;
  float maxH;
  float minH;
  float dogSPD;
  int frameCounter;
  int frameCounter2;
  int [] clear;
  int [] hold;
  boolean shot;
  boolean roundOver;
  int lastshot;
  ArrayList<duck> pluckADuck;
  ArrayList <score> hit;
  int bar;
  float clear2;
  int duckWait;
  float holdMe;
  int countMe;
  int [] ducksWait;
  int score;
  int timer;
  int totTime;
  int bonus;
  int perf;
  int scoreMod;
  duckManager (int a, int b)
  {
    perf=13;
    gameOVER=false;
    roundOver=false;
    lastshot=-10;
    duck=a;
    duckshit=new int[b];
    totDucks=b;
    curDucks=0;
    over =false;
    ducksOver=false;
    dogOver=true;
    duckStart=false;
    ducksHit=0;
    dogSPD=-2;
    dogY=height;
    minH=dogY+90;
    maxH=dogY-85;
    bonus=1000+200*level;
    frameCounter=0;
    shot=false;
    clear2=.6;
    frameCounter2=0;
    pluckADuck=new ArrayList<duck>();
    hit=new ArrayList<score>();
    Gunner=new gun (width/2, height/2, 20, 20);
    ducksWait=new int[a];
    clear=new int[a];
    duckWait=3;
    scoreMod=(level-1)*50;
    totTime=100;
    pDucksHit=ducksHit;
    bar=4*int(clear2*totDucks)+(duck*(level-1));
    if (bar/4>totDucks)
    {
      bar=totDucks*4;
    }
    for (int i=0; i<a; i++)
    {
      clear[i]=7;
    }
    for (int i=0; i<ducksWait.length; i++)
    {
      ducksWait[i]=-10;
    }
  }
  void loadDucks ()
  {
    shots=3;
    flyAway=false;
    pluckADuck=new ArrayList<duck>();
    dogX=width/2;
    ducksHit=0;
    for (int i=0; i<duck; i++)
    {
      pluckADuck.add(new duck ((int)random(75, width-75), height-175, ducks[(int)random(0,3)]));
    }
  }
  int trackDuck;
  int delay=0;
  void update ()
  {
    for (int i=0;i<hit.size();i++)
    {
      if (hit.get(i).expired())
      {
        hit.remove(i);
      }
    }
    score=0;
    shot=false;
    if (mousePressed)
    {
      if (shots>0)
      {
        if (frameCounter2>lastshot+1)
        {
          fired.play();
          fired.rewind();
          lastshot=frameCounter2;
          shots--;
          shot=true;
        }
      }
    }
    Gunner.update(mouseX, mouseY); 
    frameCounter++;
    if (frameCounter%10==0)
    {
      frameCounter2++;
    }
    trackDuck=0;
    if (!roundOver)
    {
      if (!ducksOver)
      {
        if (curDucks>=totDucks && dogOver && !duckStart)
        {
          pDucksHit=0;
          for (int i=0;i<duckshit.length;i++)
          {
            if (duckshit[i]==1)
            {
              pDucksHit++;
            }
          }
          hold=duckshit;
          if (pDucksHit<totDucks)
          {
            bonus=0;
            perf=0;
          }
          if ((pDucksHit)<(bar/4))
          {
            perf=-16;
            Fail.play();
            Fail.rewind();
          }
          else
          {
            cleared.play();
            cleared.rewind();
          }
          score+=bonus;
          roundStage=frameCounter2;
          roundOver=true;
          for (int i=0; i<duckshit.length; i++)
          {
            if (i<pDucksHit)
            {
              duckshit[i]=1;
            } else
            {
              duckshit[i]=0;
            }
          }
        } else if (dogOver && !duckStart)
        {
          curDucks+=duck;
          duckStart=true;
          loadDucks();
          timer=frameCounter2;
        } else
        {
          
          ducksHit=0;
          for (int i=0; i<pluckADuck.size(); i++)
          {
            if (ducksWait[i]+duckWait<=frameCounter2)
            {
              ducksWait[i]=frameCounter2;
              if (frameCounter2%2==1 && i%2==0 ||frameCounter2%2==0 && i%2==1)
              {
                duckshit[i+curDucks-duck]=7;
              } else
              {
                duckshit[i+curDucks-duck]=0;
              }
            }
            if (shot)
            {
              if (pluckADuck.get(i).state<3)
              {
                if (Gunner.x<=pluckADuck.get(i).x+pluckADuck.get(i).w/2 && Gunner.x>=pluckADuck.get(i).x-pluckADuck.get(i).w/2  && Gunner.y<=pluckADuck.get(i).y+pluckADuck.get(i).h/2 && Gunner.y>=pluckADuck.get(i).y-pluckADuck.get(i).h/2)
                {
                  shot=false;
                  score+=500+scoreMod;
                  hit.add (new score(500+scoreMod,pluckADuck.get(i).x+pluckADuck.get(i).w,pluckADuck.get(i).y,15,4));
                  pluckADuck.get(i).ToD=pluckADuck.get(i).frameCounter2;
                  pluckADuck.get(i).state=3;
                }
              }
            }
            pluckADuck.get(i).update();
            if (pluckADuck.get(i).state>=5 &&pluckADuck.get(i).state!=7 )
            {
              if (pluckADuck.get(i).state==5)
              {
                ducksHit++;
                duckshit[i+curDucks-duck]=1;
                dogX=pluckADuck.get(i).x;
              }
              trackDuck++;
            }
          }
          if (trackDuck==pluckADuck.size())
          {
            duckStart=false;
            dogOver=false;
            ducksOver=true;
          }
          if (shots<=0 || frameCounter2>=timer+totTime)
          {
            for (int i=0;i<pluckADuck.size();i++)
            {
             if (pluckADuck.get(i).state<3)
             {
              pluckADuck.get(i).state=7;
              flyAway=true;
              pluckADuck.get(i).dir=radians(-90);
             }
            }
          }
        }
      } else
      {
        for (int i=0; i<duckshit.length; i++)
        {
          if (duckshit[i]>1)
          {
            duckshit[i]=0;
          }
        }
        if (delay<frameCounter2+3)
        {
          delay=frameCounter2;
          dogY+=dogSPD;
          if (dogSPD<0)
          {
            if (dogY==minH-106)
            {
              if (ducksHit>0)
                {
                  gotDuck.play();
                  gotDuck.rewind();
                }
                else
                {
                  missedDuck.play();
                  missedDuck.rewind();
                }
            }
            if (dogY<=maxH)
            {
              holdMe=-dogSPD;
              dogSPD=0;
              countMe=0;
            }
          }
          else if (dogSPD==0)
          {
            if (countMe>=10)
            {
              dogSPD=holdMe;
            }
            countMe++;
          }
           else if (dogSPD>0)
          {
            if (dogY>=minH+100)
            {
              dogSPD=-dogSPD;
              ducksOver=false;
              dogOver=true;
              flyAway=false;
            }
          }
        }
      }
    } 
    else
    {
      roundOver();
    }
  }
  void render ()
  {
    if (flyAway && dogOver)
    {
      background(247,204,198);
    }
    displayBackground();
    if (!ducksOver)
    {
      for (int i=0; i<pluckADuck.size(); i++)
      {
        pluckADuck.get(i).render();
      }
    } else
    {
      float y2=dogY-150;
      image (dogs[constrain(ducksHit, 0, 2)], dogX, y2, 150, 150);
    }
    for (int i=0;i<hit.size();i++)
    {
      hit.get(i).render();
    }
    image (background, width/2, height/2);
    if (flyAway && dogOver)
    {
      image (UI[11],width/2,height/4);
    }
    if (roundOver)
    {
      if (frameCounter2>roundStage+25 && perf==13)
      {
        image (UI[13],width/2,height/4);
        digit=new int[0];
        makeDigits(bonus,6);
        digit=revInt(digit);
        for (int i=0;i<digit.length;i++)
        {
          image (nums[1][digit[i]],i*31+width/2-(31*6)/2,height/4+20,32,31);
        }
      }
      else if(((pDucksHit)>=(bar/4)))
      {
        image (UI[12],width/2,height/4);
      }
      else
      {
        image (UI[8],width/2,height/4);
      }
    }
    Gunner.render();
  }
  int roundStage=0;
  void roundOver ()
  {
    if (frameCounter2<=roundStage+25+perf)
    {
      if (frameCounter2==roundStage+26)
      {
        perfe.play();
        perfe.rewind();
      }
      if (frameCounter2%4<=2)
      {
        duckshit=hold;
      }
      else
      {
         duckshit=clear;
      }
    } else
    {
      if ((pDucksHit)<(bar/4))
      {
        gameOVER=true;
      }
      over=true;
    }
  }
}
