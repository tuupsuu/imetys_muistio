enum MilkType { breast, pumped, substitute }

class Milk {
  final MilkType milkType;
  final int amount;
  final String? comment;

  const Milk(this.milkType, this.amount, {this.comment});
}
