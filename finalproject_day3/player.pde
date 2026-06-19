class Player {

  float ppX = 180;
  float ttX = 800;

  float ppS = 2.5;
  float ttS = 2.8;

  float basePoliceSpeed = 2.5;
  float baseThiefSpeed = 2.8;

  float distance = 600;

  Player() {}

  void update() {

    ppS *= 0.99;
    if (ppS < basePoliceSpeed) ppS = basePoliceSpeed;float gapChange = ppS - ttS;distance -= gapChange;

    if (distance < 200) ttS += 0.03;if (distance > 400) ttS -= 0.02;

    ttS = constrain(ttS, 1.5, 6);
  }

  
}
