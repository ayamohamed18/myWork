class CarMaintinance {
  final String title, avatar, maintenance, price;
  final int id;
  CarMaintinance.fromJson(dynamic json)
      : this.id = json['id'],
        this.title = json['title'],
        this.avatar = json['avatar'],
        this.maintenance = json['maintenance'],
        this.price = json['price'];
}
