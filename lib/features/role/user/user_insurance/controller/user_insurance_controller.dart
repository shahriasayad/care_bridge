import 'package:get/get.dart';
import 'package:care_bridge/features/role/user/user_insurance/model/user_insurance_model.dart';

class UserInsuranceController extends GetxController {
  final searchQuery = ''.obs;
  final isLoading = false.obs;

  final _allInsurances = <UserInsuranceModel>[
    const UserInsuranceModel(
      id: '1',
      providerName: 'Cigna',
      planName: 'Healthy Choices',
      type: 'PPO',
      ratingText: 'Highly Rated',
      rating: 4.6,
      reviews: 13897,
      deductible: 1250,
      outOfPocketMax: 4700,
      monthlyPremium: 298,
      description: 'Covers up to 80% consultation',
    ),
    const UserInsuranceModel(
      id: '2',
      providerName: 'Cigna',
      planName: 'Healthy Choices',
      type: 'PPO',
      ratingText: 'Highly Rated',
      rating: 4.6,
      reviews: 13897,
      deductible: 1250,
      outOfPocketMax: 4700,
      monthlyPremium: 298,
      description: 'Full coverage for preventive care',
    ),
    const UserInsuranceModel(
      id: '3',
      providerName: 'Cigna',
      planName: 'Healthy Choices',
      type: 'PPO',
      ratingText: 'Highly Rated',
      rating: 4.6,
      reviews: 13897,
      deductible: 1250,
      outOfPocketMax: 4700,
      monthlyPremium: 298,
      description: 'Covers up to 80% consultation',
    ),
  ].obs;

  List<UserInsuranceModel> get filteredInsurances {
    if (searchQuery.value.isEmpty) return _allInsurances;
    return _allInsurances
        .where(
          (i) =>
              i.providerName.toLowerCase().contains(
                searchQuery.value.toLowerCase(),
              ) ||
              i.description.toLowerCase().contains(
                searchQuery.value.toLowerCase(),
              ),
        )
        .toList();
  }

  int get total => filteredInsurances.length;

  void onSearchChanged(String value) => searchQuery.value = value;
}
