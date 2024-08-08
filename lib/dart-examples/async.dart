// ignore_for_file: avoid_print

import 'dart:async';

// Simulates an asynchronous operation that returns a Future
Future<String> fetchUserData() {
  // Future.delayed creates a Future that completes after a time delay
  return Future.delayed(const Duration(seconds: 2), () => 'User data fetched');
}

// Async function using await to handle Futures
Future<void> performTask() async {
  print('Start of the task');
  // await suspends execution until the Future completes
  String result = await fetchUserData();
  print(result);
  print('End of the task');
}

// Async generator function that yields a stream of values
Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    yield i; // 'yield' adds a value to the stream
    await Future.delayed(const Duration(seconds: 1));
  }
}

void main() async {
  print('Starting main function');

  // Using await to handle a Future
  await performTask();

  // Using .then() to handle a Future
  fetchUserData().then((value) => print('Then: $value'));

  // Using a stream
  print('Starting stream');
  // await for loops through values in a stream as they become available
  await for (int number in countStream(5)) {
    print(number);
  }
  print('Stream finished');

  print('End of main function');
}
