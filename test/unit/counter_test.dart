import 'package:flutter_test/flutter_test.dart';
import 'package:testtypes/unit/counter.dart';

void main() {
  group("Contador", () {
    test('Contador deve iniciar zerado', () {
      expect(Counter().value, 0);
    });

    test('Valor do contador deve ser incrementado', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test('Valor do contador deve ser decrementado', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
