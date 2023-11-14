class ProductModel {
  List<Product> products = [];

  ProductModel(this.products);

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      products = <Product>[];
      json['results'].forEach((v) {
        products.add(Product.fromJson(v));
      });
    }
  }
}

class Product {
  String productTitle = '';
  String productBrand = '';
  String productDescription = '';
  int productPrice = 0;
  ProductImage? productImage;

  Product({this.productImage});

  Product.fromJson(Map<String, dynamic> json) {
    productTitle = json['product_title'];
    productBrand = json['product_brand'];
    productDescription = json['product_description'];
    productPrice = json['product_price'];
    productImage = json['product_image'] != null
        ? ProductImage.fromJson(json['product_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_title'] = productTitle;
    data['product_brand'] = productBrand;
    data['product_description'] = productDescription;
    data['product_price'] = productPrice;
    if (productImage != null) {
      data['product_image'] = productImage!.toJson();
    }
    return data;
  }
}

class ProductImage {
  String? url;

  ProductImage({this.url});

  ProductImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}
