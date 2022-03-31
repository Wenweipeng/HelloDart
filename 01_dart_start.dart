//导入(https://dart.cn/samples#imports)
import 'dart:math';

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

//控制流语句(https://dart.cn/samples#control-flow-statements)
void test01(int year){
  if(year>=2001){
    print('21st century');
  }else if(year>=1901){
    print('20th century');
  }
}

void test02(){
  for(int month=1;month<=12;month++){
    print(month);
  }
}
/*
for (final object in flybyObjects) {
  print(object);
}
while (year < 2016) {
  year += 1;
}
*/

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
/*
class PilotedCraft extends Spacecraft with Piloted {
  // ···
}
*/

//接口和抽象类(https://dart.cn/samples#interfaces-and-abstract-classes)
abstract class Describable{
  void describe();

  void describeWithEmphasis(){
    print('===========');
    describe();
    print('===========');
  }
}

//异步(https://dart.cn/samples#async)
const oneSecond=Duration(seconds:1);
Future<void> printWithDelay(String message) async{
  await Future.delayed(oneSecond);
  print(message);
}

/*
Future<void> createDescriptions(Iterable<String> objects) async {
  for (final object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print(
            'File for $object already exists. It was modified on $modified.');
        continue;
      }
      await file.create();
      await file.writeAsString('Start describing $object in this file.');
    } on IOException catch (e) {
      print('Cannot create description for $object: $e');
    }
  }
}
*/

//异常(https://dart.cn/samples#exceptions)
/*
if(astronauts==0){
  throw StateError('No astronauts.');
}

try {
  for (final object in flybyObjects) {
    var description = await File('$object.txt').readAsString();
    print(description);
  }
} on IOException catch (e) {
  print('Could not describe object: $e');
} finally {
  flybyObjects.clear();
}
*/

void main(List<String> args) {
  // 变量
  variables();

  //控制流语句
  int year=2022;
  test01(year);
  test02();

  //函数
  var result=fibonacci(20);
  print(result);

  //类
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();
  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

  //扩展类
  var exten=Orbiter('xxxxx', DateTime(2077, 9, 5), 22);
  exten.describe();
}