class Plant {
  String title;
  String plantType;
  String description;
  int rate;
  int price;
  String imgUrl;
  int light;
  int humidity;
  int temp;
  int water;
  List<String> category;

  Plant({
    required this.title,
    required this.plantType,
    required this.description,
    required this.rate,
    required this.price,
    required this.imgUrl,
    required this.light,
    required this.humidity,
    required this.temp,
    required this.water,
    required this.category,
  });
}
