AudioPlayer fired;
AudioPlayer hit;
AudioPlayer fall;
AudioPlayer quack;
AudioPlayer flap;
AudioPlayer open;
AudioPlayer walk;
AudioPlayer bark;
AudioPlayer gotDuck;
AudioPlayer cleared;
AudioPlayer perfe;
AudioPlayer missedDuck;
AudioPlayer gameOV;
AudioPlayer Fail;
void loadSounds ()
{
   minim = new Minim(this);
   open=minim.loadFile ("opening.mp3");
   walk=minim.loadFile("dogWalk.mp3");
   fired=minim.loadFile("shot.mp3");
   hit=minim.loadFile("lands.mp3");
   fall=minim.loadFile("fall.mp3");
   flap=minim.loadFile("flap.mp3");
   quack=minim.loadFile("quack.mp3");
   bark=minim.loadFile("bark.mp3");
   missedDuck=minim.loadFile("damnDog.mp3");
   cleared=minim.loadFile("clear.mp3");
   perfe=minim.loadFile("perf.mp3");
   gotDuck=minim.loadFile("deadDucks.mp3");
   gameOV=minim.loadFile("game.mp3");
   Fail=minim.loadFile("fail.mp3");
}
