// Cascade notation
// ignore_for_file: avoid_print

class Person {
  String name = '';
  int age = 0;
  void sayHello() => print('Hello, I am $name');
}

// Null-aware operators
class User {
  String? name;
  int? age;
  void sayHello() => print('Hello, $name!');
}

void main() {
  // String interpolation
  String name = 'Alice';
  print('Hello, $name!'); // Simple variable
  print('${name.toUpperCase()} in uppercase'); // Expression

  // Cascade notation (..)
  // ignore: unused_local_variable
  var person = Person()
    ..name = 'Bob'
    ..age = 30
    ..sayHello();

  //Instead of:
  // var person = Person();
  // person.name = 'Bob';
  // person.age = 30;
  // person.sayHello();

  // Spread operator (...)
  var list1 = [1, 2, 3];
  var list2 = [0, ...list1, 4]; // [0, 1, 2, 3, 4]
  print(list2);

  // Collection if and for
  var addExtra = true;
  var items = [
    'Apple',
    'Banana',
    if (addExtra) 'Orange',
    for (var i in ['Mango', 'Pineapple']) i.toUpperCase(),
  ];
  print(items);

  // Null-aware operators
  User? user;
  // Null-aware access
  // ignore: dead_code
  print(user?.name); // Prints null instead of throwing an error

  // Null-aware method invocation
  // ignore: dead_code
  user?.sayHello(); // Calls sayHello only if user is not null

  // Null-aware assignment
  user ??= User(); // Assigns a new User only if user is null

  // Conditional expression
  var isAdult = user.age ?? 0 >= 18;
  print('Is adult: $isAdult');

  // Fat arrow syntax for one-line functions
  multiply(int a, int b) => a * b;
  print('3 * 4 = ${multiply(3, 4)}');

  // Named parameters with default values
  void greet({String name = 'Guest', int age = 30}) {
    print('Hello, $name! You are $age years old.');
  }

  greet(name: 'Charlie');

  // Type inference with 'var'
  var inferredInt = 42;
  var inferredString = 'Hello';
  print('$inferredInt is ${inferredInt.runtimeType}');
  print('$inferredString is ${inferredString.runtimeType}');
}

// Extension methods
extension StringExtension on String {
  String capitalizeFirstLetter() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}

// Usage of extension method
void testExtension() {
  print('dart'.capitalizeFirstLetter()); // Prints: Dart
}
