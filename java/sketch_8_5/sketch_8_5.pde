size(200,200);
background(255,255,255);

int sizeC = 100;

for(int i = 0; i < 10; i++){
  ellipse(100, 100, sizeC,sizeC);
  sizeC = sizeC - 10;
}
