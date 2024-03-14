abstract class Indexable {
  late final String key;

  Indexable(this.key);

  dynamic operator [](String index) => toJson()[index];

  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return other is Indexable && other.key == key;
  }

  @override
  int get hashCode => key.hashCode;
}
