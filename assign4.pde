PImage bg1, bg2, enemy, fighter, treasure, hp, end1, end2, start1, start2;
int a, b, c, d,e,f, speed_fighter, speed_enemy, fighterX, fighterY,bg_1, bg_2,gameState,enemyState,enemyCount;
boolean upPressed,downPressed,leftPressed,rightPressed;
final int game_start=0;
final int game_run=1;
final int game_lose=2;
final int enemy_1=0;
final int enemy_2=1;
final int enemy_3=2;


void setup () {
  size(640, 480) ; 
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  enemy=loadImage("img/enemy.png");
  fighter=loadImage("img/fighter.png");
  hp=loadImage("img/hp.png");
  treasure=loadImage("img/treasure.png");
  start1=loadImage(("img/start1.png"));
  start2=loadImage(("img/start2.png"));
  end1=loadImage(("img/end1.png"));
  end2=loadImage(("img/end2.png"));
  a=floor(random(600));
  b=floor(random(40, 380));
  c=58;
  d=0;
  e=floor(random(33, 420));
  speed_enemy=4;
  speed_fighter=5;
  bg_1=-640;
  bg_2=0;
  gameState=game_start;
  fighterX=fighterY=0;
  upPressed=downPressed=leftPressed=rightPressed=false;
  enemyCount=5;
}

void draw() {
  switch(gameState) {
  case game_start:
    image(start2, 0, 0);
    if (mouseX>205&&mouseX<440&&mouseY>380&&mouseY<420) {
      if (mousePressed) {
        gameState=game_run;
      } else {
        image(start1, 0, 0);
      }
    }
    break;
    
    case game_run:
    
    
    //bg
    image(bg2, bg_2, 0);
    image(bg1, bg_1, 0);
    if (bg_2==640) {
      bg_2=-640;
    } else {
      bg_2++;
    }
    if (bg_1==640) {
      bg_1=-640;
    } else {
      bg_1++;
    }
  
    //fighter
    image(fighter, 590+fighterX, 300+fighterY);
    if (upPressed) {
      fighterY-=speed_fighter;
    }
    if (downPressed) {
      fighterY+=speed_fighter;
    }
    if (leftPressed) {
      fighterX-=speed_fighter;
    }
    if (rightPressed) {
      fighterX+=speed_fighter;
    }
    if(fighterX>0){
      fighterX=0;
    }
    if(fighterX<-590){
      fighterX=-590;
    } 
    if(fighterY>130){
      fighterY=130;
    }
    if(fighterY<-300){
      fighterY=-300;
    }
    
    
    //treasure
    image(treasure, a, b);
    
    
    //enemy
    d+=speed_enemy;
    switch(enemyState){
    case enemy_1:
      for(int i=0;i<400;i+=80){
        image(enemy, d-i, e);
        if(d>1040){
          enemyState=enemy_2;
          d=0;
          e=floor(random(33, 170));
        }
       }
       break;
     case enemy_2:
       for(int i=0;i<400;i+=80){
         for(int j=0;j<250;j+=50){
           image(enemy, d-j, e+j);
           if(d>1040){
              enemyState=enemy_3;
              d=0;
              e=floor(random(113, 340));
            }
          }
       }
       break;
       case enemy_3:
        for(float i=0;i<enemyCount;i++){
           if(i<(enemyCount-1)/2){
           image(enemy, d-i*50, e+i*50);
           image(enemy, d-i*50, e-i*50);
           }
           else if(i==(enemyCount+1)/2){
               image(enemy, d-i*40,e+i*50-(enemyCount-1)*25);
               image(enemy, d-i*40,e-i*50+(enemyCount-1)*25);
             
           }
           else{
             image(enemy, d-i*40, e+i*50-(enemyCount-1)*50);
             image(enemy, d-i*40, e-i*50+(enemyCount-1)*50);
           }
           if(d>1040){
              enemyState=enemy_1;
              d=0;
              e=floor(random(33, 420));
              break;
          }
       }
       
    }

    //hp
    fill(#ff0000);
    rectMode(CORNERS);
    rect(4, 4, c, 20);
    image(hp, 0, 0);   
       
    //damage
    if(590+fighterX+30>d && 590+fighterX+30<d+61 && 300+fighterY>e && 300+fighterY<e+61){
      c-=38;
      d=0;
      e=floor(random(33, 420));
      if(c<21){
      gameState=game_lose;     
      c=58;
      }
    }
    if(590+fighterX+30>d && 590+fighterX+30<d+61 && 300+fighterY+45>e && 300+fighterY+45<e+61){
      c-=38;
      d=0;
      e=floor(random(33, 420));
      if(c<21){
      gameState=game_lose;
      c=58;
      }
    }
    
    
    //heal
    if(590+fighterX>a && 590+fighterX<a+41 && 300+fighterY+20>b && 300+fighterY+30<b+41){
      c+=19;
      a=floor(random(600));
      b=floor(random(40, 380));
      if(c>209){
        c=209;
      }
    }
    if(590+fighterX+25>a && 590+fighterX+25<a+41 && 300+fighterY>b && 300+fighterY<b+41){
      c+=19;
      a=floor(random(600));
      b=floor(random(40, 380));
      if(c>209){
        c=209;
      }
    }
    if(590+fighterX+25>a && 590+fighterX+25<a+41 && 300+fighterY+50>b && 300+fighterY+50<b+41){
      c+=19;
      a=floor(random(600));
      b=floor(random(40, 380));
      if(c>209){
        c=209;
      }
    } 
    if(590+fighterX+50>a && 590+fighterX+50<a+41 && 300+fighterY+25>b && 300+fighterY+25<b+41){
      c+=19;
      a=floor(random(600));
      b=floor(random(40, 380));
      if(c>209){
        c=209;
      }
    }
    
    /*trace
      if(e<300+fighterY){
        e += (300+fighterY-e+50)/50;
      }
      else{
        e += (300+fighterY-e-50)/50;
      }*/
    break;
    
    case game_lose:
    image(end2, 0, 0);
    if (mouseX>205&&mouseX<440&&mouseY>310&&mouseY<350) {
      if (mousePressed) {
        gameState=game_run;
        fighterX=fighterY=0;
      } else {
        image(end1, 0, 0);
      }
    }
    break;
    
  }
}
void keyPressed() {
  if (key==CODED) {
    switch(keyCode) {
    case UP:
      upPressed=true;
      break;
    case DOWN:
      downPressed=true;
      break;
    case LEFT:
      leftPressed=true;
      break;
    case RIGHT:
      rightPressed=true;
      break;
    }
  }
}
void keyReleased() {
  if (key==CODED) {
    switch(keyCode) {
    case UP:
      upPressed=false;
      break;
    case DOWN:
      downPressed=false;
      break;
    case LEFT:
      leftPressed=false;
      break;
    case RIGHT:
      rightPressed=false;
      break;
    }
  }
}
