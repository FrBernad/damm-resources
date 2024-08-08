// File: control_flow.dart

// ignore_for_file: avoid_print

void main() {
  // If-else statement: Conditional execution
  int number = 10;
  if (number > 0) {
    print('$number is positive');
  } else if (number < 0) {
    print('$number is negative');
  } else {
    print('$number is zero');
  }

  // For loop: Iterate a specific number of times
  print('\nCounting from 1 to 5:');
  for (int i = 1; i <= 5; i++) {
    print(i);
  }

  // While loop: Continue executing while a condition is true
  print('\nCounting down from 5 to 1:');
  int countdown = 5;
  while (countdown > 0) {
    print(countdown);
    countdown--;
  }

  // Switch statement: Choose between multiple cases
  String grade = 'B';
  print('\nGrade interpretation:');
  switch (grade) {
    case 'A':
      print('Excellent');
      break;
    case 'B':
      print('Good');
      break;
    case 'C':
      print('Fair');
      break;
    default:
      print('Needs improvement');
  }

  // For-in loop: Iterate over elements in a collection
  List<String> colors = ['red', 'green', 'blue'];
  print('\nColors:');
  for (String color in colors) {
    print(color);
  }
}
