class Hotel {
  final int id;
  final String name;
  final String description;
  final String image;
  final String address;
  final String mobile;
  final String email;
  final String status;
  final String category;
  final int views;
  final bool featured;
  final String hid;
  final String slug;
  final String date;
  final List<RoomType> roomTypes;
  final String thumbnail;
  final List<Gallery> gallery;
  final List<Feature> features;
  final List<Faq> faqs;
  final int ratingCount;
  final String? district;

  Hotel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.address,
    required this.mobile,
    required this.email,
    required this.status,
    required this.category,
    required this.views,
    required this.featured,
    required this.hid,
    required this.slug,
    required this.date,
    required this.roomTypes,
    required this.thumbnail,
    required this.gallery,
    required this.features,
    required this.faqs,
    required this.ratingCount,
    this.district,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      address: json['address'],
      mobile: json['mobile'],
      email: json['email'],
      status: json['status'],
      category: json['category'],
      views: json['views'],
      featured: json['featured'],
      hid: json['hid'],
      slug: json['slug'],
      date: json['date'],
      roomTypes: (json['room_types'] as List)
          .map((e) => RoomType.fromJson(e))
          .toList(),
      thumbnail: json['thumbnail'],
      gallery:
          (json['gallery'] as List).map((e) => Gallery.fromJson(e)).toList(),
      features:
          (json['features'] as List).map((e) => Feature.fromJson(e)).toList(),
      faqs: (json['faqs'] as List).map((e) => Faq.fromJson(e)).toList(),
      ratingCount: json['rating_count'],
      district: json['district'],
    );
  }
}

class RoomType {
  final int id;
  final String type;
  final String price;
  final int numberOfBeds;
  final int roomCapacity;
  final String rtid;
  final String slug;
  final String date;
  final int hotel;

  RoomType({
    required this.id,
    required this.type,
    required this.price,
    required this.numberOfBeds,
    required this.roomCapacity,
    required this.rtid,
    required this.slug,
    required this.date,
    required this.hotel,
  });

  factory RoomType.fromJson(Map<String, dynamic> json) {
    return RoomType(
      id: json['id'],
      type: json['type'],
      price: json['price'],
      numberOfBeds: json['number_of_beds'],
      roomCapacity: json['room_capacity'],
      rtid: json['rtid'],
      slug: json['slug'],
      date: json['date'],
      hotel: json['hotel'],
    );
  }
}

class Gallery {
  final int id;
  final String imageUrl;

  Gallery({required this.id, required this.imageUrl});

  factory Gallery.fromJson(Map<String, dynamic> json) {
    return Gallery(
      id: json['id'],
      imageUrl: json['image_url'],
    );
  }
}

class Feature {
  final int id;
  final String name;
  final String icon;

  Feature({required this.id, required this.name, required this.icon});

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
    );
  }
}

class Faq {
  final int id;
  final String question;
  final String answer;

  Faq({required this.id, required this.question, required this.answer});

  factory Faq.fromJson(Map<String, dynamic> json) {
    return Faq(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
    );
  }
}
