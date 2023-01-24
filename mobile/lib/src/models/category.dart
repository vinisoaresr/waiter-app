class Category {
  late String _id;
  late String name;
  late String icon;

  get id => _id;

  Category({required String id, required this.name, required this.icon}) {
    _id = id;
  }
}
