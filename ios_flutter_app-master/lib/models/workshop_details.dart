class WorkshopDetails {
  final String title, phone, location, description, disOffer, avatar;
  final int id, offer;
  final List<dynamic> images;
  WorkshopDetails.fromJson(dynamic json)
      : this.id = json['id'],
        this.images = json['images'],
        this.title = json['title'],
        this.phone = json['phone'],
        this.location = json['location'],
        this.offer = json['offer'],
        this.disOffer = json['dis_offer'],
        this.avatar = json['avatar'],
        this.description = json['discription'];
}
