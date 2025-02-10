boolean mute;
class gameManager
{
  duckManager quack;
  dogWalk dog;
  open Open;
  int num;
  int wait;
  boolean gameOver;
  int frameCounter;
  int score;
  int frameCounter2;
  boolean pause;
  int lastHit;
  gameManager ()
  {
    mute=false;
    pause=false;
    open.play();
    open.rewind();
    level=1;
    int a=parseInt(loadStrings("highScore.txt")[0]);
    Open=new open(a);
    gameOver=false;
    wait=-5;
    stroke (255,0,0);
    strokeWeight (3);
    strokeCap (SQUARE);
    lastHit=-100;
  }
  void update ()
  {
    frameCounter++;
    if (frameCounter%10==0)
    {
      frameCounter2++;
    }
    frameCounter=frameCounter%1000;
    frameCounter2=frameCounter2%1000;
    if (!gameOver)
    {
      if (!Open.over)
      {
        Open.render();
        if (frameCounter2>=wait+2 && !pause)
        {
        Open.update(mouseY,mousePressed);
        }
        if (Open.over)
        {
          open.pause();
          num=Open.selection;
          dog=new dogWalk (false);
          quack=new duckManager (num,12);
          walk.play();
          walk.rewind();
        }
      }
      else if (!dog.over)
      {
        if (!pause)
        {
        dog.update();
        }
        dog.render();
      }
      else if (!quack.over)
      {
        if (!pause)
        {
        quack.update();
        }
        quack.render();
        score+=quack.score;
        if (quack.gameOVER)
        {
          gameOV.play();
          gameOV.rewind();
          gameOver=true;
        }
      }
      else
      {
        level++;
        displayBackground();
        image (background,width/2,height/2);
        quack=new duckManager (num,12);
        dog=new dogWalk (true);
      }
    }
    else
    {
      displayBackground();
      image (background,width/2,height/2);
      image (UI[8],width/2,height/4);
      if (mousePressed && !pause)
      {
        gameOV.pause();
        gameOV.rewind();
        String [] oldScore=loadStrings("highScore.txt");
        int oS=parseInt(oldScore[0]);
        if (score>oS)
        {
          oS=score;
        }
        String a ="";
        a+=oS;
        oldScore[0]=a;
        saveStrings(dataPath("highScore.txt"),oldScore);
        level=1;
        gameOver=false;   
        wait=frameCounter2;
        Open=new open(oS);
        score=0;
        open.play();
        open.rewind();
      }
    }
    if (keyPressed && frameCounter2>=lastHit+2)
    {
      lastHit=frameCounter2;
      if (key=='m'||key=='M')
      {
       if (mute)
       {
         mute=false;
       }
       else
       {
         mute=true;
       }
      }
      if (key==' ')
      {
        if (pause)
        {
          pause=false;
        }
        else
        {
          pause=true;
        }
      }
    }
  }
  void render ()
  {
    if (Open.over)
    {
      image (UI[4],width-100,height-30);
      image (UI[5],width/2,height-30);
      image (UI[6],100,height-80);
      image (UI[3],100,height-30);
      digit=new int[0];
      makeDigits(level,sigFigs(level));
      digit=revInt(digit);
      for (int i=0;i<digit.length;i++)
      {
        image (nums[0][digit[i]],i*15+107,height-80,16,14);
      }
      digit=new int[0];
      makeDigits(score,6);
      digit=revInt(digit);
      for (int i=0;i<digit.length;i++)
      {
        image (nums[1][digit[i]],i*20+width-150,height-40,20,20);
      }
      for (int i=0;i<quack.duckshit.length;i++)
      {
          image (UI[quack.duckshit[i]],i*16+width/2-60,height-39,16,16);
      }
      for (int i=0;i<quack.bar;i++)
      {
        image (UI[9],i*4+width/2-66,height-20, 4,10);
      }
      for (int i=0;i<quack.shots;i++)
      {
        image (UI[2],i*15+85,height-37,15,15);
      }

    }
  }
}
