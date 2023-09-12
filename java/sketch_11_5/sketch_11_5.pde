boolean gevonden;
String[] namen = {"Jan", "Piet", "Henk"};

void setup(){
  gevonden = false;
  for(int i = 0; i < namen.length; i++){
    // Bestaat de volgende waarde?
    if(namen[i] == "Jan"){
    gevonden = true;
    }
    
  }  
  
  println(gevonden);

}
