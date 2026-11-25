class Food {
  final String id;
  final String name;
  final String restaurant;
  final String category;
  final String description;
  final String imageUrl;
  final double price;
  final double rating;
  final int deliveryMinutes;
  final bool isPopular;

  const Food({
    required this.id,
    required this.name,
    required this.restaurant,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.deliveryMinutes,
    this.isPopular = false,
  });
}
