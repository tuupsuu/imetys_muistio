enum MilkType { breast, pumped, substitute }

extension MilkTypeX on MilkType {
  int get value => index;

  static MilkType fromInt(int i) => MilkType.values[i];
}

class Milk {
  final int? id;
  final MilkType milkType;
  final int amount;
  final String? comment;

  const Milk(this.milkType, this.amount, {this.id, this.comment});

  Map<String, dynamic> toMap() => {
    'id': id,
    'milkType': milkType,
    'amount': amount,
    'comment': comment,
  };

  static Milk fromMap(Map<String, dynamic> map) => Milk(
    id: map['id'],
    map['milkType'],
    map['amount'],
    comment: map['comment'],
  );
}
