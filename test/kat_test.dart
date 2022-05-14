import 'dart:io';

import 'package:kat/kat.dart';
import 'package:test/test.dart';
import 'package:fake_async/fake_async.dart';

// TODO: Add tests for cat() with a non-existent file.
// Sample unit test
int add(int a, int b) {
  return a + b;
}

void main() {
  test('add', () {
    expect(add(5, 6), 11);
  });
}
