class Items {
  String imgURL;
  String price;
  String productName;
  String date;
  String id;

  Items(this.imgURL, this.price, this.productName, this.date, this.id);

  @override
  String toString() {
    return 'Items{imgURL: $imgURL, price: $price, productName: $productName, date: $date, id: $id}';
  }
}
