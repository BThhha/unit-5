//void yuan(float x,float y){
//  pushStyle();

//  imageMode(CENTER);

//  if(photo != null){

//    PImage circlePhoto = photo.copy();

//    PGraphics mask = createGraphics(circlePhoto.width, circlePhoto.height);

//    mask.beginDraw();
//    mask.background(0);
//    mask.fill(255);
//    mask.noStroke();
//    mask.circle(circlePhoto.width/2,
//                circlePhoto.width/2,
//                circlePhoto.width);

//    mask.endDraw();

//    circlePhoto.mask(mask);

//    image(circlePhoto, x, y, cirWid, cirWid);
//  }

//  else{

//    fill(0);
//    circle(x, y, cirWid);
//  }

//  popStyle();
//}


//void yuan1(float x,float y){
//pushStyle();
//fill(x,y,y/2);
//circle(x,y,cirWid);

//popStyle();
//}
