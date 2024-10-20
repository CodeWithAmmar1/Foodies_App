class CartModel {
  final String title;
  final String image;
  final num price;
  final String resname;
  int count;

  CartModel(
      {required this.image,
      required this.price,
      required this.title,
      required this.resname,
      required this.count});
}

List<CartModel> cartData = [];
