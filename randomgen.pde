import java.util.Random;

class RandomGen {
  Random random = new Random();
  
  int generate(int min, int max) {
    return random.nextInt(max-min)+min;
  }
  
  float generate(float min, float max) {
    return random.nextFloat()*(max-min+1) + min;
  }
  
  int generate(int max) {
    return random.nextInt(max);
  }
  
  float generate(float max) {
    float a = random.nextFloat();
    float b = a * max;
    //return random.nextFloat()*max;
    return b;
  }
}
