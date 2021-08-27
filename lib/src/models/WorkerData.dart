
class WorkerData {
  String email;
  String id;
  List<String> idMarket;
  String image;
  double lat;
  double long;
  String name;
  int phone;
  int timesTamp;
  String token;
  bool visible;

  WorkerData(
      {this.email,
        this.id,
        this.idMarket,
        this.image,
        this.lat,
        this.long,
        this.name,
        this.phone,
        this.timesTamp,
        this.token,
        this.visible});




  // ignore: non_constant_identifier_names


  void WorkerSign(String id, String name, String email,String token,List<String> market)
  {

    print("model"+id.toString()) ;
    this.id=id; this.name=name; this.email=email;this.token=token ;this.idMarket=market;this.image="https://www.pngkey.com/png/full/284-2844044_fashion-toys-electrical-items-and-more-girl-with.png";}



  WorkerData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    idMarket = json['id_market'].cast<String>();
    image = json['image'];
    lat = json['lat'];
    long = json['long'];
    name = json['name'];
    phone = json['phone'];
    timesTamp = json['timesTamp'];
    token = json['token'];
    visible = json['visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    data['id_market'] = this.idMarket;
    data['image'] = this.image;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['timesTamp'] = this.timesTamp;
    data['token'] = this.token;
    data['visible'] = this.visible;
    return data;
  }



}
