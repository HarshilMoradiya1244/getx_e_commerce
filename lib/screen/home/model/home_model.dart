class ProductModel {
  String? tittle, description, category, image;
  num? id, price;
  RatingModel? ratingModel;

  ProductModel(
      {this.tittle,
      this.description,
      this.category,
      this.image,
      this.id,
      this.price,
      this.ratingModel});

  factory ProductModel.mapToModel(Map m1) {
    return ProductModel(
      id: m1['id'],
      price: m1['price'],
      tittle: m1['title'],
      description: m1['description'],
      category: m1['category'],
      image: m1['image'],
      ratingModel: RatingModel.mapToModel(m1['rating']),
    );
  }

}
class RatingModel {
  num? rate;
  int? count;

  RatingModel({this.rate, this.count});

  factory RatingModel.mapToModel(Map m1) {
    return RatingModel(
      count: m1['count'],
      rate: m1['rate'],
    );
  }
}

