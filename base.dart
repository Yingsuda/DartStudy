//import core lib
import 'dart:math';

//import package
//import 'package:';

//import file
//import 'path/to/example.dart';

// start  注释

void main() {
  print("dart base 语法 \n");
  hello();

  print(plus());

  range();

  print(wawa());

  nilFunc(hello);

  mathTest();

  var work1 = Work("muhao1", DateTime(1920, 1, 1));
  work1.describe();

  var work2 = Work.unlaunched("mhao2");
  work2.describe();

  var myplanet = PlanetSun.earth;
  print(myplanet.ttype);

  var ani1 = animal("ani1", DateTime(2000, 5, 27), 234);
  ani1.num = 23;
  ani1.describe();
}

//变量
var name = "hello world";
var age = 11;
var flo = 3.9;
var arr1 = ["name1", "name2", "name3"];

//=> 执行只包含一条语句的函数

//函数
void hello() {
  print("hello world");
}

//for循环
int plus() {
  var num = 0;

  for (int i = 0; i < 10; i++) {
    num = num + i;
  }

  return num;
}

//遍历循环
void range() {
  for (final nn in arr1) {
    print(nn);
  }
}

//while循环
int wawa() {
  while (age < 100) {
    age += 1;
  }
  return age;
}

//匿名函数
void nilFunc(final f1) {
  f1();
}

//import 导包  math函数
void mathTest() {
  print(max(12, 32));
}

//class
class Work {
  String name; //字符串
  DateTime?
      launchDate; //? int? 表示变量可以为int，也可以为null，如果启用null safety，则变量不能被复制为null，除非？

//read-only  不能直接赋值
  int? get launchYear => launchDate?.year; // 什么意思

  // 构造函数1
  Work(this.name, this.launchDate) {
    //todo
  }

  //构造函数2
  Work.unlaunched(String name) : this(name, null); //why

  //方法
  void describe() {
    print("work : $name");
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int year =
          DateTime.now().difference(launchDate).inDays ~/ 365; //~ 所有执行完之后的运算
      print('Launched: $launchYear ($year years ago)');
    } else {
      print("unlaunched!");
    }
  }
}

//todo new  const  factory(关键字)  getter setter

//枚举
enum Planet { apple, banana }

//增强型枚举
enum PlanetSun {
  //实例
  earth(ttype: Planet.apple),
  venus(ttype: Planet.banana);

  //构造函数
  const PlanetSun({required this.ttype});

  //配置参数
  final Planet ttype;

  //方法
}

//继承  extends

class Stu extends Work {
  int age;

  //继承的子类的构造函数必须在父类的构造函数上增加
  Stu(super.name, super.launchDate, this.age);
}

//接口的默认实现, mixin  使用mixin的方式继承这个类就可以将这个类中的功能添加给其他的类
mixin Eat {
  int num = 0;

  void describe() {
    if (this.num > 10) {
      print("big");
    }
  }
}

//接口  任意类都可以作为接口被实现

class animal extends Work with Eat {
  int code;
  animal(super.name, super.launchDate, this.code);

  void describe() {
    print("this code: $code");
  }
}

//