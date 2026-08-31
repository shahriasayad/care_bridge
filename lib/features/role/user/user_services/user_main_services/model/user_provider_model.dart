class UserServiceModel {
  final String name;
  final double price;
  final String duration;

  UserServiceModel({
    required this.name,
    required this.price,
    this.duration = '1 hour',
  });
}

class UserInsuranceModel {
  final String name;
  final String coverage;

  UserInsuranceModel({required this.name, required this.coverage});
}

class UserReviewModel {
  final String userName;
  final String userImage;
  final double rating;
  final String date;
  final String text;

  UserReviewModel({
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.date,
    required this.text,
  });
}

class UserProviderModel {
  final String name;
  final String specialty;
  final double rating;
  final int reviews;
  final String location;
  final String image;
  final String about;
  final String availability;
  final List<UserServiceModel> services;
  final List<UserInsuranceModel> insurances;
  final List<UserReviewModel> reviewList;

  UserProviderModel({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviews,
    required this.location,
    required this.image,
    required this.about,
    this.availability = 'Tomorrow . 10:00 AM',
    required this.services,
    required this.insurances,
    required this.reviewList,
  });
}
