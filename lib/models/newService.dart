
//este de aca se usa para post y put service
class newService{
  final String name;
  final int price;
  final String location;
  final String img_url;
  final String description;
  final int score;
  final String agencyId;
  final bool isOffer;
  final int priceOffer;


  newService({
    required this.name,
    required this.price,
    required this.location,
    required this.img_url,
    required this.description,
    required this.score,
    required this.agencyId,
    required this.priceOffer,
    required this.isOffer
  });

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'price': price,
        'location': location,
        'img_url': img_url,
        'description': description,
        'score': score,
        'agency_id': agencyId,
        'priceOffer': priceOffer,
        'isOffer': isOffer

      };

  factory newService.fromJson(Map<String, dynamic> json){
    return newService(
        name: json['name'],
        price: json['price'],
        location: json['location'],
        img_url: json['img_url'],
        description: json['description'],
        score: json['score'],
        agencyId: json['agency_id'],
        priceOffer: json['priceOffer'],
        isOffer: json['isOffer']);
  }
}