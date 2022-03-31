//变量（https://dart.cn/samples#variables）
void variables() {
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
  print(
    'name is $name, year is $year, antennaDiameter is $antennaDiameter, flybyObjects is $flybyObjects, image is $image');
}

//函数(https://dart.cn/samples#functions)
int fibonacci(int n){
  if(n==0 || n==1){
    return n;
  }
  return fibonacci(n-1)+fibonacci(n-2);
}

//类(https://dart.cn/samples#classes)
class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  // Method.
  void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

//扩展类(https://dart.cn/samples#inheritance)
class Orbiter extends Spacecraft{
  double altitude;

  Orbiter(String name,DateTime launchDate,this.altitude)
    :super(name,launchDate);
}

//Mixins(https://dart.cn/samples#mixins)
mixin Piloted{
  int astronauts=1;

  void describeCrew(){
    print('Number of astronauts: $astronauts');
  }
}

//接口和抽象类(https://dart.cn/samples#interfaces-and-abstract-classes)
class MockSpaceship implements Spacecraft{
  
}

void main(List<String> args) {
  // 变量
  variables();

  //函数
  var result=fibonacci(20);
  print(result);

  //类
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();
  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();


}