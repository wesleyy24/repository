int[] getallen = {1,2,3,4,5,6,7,8,9,10,11,12};

void setup(){
  
  for(int i = 0; i < getallen.length; i++){
    var tempnum = 10+i*10;
    if (i == 11){
      getallen[i] = tempnum;
    }
    println(getallen[i]);
  }
}
