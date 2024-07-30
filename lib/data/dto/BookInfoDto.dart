class BookInfoDto {
  BookInfoDto({
      this.authors, 
      this.contents, 
      this.datetime, 
      this.isbn, 
      this.price, 
      this.publisher, 
      this.salePrice, 
      this.status, 
      this.thumbnail, 
      this.title, 
      this.translators, 
      this.url,});

  BookInfoDto.fromJson(dynamic json) {
    authors = json['authors'] != null ? json['authors'].cast<String>() : [];
    contents = json['contents'];
    datetime = json['datetime'];
    isbn = json['isbn'];
    price = json['price'];
    publisher = json['publisher'];
    salePrice = json['sale_price'];
    status = json['status'];
    thumbnail = json['thumbnail'];
    title = json['title'];
    translators = json['translators'] != null ? json['translators'].cast<String>() : [];
    url = json['url'];
  }
  List<String>? authors;
  String? contents;
  String? datetime;
  String? isbn;
  num? price;
  String? publisher;
  num? salePrice;
  String? status;
  String? thumbnail;
  String? title;
  List<String>? translators;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['authors'] = authors;
    map['contents'] = contents;
    map['datetime'] = datetime;
    map['isbn'] = isbn;
    map['price'] = price;
    map['publisher'] = publisher;
    map['sale_price'] = salePrice;
    map['status'] = status;
    map['thumbnail'] = thumbnail;
    map['title'] = title;
    map['translators'] = translators;
    map['url'] = url;
    return map;
  }

}