import ddf.minim.*;

Minim minim;
gameManager game;

void setup()
{
  size (800,530);
  loadImages();
  loadSounds();
  rectMode (CENTER);
  game=new gameManager();
  imageMode (CENTER);
}
void draw ()
{
  background(55,105,195);
  game.update();
  game.render();
}
int sigFigs(int a)
{
  for (int i=20;i>=0;i--)
  {
    if (int(a/pow(10,i))!=0)
    {
      return i+1;
    }
  }
  return 0;
}
