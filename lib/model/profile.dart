class Profile {
  final String? image;
  final String? fullName;
  final String? phone;
  final String? gender;
  final String? country;
  final String? city;
  final String? state;
  final String? address;
  final String? identityType;
  final String? identityImage;
  final String? facebook;
  final String? twitter;
  final String? email;

  Profile({
    this.image,
    this.fullName,
    this.phone,
    this.gender,
    this.country,
    this.city,
    this.state,
    this.address,
    this.identityType,
    this.identityImage,
    this.facebook,
    this.twitter,
    this.email,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      image: json['image'],
      fullName: json['full_name'],
      phone: json['phone'],
      gender: json['gender'],
      country: json['country'],
      city: json['city'],
      state: json['state'],
      address: json['address'],
      identityType: json['identity_type'],
      identityImage: json['identity_image'],
      facebook: json['facebook'],
      twitter: json['twitter'],
      email: json['email'],
    );
  }
}
