class ModelData {
  String? image;
  String? discount;
  String? upto;
  String? restratype;
  String? title;
  String? rating;
  String? items;
  String? location;

  ModelData(
      {this.image,
        this.discount,
        this.upto,
        this.restratype,
        this.title,
        this.rating,
        this.items,
        this.location});

  ModelData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    discount = json['discount'];
    upto = json['Upto'];
    restratype = json['restratype'];
    title = json['title'];
    rating = json['Rating'];
    items = json['items'];
    location = json['Location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['discount'] = this.discount;
    data['Upto'] = this.upto;
    data['restratype'] = this.restratype;
    data['title'] = this.title;
    data['Rating'] = this.rating;
    data['items'] = this.items;
    data['Location'] = this.location;
    return data;
  }
}