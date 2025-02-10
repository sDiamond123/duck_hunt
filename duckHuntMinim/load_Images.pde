PImage [] [] ducks;
PImage [] dogs;
PImage [] walkingDog;
PImage [] UI;
PImage background;
PImage [] trees;
PImage [] opening;
PImage [][] nums;
void loadImages()
{
  ducks=new PImage [3][12];
  for (int i=0;i<ducks[0].length;i++)
  {
    ducks[0][i]=loadImage ("duck"+i+".png");
    int plusMe=20+i;
    ducks[1][i]=loadImage ("duck"+plusMe+".png");
    plusMe+=20;
    ducks[2][i]=loadImage ("duck"+plusMe+".png");
  }
  dogs=new PImage [3];
  for (int i=0;i<dogs.length;i++)
  {
    dogs[i]=loadImage ("doggo"+i+".png");
  }
  UI=new PImage [14];
  UI[0]=loadImage("duckHit.png");
  UI[1]=loadImage("duckMiss.png");
  UI[2]=loadImage("bullet.png");
  for (int i=0;i<11;i++)
  {
    UI[3+i]=loadImage("UI"+i+".png");
  }
  background=loadImage("background1.png");
  trees=new PImage [2];
  for (int i=0;i<trees.length;i++)
  {
    trees[i]=loadImage("tree"+i+".png");
  }
  walkingDog=new PImage [8];
  for (int i=0;i<walkingDog.length;i++)
  {
    walkingDog[i]=loadImage ("walk"+i+".png");
  }
  opening=new PImage[2];
  opening[0]=loadImage("open.png");
  opening[1]=loadImage("pointer.png");
  nums=new PImage [3][10];
  for (int i=0;i<nums[0].length;i++)
  {
    nums[0][i]=loadImage ("digit"+i+".png");
    nums[1][i]=loadImage("score"+i+".png");
    int e=10+i;
    nums[2][i]=loadImage ("score"+e+".png");
  }
}
void displayBackground()
{
  image (trees[0],145,height/2-71);
  image (trees[1],width-130,height/2+40);
}
int [] digit;
void makeDigits (int a,int b)
{
  if (digit.length<b)
  {
    digit=adder(digit,a%10);
    a=a/10;
    makeDigits(a,b);
  }
  else
  {
    return;
  }
}
int [] revInt (int [] a)
{
  int [] b=new int [a.length];
  for (int i=0;i<a.length;i++)
  {
    b[a.length-i-1]=a[i];
  }
  return b;
}
int [] adder (int [] mark, int b)
{
      int [] hold=new int [mark.length+1];
      for (int c=0; c<mark.length;c++)
      {
        hold[c]=mark[c];
      }
      hold[hold.length-1]=b;
      mark=hold;
      return mark;
}
