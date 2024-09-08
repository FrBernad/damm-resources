// ignore_for_file: avoid_print

void main() {
  // Integer: Whole numbers without decimals
  int age = 25;
  print('Age: $age');

  // Double: Numbers with decimal points
  double height = 1.75;
  print('Height: $height meters');

  // String: A sequence of characters
  String name = 'John Doe';
  print('Name: $name');

  // Boolean: True or false values
  bool isStudent = true;
  print('Is a student: $isStudent');

  // List: An ordered collection of objects
  List<String> fruits = ['apple', 'banana', 'orange'];
  print('Fruits: $fruits');

  // Map: A collection of key-value pairs
  Map<String, String> capitals = {
    'USA': 'Washington D.C.',
    'UK': 'London',
    'France': 'Paris'
  };
  print('Capitals: $capitals');

  // var: Type is inferred by the compiler
  var dynamicVar = 42; // Inferred as int
  print('Dynamic variable: $dynamicVar');

  // final: Runtime constant, value must be set when declared and cannot be changed
  // ignore: prefer_const_declarations
  final String finalVar = 'This cannot be changed';
  print('Final variable: $finalVar');

  // const: Compile-time constant, must be set with a constant value
  const double pi = 3.14159;
  print('Constant pi: $pi');
}
