class ZekrType {
  String id;
  String number;
  int numberInCircule;
  List<String> categories;

  String description;

  ZekrType({
    required this.categories,
    required this.id,
    required this.number,
    required this.description,
    required this.numberInCircule,
  });
}
