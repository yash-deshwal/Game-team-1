// menu class
class Menu {
  //creating buttoon objects
  Button play;
  Button controls;
  Button quit;
  Button back;
  // creating pvector for postion of buttons
  PVector playButton;
  PVector controlsButton;
  PVector quitButton;
  PVector backButton;

  int buttonWidth;
  int buttonHeight;
  //constructor
  public Menu() {
    //assigning values to buttons
    playButton = new PVector(width/2-60, height/2-100);
    controlsButton = new PVector(width/2-60, height/2);
    quitButton = new PVector(width/2-60, height/2+100);
    backButton = new PVector(50, 600);

    buttonWidth = 150;
    buttonHeight = 70;
  }
  //start menu display
  public void gameStartMenu() {

    textAlign(CENTER);
    int textsize = 50;
    textSize(textsize);
    fill(255);
    text("GALAXY SHOOTER", 400, 150);

    //creating new object of button
    play = new Button("Play", playButton, buttonWidth, buttonHeight);
    play.drawButton();

    controls = new Button("Controls", controlsButton, buttonWidth, buttonHeight);
    controls.drawButton();

    quit = new Button("Quit", quitButton, buttonWidth, buttonHeight);
    quit.drawButton();
  }
  // for game over
  void EndScreen() {
    textAlign(CENTER);
    // for checking winners
    checkWinner();

    play = new Button("Restart", playButton, buttonWidth, buttonHeight);
    play.drawButton();

    quit = new Button("Quit", quitButton, buttonWidth, buttonHeight);
    quit.drawButton();
  }
  // for checking the winner
  public void checkWinner() {
    if (player1.health == 0) {
      textSize(50);
      fill(255);
      text("Player 2 is winner", 400, 150);
    } else if (player2.health == 0) {
      textSize(50);
      fill(255);
      text("Player 1 is winner", 400, 150);
    }
  }
  //for restarting
  void restart() {
    clear();
    background(0); 
    stage=1;
    for (int i=0; i<enemies.size(); i++) {

      Enemy e = (Enemy) enemies.get(i); 
      loc = new PVector(random(600), random(-200, -100)); 
      e.restart();
    }
    player1.restart();
    player2.restart();
  }
  //for switiching between screens 
  public void switchingScreen() {
    //stage = 1 so that it starts from the menu.
    if (stage == 1) {
      clear();
      background(0);
      //for starting main menu
      gameStartMenu();
      //for displaying stars in the background.
      displayStars();
      //stage = 2 is the actual gameplay
      if (mousePressed) {
        //this is a sort of collision detection with button's width and height to mouse pointer.
        if (playButton.x + buttonWidth >= mouseX && mouseX >= playButton.x && playButton.y + buttonHeight >= mouseY && mouseY >= playButton.y) {
          stage = 2;
        } else if (controlsButton.x + buttonWidth >= mouseX && mouseX >= controlsButton.x && controlsButton.y + buttonHeight >= mouseY && mouseY >= controlsButton.y) {
          stage = 3;
        } else if (quitButton.x + buttonWidth >= mouseX && mouseX >= quitButton.x && quitButton.y + buttonHeight >= mouseY && mouseY >= quitButton.y) {
          stage = 4;
        }
      }
    }
    //stage = 2 is the actual gameplay
    if (stage ==2) {
      clear();
      background(0); 
      //println((int)keyCode);
      //println(keyCode);
      //calling the inputPlayer class for movement as well as for animation.
      player1.inputPlayer();
      player2.inputPlayer();

      //calling player bullet collision functions
      player1.hitCheck(isdead);
      player2.hitCheck(isdead);
      // player enmy collision function
      player1.EnemyHitCheck(isdead);
      player2.EnemyHitCheck(isdead);
      player1.Enemy2HitCheck(isdead);
      player2.Enemy2HitCheck(isdead);
      player1.Enemy3HitCheck(isdead);
      player2.Enemy3HitCheck(isdead);
      //player health booster collision
      player1.HealthHitCheck();
      player2.HealthHitCheck();
      //drawing player health bar
      player1.drawPlayerHealthBar("Payer1 Health Bar", locHealthBar1Label);
      player2.drawPlayerHealthBar("Payer2 Health Bar", locHealthBar2Label);
      //for displaying bullets
      displayBullets();
      //for displaying enemies
      displayEnemies();
      displayEnemies2();
      displayEnemies3();
      // for displaying health booster
      displayHealthBooster();
      //for displaying stars in the background.
      displayStars();
    }
    //switching to controls page
    if (stage == 3) {
      clear();
      background(0);
      fill(255);
      text("w shoot", 400, 150);

      playButton = new PVector(600, 600);

      play = new Button("Play", playButton, buttonWidth, buttonHeight);
      play.drawButton();

      //creating new object of button
      back = new Button("Back", backButton, buttonWidth, buttonHeight);
      back.drawButton();

      //for displaying stars in the background.
      displayStars();
      if (mousePressed) {
        if (backButton.x + buttonWidth >= mouseX && mouseX >= backButton.x && backButton.y + buttonHeight >= mouseY && mouseY >= backButton.y) {
          //gamePlay
          stage = 1;
          playButton = new PVector(width/2-60, height/2-100);
        } else if (playButton.x + buttonWidth >= mouseX && mouseX >= playButton.x && playButton.y + buttonHeight >= mouseY && mouseY >= playButton.y) {
          stage = 2;
        }
      }
    }
    // for exit
    if (stage == 4) {
      exit();
    }
    //end screen
    if (stage ==5) {
      clear();
      background(0);

      EndScreen();
      //for displaying stars in the background.
      displayStars();

      if (mousePressed) {
        if (quitButton.x + buttonWidth >= mouseX && mouseX >= quitButton.x && backButton.y + buttonHeight >= mouseY && mouseY >= quitButton.y) {
          //gamePlay
          stage = 4;
          playButton = new PVector(width/2-60, height/2-100);
        } else if (playButton.x + buttonWidth >= mouseX && mouseX >= playButton.x && playButton.y + buttonHeight >= mouseY && mouseY >= playButton.y) {
          restart();
        }
      }
    }
  }
}
