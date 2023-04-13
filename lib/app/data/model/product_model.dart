class ProductModel {
  final String? categoryName;
  final String? description;
  final String? imageUrl;
  final List<Services>? services;

  ProductModel({
    this.categoryName,
    this.description,
    this.imageUrl,
    this.services,
  });

  ProductModel.fromJson(Map<String, dynamic> json)
      : categoryName = json['category_name'] as String?,
        description = json['description'] as String?,
        imageUrl = json['image_url'] as String?,
        services = (json['services'] as List?)
            ?.map((dynamic e) => Services.fromJson(
                  e as Map<String, dynamic>,
                ))
            .toList();

  Map<String, dynamic> toJson() => {
        'category_name': categoryName,
        'description': description,
        'image_url': imageUrl,
        'services': services?.map((e) => e.toJson()).toList()
      };
}

class Services {
  final String? serviceName;
  final int? rate;
  final String? description;
  final String? imageUrl;

  Services({
    this.serviceName,
    this.rate,
    this.description,
    this.imageUrl,
  });

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        serviceName: json['service_name'] as String?,
        rate: json['rate'] as int?,
        description: json['description'] as String?,
        imageUrl: json['image_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'service_name': serviceName,
        'rate': rate,
        'description': description,
        'image_url': imageUrl,
      };
}
