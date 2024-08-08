// Basic class definition
// ignore_for_file: avoid_print

class Person {
  String name;
  int age;

  // Constructor: Called when creating a new instance of the class
  Person(this.name, this.age);

  // Method: Function that belongs to the class
  void introduce() {
    print('My name is $name and I am $age years old.');
  }
}

// Inheritance: Student class extends Person
class Student extends Person {
  String major;

  // Constructor with super: Calls the constructor of the parent class
  Student(super.name, super.age, this.major);

  // Override: Replaces the method from the parent class
  @override
  void introduce() {
    super.introduce(); // Calls the parent's introduce method
    print('I am studying $major.');
  }
}

class Rectangle {
  double width;
  double height;

  // Named constructor: Allows creating instances with specific names
  Rectangle.square(double side)
      : width = side,
        height = side;

  // Getter: Computed property
  double get area => width * height;
}

void main() {
  // Creating an instance of Person
  var person = Person('John', 30);
  person.introduce();

  // Creating an instance of Student (which is a Person)
  var student = Student('Alice', 20, 'Computer Science');
  student.introduce();

  // Using a named constructor and a getter
  var square = Rectangle.square(5);
  print('Area of square: ${square.area}');
}
