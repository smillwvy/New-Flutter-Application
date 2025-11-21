import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group('PricingRepository', () {
    test('calculates total for six-inch sandwiches', () {
      final repo = PricingRepository();

      final total = repo.calculateTotal(
        quantity: 3,
        isFootlong: false,
      );

      // 3 * £7 = £21
      expect(total, 21);
    });

    test('calculates total for footlong sandwiches', () {
      final repo = PricingRepository();

      final total = repo.calculateTotal(
        quantity: 2,
        isFootlong: true,
      );

      // 2 * £11 = £22
      expect(total, 22);
    });

    test('returns 0 when quantity is 0', () {
      final repo = PricingRepository();

      final total = repo.calculateTotal(
        quantity: 0,
        isFootlong: true,
      );

      expect(total, 0);
    });
  });
}
