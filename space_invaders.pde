PImage bg,life,enemyship,myship;
import processing.sound.*;
SoundFile gameover,lose,laser,explosion;
int rezultat = 0;
int k = 1;
int p = 2;
int m = 998;
int n = 999;
int flag1 = 0;
int speed = 1;
int shotx = 450;
int shoty = 462;
int rectx = 450;
int flag = 0;
int pos = 0;
int o = 3;
int[] levels = new int[4];
int[] enemyx = new int[1000];
int[] enemyy = new int[1000];
boolean [] keys = new boolean[128];
void setup(){
    size(1000,562);
    bg = loadImage("2.jpg");
    life = loadImage("png_heart_31847.png");
    enemyship = loadImage("enemyship.png");
    myship = loadImage("myship.png");
    myship.resize(80,100);
    enemyship.resize(70,70);
    life.resize(30,30);
    
    gameover = new SoundFile(this,"gameover.wav");
    lose = new SoundFile(this,"lose.wav");
    explosion = new SoundFile(this,"explosion.wav");
    //laser = new SoundFile(this,"laser-kick-90048.wav");
    
    levels[0] = 10;
    levels[1] = 30;
    levels[2] = 70;
    levels[3] = 110;
    
    for(int i = 0; i < 1000; i++)
    {
      enemyx[i] = int(random(20,930));
      enemyy[i] = -500;//int(random(-100,-90));
    }
    
}

void draw()
{
  background(bg);
  image(myship,rectx,462);
  move();
  createEnemy();
  moveEnemies();
  text1();
  shoot();
  lifes();
  
  
  
}

void text1()
{
   fill(255,0,0);
   text(rezultat, 930, 550); 
   textSize(56);
   
}

void lifes()
{
 
  image(life,levels[1],520);
  image(life,levels[2],520);
  image(life,levels[3],520);
  
  if(enemyy[k] < 700 && enemyy[k] >= 564)
  {
    levels[o] = -100;
    o--;
    lose.play();
  }
  if(enemyy[p] < 700 && enemyy[p] >= 564)
  {
    levels[o] = -100;
    o--;
    lose.play();
  }
  if(enemyy[m] < 700 && enemyy[m] >= 564)
  {
    levels[o] = -100;
    o--;
    lose.play();
  }
  if(enemyy[n] < 700 && enemyy[n] >= 564)
  {
    levels[o] = -100;
    o--;
    lose.play();
  }
  if(o == 0)
   {
    fill(255);
    textSize(70);
    text("GAME OVER",320,281);
    textSize(20);
    text("Your score is ",420,310);
    text(rezultat,540,310);
    gameover.play();

    
    
    delay(100);
    noLoop();
      
   }
  
}
void shoot()
{
  if(keys[104])
  {
    flag = 1;
    pos = rectx;
  }
  if (flag == 1)
  {
    
    shotx = pos+30;
    fill(120,208,247);
    rect(shotx,shoty,5,20);
    shoty-=25;
    if((shoty >= enemyy[k] && shoty <= enemyy[k]+70) && (shotx+5 >= enemyx[k] && shotx+5 <= enemyx[k]+70))
    {
      enemyy[k] += 800;
      shoty = -30;
      rezultat++;
      explosion.play();
    }
    if((shoty >= enemyy[p] && shoty <= enemyy[p]+70) && (shotx+5 >= enemyx[p] && shotx+5 <= enemyx[p]+70))
    {
      enemyy[p] = 800;
      shoty = -30;
      rezultat++;
      explosion.play();
    }
    if((shoty >= enemyy[m] && shoty <= enemyy[m]+70) && (shotx+5 >= enemyx[m] && shotx+5 <= enemyx[m]+70))
    {
      enemyy[m] = 800;
      shoty = -30;
      rezultat++;
      explosion.play();
      
    }
    if((shoty >= enemyy[n] && shoty <= enemyy[n]+70) && (shotx+5 >= enemyx[n] && shotx+5 <= enemyx[n]+70))
    {
      enemyy[n] = 800;
      shoty = -30;
      rezultat++;
      explosion.play();
    }
    
    
    if(shoty < -20)
    {
      flag = 0;
      shoty = 462;
     }
   
  }
 
}


void createEnemy()
{
  for (int i = 0;i < 1000;i++){
    image(enemyship,enemyx[i],enemyy[i]);
  }
}

void moveEnemies()
{
      if(enemyy[k] < 0 && (((enemyx[k] >= enemyx[n] && enemyx[k] <= enemyx[n]+40) && (enemyy[k] >= enemyy[n] && enemyy[k] <= enemyy[n]+40)) || ((enemyx[k] >= enemyx[p] && enemyx[k] <= enemyx[p]+40) && (enemyy[k] >= enemyy[p] && enemyy[k] <= enemyy[p]+40)) || ((enemyx[k] >= enemyx[m] && enemyx[k] <= enemyx[m]+40) && (enemyy[k] >= enemyy[m] && enemyy[k] <= enemyy[m]+40))))
      {
        enemyy[k] = 800;
      }
      if(enemyy[p] < 0 && (((enemyx[p] >= enemyx[n] && enemyx[p] <= enemyx[n]+40) && (enemyy[p] >= enemyy[n] && enemyy[p] <= enemyy[n]+40)) || ((enemyx[p] >= enemyx[k] && enemyx[p] <= enemyx[k]+40) && (enemyy[p] >= enemyy[k] && enemyy[p] <= enemyy[k]+40)) || ((enemyx[p] >= enemyx[m] && enemyx[p] <= enemyx[m]+40) && (enemyy[p] >= enemyy[m] && enemyy[p] <= enemyy[m]+40))))     {
        enemyy[p] = 800;
      }
      if(enemyy[m] < 0 && (((enemyx[m] >= enemyx[n] && enemyx[m] <= enemyx[n]+40) && (enemyy[m] >= enemyy[n] && enemyy[m] <= enemyy[n]+40)) || ((enemyx[m] >= enemyx[p] && enemyx[m] <= enemyx[p]+40) && (enemyy[m] >= enemyy[p] && enemyy[m] <= enemyy[p]+40)) || ((enemyx[m] >= enemyx[k] && enemyx[m] <= enemyx[k]+40) && (enemyy[m] >= enemyy[k] && enemyy[m] <= enemyy[k]+40))))    {
        enemyy[m] = 800;
      }
      if(enemyy[n] < 0 && (((enemyx[n] >= enemyx[k] && enemyx[n] <= enemyx[k]+40) && (enemyy[n] >= enemyy[k] && enemyy[n] <= enemyy[k]+40)) || ((enemyx[n] >= enemyx[p] && enemyx[n] <= enemyx[p]+40) && (enemyy[n] >= enemyy[p] && enemyy[n] <= enemyy[p]+40)) || ((enemyx[n] >= enemyx[m] && enemyx[n] <= enemyx[m]+40) && (enemyy[k] >= enemyy[m] && enemyy[n] <= enemyy[m]+40))))      {
        enemyy[n] = 800;
      }
      
      if(enemyy[k] < -60)
      {
        enemyy[k]+=25;
      }
      else {
        enemyy[k]+=1.5;
      }
      if(enemyy[m] < -60)
      {
        enemyy[m]+=10;
      }
      else {
        enemyy[m]+=3;
      }
      if(enemyy[n] < -60)
      {
        enemyy[n]+=50;
      }
      else {
        enemyy[n]+=2.5;
      }
      enemyy[p]+=2;
      
      
     if(enemyy[k] > 564)
     {
       k+=2;
     }
     if(enemyy[p] > 564)
     {
       p+=2;
     }
     if(enemyy[m] > 564)
     {
       m-=2;
     }
     if(enemyy[n] > 564)
     {
       n-=2;
     }
     
   
   
}

void keyPressed()
{
  keys[key] = true;
}

void keyReleased()
{
  keys[key] = false;
  if(keys[116])
    {
    redraw();
    }
 
}

void move()
{
  if(keys['a'])
  {
    rectx -= 10;
  }
  if(keys['d'])
  {
    rectx += 10;
  }
  
  if(rectx > 900)
{
  rectx = 900;
}

 if(rectx < 20)
{
  rectx = 20;
}

}
