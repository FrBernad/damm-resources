// Simple function with a parameter
// ignore_for_file: avoid_print

void greet(String name) {
  print('Hello, $name!');
}

// Function with return value
int add(int a, int b) {
  return a + b;
}

// Function with optional parameter (enclosed in square brackets)
String introduce(String name, [String? occupation]) {
  if (occupation != null) {
    return '$name is a $occupation.';
  } else {
    return 'Nice to meet you, $name!';
  }
}

// Function with named parameters (enclosed in curly braces)
// 'required' keyword makes a named parameter mandatory
void printPersonDetails({required String name, int age = 30, String? city}) {
  print('Name: $name');
  print('Age: $age');
  if (city != null) {
    print('City: $city');
  }
}

// Arrow function: Short syntax for functions that contain just one expression
int multiply(int a, int b) => a * b;

void main() {
  // Calling a simple function
  greet('Alice');

  // Calling a function with return value
  int sum = add(5, 3);
  print('Sum: $sum');

  // Calling a function with optional parameter
  print(introduce('Bob'));
  print(introduce('Charlie', 'developer'));

  // Calling a function with named parameters
  printPersonDetails(name: 'David', age: 28, city: 'New York');

  // Calling an arrow function
  int product = multiply(4, 6);
  print('Product: $product');
}
