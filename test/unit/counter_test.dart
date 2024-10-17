import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_counter.dart';

void main() {
  group('MockCounter Tests', () {
    test('Set and get counter value', () async {
      final firestore = FakeFirebaseFirestore();
      final counter = MockCounter(firestore: firestore);

      await counter.setCounterValue(10);
      final value = await counter.getCounterValue();

      expect(value, 10);
    });

    test('Increase counter value', () async {
      final firestore = FakeFirebaseFirestore();
      final counter = MockCounter(firestore: firestore);

      await counter.setCounterValue(5);
      await counter.setCounterValue(6);
      final value = await counter.getCounterValue();

      expect(value, 6);
    });

    test('Decrease counter value', () async {
      final firestore = FakeFirebaseFirestore();
      final counter = MockCounter(firestore: firestore);

      await counter.setCounterValue(5);
      await counter.setCounterValue(4);
      final value = await counter.getCounterValue();

      expect(value, 4);
    });
  });
}
