import 'package:cloud_firestore/cloud_firestore.dart';

class MockCounter {
  final FirebaseFirestore firestore;

  MockCounter({required this.firestore});

  Future<void> setCounterValue(int value) async {
    await firestore.collection('counters').doc('counter').set({'value': value});
  }

  Future<int> getCounterValue() async {
    final doc = await firestore.collection('counters').doc('counter').get();
    return doc.data()?['value'] ?? 0;
  }
}
