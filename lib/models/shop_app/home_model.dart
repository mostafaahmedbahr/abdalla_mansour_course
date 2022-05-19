class HomeModel
{
  bool status;
  HomeDataModel data;
  //named constructor
  HomeModel.fromJson(Map<dynamic,dynamic> json)
  {
    status= json["status"];
    data= HomeDataModel.fromJson(json['data']);

  }

}

class HomeDataModel
{
  List<dynamic> products=[];
  List<dynamic> banners=[];
  HomeDataModel.fromJson(Map<dynamic,dynamic> json)
  {
    json['banners'].forEach((element){
      banners.add(element);
    });

    json['products'].forEach((element){
      products.add(element);
    });
  }
}

class BannerModel
{
  int id;
  String image;
  BannerModel.fromJson(Map<dynamic,dynamic> json)
  {
    id=json['id'];
    image=json['image'];
  }
}

class ProductModel
{
  String name;
  String image;
  int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  bool isFav;
  bool isCard;
  ProductModel.fromJson(Map<String,dynamic> json)
  {
    name=json['name'];
    image=json['image'];
    id=json['id'];
    price=json['price'];
    oldPrice=json['old_price'];
    discount=json['discount'];
    isFav=json['in_favorites'];
    isCard=json['in_card'];
  }
}