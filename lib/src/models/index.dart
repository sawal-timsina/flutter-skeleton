abstract class Indexable {
  late final int key;

  Indexable(this.key);

  operator [](index) => toJson()[index];

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return other is Indexable && other.key == key;
  }

  @override
  int get hashCode => key.hashCode;
}
