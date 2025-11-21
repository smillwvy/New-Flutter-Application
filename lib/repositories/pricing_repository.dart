class PricingRepository {
  final int sixInchPrice;
  final int footlongPrice;

  PricingRepository({
    this.sixInchPrice = 7,
    this.footlongPrice = 11,
  });

  int calculateTotal({
    required int quantity,
    required bool isFootlong,
  }) {
    if (quantity <= 0) return 0;

    final int unitPrice = isFootlong ? footlongPrice : sixInchPrice;
    return unitPrice * quantity;
  }
}
