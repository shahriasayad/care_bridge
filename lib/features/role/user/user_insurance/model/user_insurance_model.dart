class UserInsuranceModel {
  final String id;
  final String providerName;
  final String planName;
  final String type;
  final String ratingText;
  final double rating;
  final int reviews;
  final int deductible;
  final int outOfPocketMax;
  final int monthlyPremium;
  final String description;

  const UserInsuranceModel({
    required this.id,
    required this.providerName,
    this.planName = 'Healthy Choices',
    this.type = 'PPO',
    this.ratingText = 'Highly Rated',
    this.rating = 4.6,
    this.reviews = 13897,
    this.deductible = 1250,
    this.outOfPocketMax = 4700,
    this.monthlyPremium = 298,
    required this.description,
  });

  factory UserInsuranceModel.fromJson(Map<String, dynamic> json) =>
      UserInsuranceModel(
        id: json['id'] as String,
        providerName: json['provider_name'] as String,
        planName: json['plan_name'] as String? ?? 'Healthy Choices',
        type: json['type'] as String? ?? 'PPO',
        ratingText: json['rating_text'] as String? ?? 'Highly Rated',
        rating: (json['rating'] as num?)?.toDouble() ?? 4.6,
        reviews: json['reviews'] as int? ?? 13897,
        deductible: json['deductible'] as int? ?? 1250,
        outOfPocketMax: json['out_of_pocket_max'] as int? ?? 4700,
        monthlyPremium: json['monthly_premium'] as int? ?? 298,
        description: json['description'] as String? ?? '',
      );
}