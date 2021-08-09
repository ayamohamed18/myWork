class Workshop {
  final String title, avatar,address;
  final int id;
  final List<dynamic> images;
  Workshop.fromJson(dynamic json)
      : this.id = json['id'],
        this.avatar = json['avatar'],
        this.title = json['title'],
        this.address=json['address'],
        this.images = json['images'];
}
