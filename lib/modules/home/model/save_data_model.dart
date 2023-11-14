class SavedRestaurantModel {
  String? resId;
  String? restaurantName;
  String? restaurantRate;
  String? restaurantImage;
  String? restaurantMap;
  String? restaurantCategory;
  String? restaurantDiningStyle;
  String? restaurantPriceUnit;

  SavedRestaurantModel({
      this.resId,
      this.restaurantName,
      this.restaurantRate,
      this.restaurantImage,
      this.restaurantMap,
      this.restaurantCategory,
      this.restaurantDiningStyle,
      this.restaurantPriceUnit,
  });

  SavedRestaurantModel.fromJson(Map<String, dynamic> json) {
    resId = json['resId'];
    restaurantName = json['restaurantName'];
    restaurantRate = json['restaurantRate'];
    restaurantImage = json['restaurantImage'];
    restaurantMap = json['restaurantMap'];
    restaurantCategory = json['restaurantCategory'];
    restaurantDiningStyle = json['restaurantDiningStyle'];
    restaurantPriceUnit = json['restaurantPriceUnit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resId'] = resId;
    data['restaurantName'] = restaurantName;
    data['restaurantRate'] = restaurantRate;
    data['restaurantImage'] = restaurantImage;
    data['restaurantMap'] = restaurantMap;
    data['restaurantCategory'] = restaurantCategory;
    data['restaurantDiningStyle'] = restaurantDiningStyle;
    data['restaurantPriceUnit'] = restaurantPriceUnit;
    return data;
  }
}
