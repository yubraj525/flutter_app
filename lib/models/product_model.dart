class Product {
  final String id;
  final String title;
  final String imageUrl;
  final double price;

  Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
  });

  static List<Product> products = [
    Product(id: "1", title: "Mac", imageUrl: "assets/momin.jpg", price: 70000),
    Product(
      id: "2",
      title: "iphone",
      imageUrl: "assets/momin.jpg",
      price: 20000,
    ),
    Product(id: "1", title: "Mac", imageUrl: "assets/momin.jpg", price: 70000),
    Product(
      id: "2",
      title: "iPhone",
      imageUrl: "assets/momin.jpg",
      price: 20000,
    ),
    Product(id: "3", title: "iPad", imageUrl: "assets/momin.jpg", price: 50000),
    Product(
      id: "4",
      title: "AirPods",
      imageUrl: "assets/momin.jpg",
      price: 15000,
    ),
  ];
}
