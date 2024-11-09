class Hotel {
  final int id;
  final String name;
  final String description;
  final String thumbnail;
  final List<RoomType> roomTypes;
  final List<Gallery> gallery;
  final List<Feature> features;
  final List<FAQ> faqs;
  final District district;
  final String address;
  final String mobile;
  final String email;
  final String status;
  final String category;
  final int views;
  final bool featured;
  final String hid;
  final String slug;
  final DateTime date;
  final int ratingCount;
  final int userId;

  Hotel({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.roomTypes,
    required this.gallery,
    required this.features,
    required this.faqs,
    required this.district,
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
    required this.ratingCount,
    required this.userId,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      roomTypes: (json['room_types'] as List)
          .map((e) => RoomType.fromJson(e))
          .toList(),
      gallery:
          (json['gallery'] as List).map((e) => Gallery.fromJson(e)).toList(),
      features:
          (json['features'] as List).map((e) => Feature.fromJson(e)).toList(),
      faqs: (json['faqs'] as List).map((e) => FAQ.fromJson(e)).toList(),
      district: District.fromJson(json['district']),
      address: json['address'],
      mobile: json['mobile'],
      email: json['email'],
      status: json['status'],
      category: json['category'],
      views: json['views'],
      featured: json['featured'],
      hid: json['hid'],
      slug: json['slug'],
      date: DateTime.parse(json['date']),
      ratingCount: json['rating_count'],
      userId: json['user'],
    );
  }
}

class RoomType {
  final int id;
  final String type;
  final double price;
  final int numberOfBeds;
  final int roomCapacity;
  final String rtid;
  final String slug;
  final DateTime date;
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
      price: double.parse(json['price']),
      numberOfBeds: json['number_of_beds'],
      roomCapacity: json['room_capacity'],
      rtid: json['rtid'],
      slug: json['slug'],
      date: DateTime.parse(json['date']),
      hotel: json['hotel'],
    );
  }
}

class Gallery {
  final int id;
  final String imageUrl;

  Gallery({
    required this.id,
    required this.imageUrl,
  });

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

  Feature({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
    );
  }
}

class FAQ {
  final int id;
  final String question;
  final String answer;

  FAQ({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory FAQ.fromJson(Map<String, dynamic> json) {
    return FAQ(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
    );
  }
}

class District {
  final int id;
  final String code;
  final String name;
  final Region region;

  District({
    required this.id,
    required this.code,
    required this.name,
    required this.region,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      region: Region.fromJson(json['region']),
    );
  }
}

class Region {
  final int id;
  final String code;
  final String name;

  Region({
    required this.id,
    required this.code,
    required this.name,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      id: json['id'],
      code: json['code'],
      name: json['name'],
    );
  }
}
