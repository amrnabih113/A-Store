class BannerModel {
  int id;
  String imageUrl;
  bool isActive;
  String targretScreen;

  BannerModel(this.id, this.imageUrl, this.isActive, this.targretScreen);

  static BannerModel empty() => BannerModel(0, "", false, "");

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(json['id'], json['image_url'], json['is_active'],
        json['target_screen']);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": imageUrl,
        "is_active": isActive,
        "target_screen": targretScreen,
      };
}
