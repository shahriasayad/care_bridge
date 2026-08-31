import 'package:get/get.dart';
import 'package:care_bridge/core/const/image_path.dart';
import 'package:care_bridge/features/role/user/user_services/user_main_services/model/user_provider_model.dart';

class UserServicesController extends GetxController {
  var searchQuery = ''.obs;
  var selectedCategoryIndex = 0.obs;

  final List<String> categories = [
    'All',
    'Cadiologist',
    'Nutritionist',
    'Dermatologist',
    'Pediatrician',
  ];

  final List<UserProviderModel> allProviders = [
    UserProviderModel(
      name: 'Dr. Sarah Chen',
      specialty: 'Nutritionist',
      rating: 4.7,
      reviews: 127,
      location: 'Dhaka, Bangladesh',
      image: ImagePath.profile1,
      about:
          'Dr. Sarah Johnson is a board-certified general physician with over 15 years of experience. She specializes in preventive care, chronic disease management, and holistic health approaches.',
      services: [
        UserServiceModel(name: 'General Consultation', price: 150),
        UserServiceModel(name: 'Precision Cut', price: 29),
        UserServiceModel(name: 'General Consultation', price: 150),
      ],
      insurances: [
        UserInsuranceModel(
          name: 'MetLife',
          coverage: 'Covers up to 80% consultation',
        ),
        UserInsuranceModel(
          name: 'Blue Cross',
          coverage: 'Full coverage for preventive care',
        ),
      ],
      reviewList: [
        UserReviewModel(
          userName: 'Michael Chen',
          userImage: 'https://i.pravatar.cc/150?u=michael',
          rating: 5,
          date: '1 month ago',
          text:
              'Dr. Sarah Johnson is a board-certified general physician with over 15 years of experience. She specializes in preventive care, chronic disease management, and holistic health approaches.',
        ),
        UserReviewModel(
          userName: 'Emily Davis',
          userImage: 'https://i.pravatar.cc/150?u=emily',
          rating: 4,
          date: '2 weeks ago',
          text:
              'Very helpful consultation. She explained everything clearly and made me feel comfortable.',
        ),
        UserReviewModel(
          userName: 'John Smith',
          userImage: 'https://i.pravatar.cc/150?u=john',
          rating: 5,
          date: '3 days ago',
          text:
              'Highly recommend! The best nutritionist I have visited. Very professional and knowledgeable.',
        ),
      ],
    ),
    UserProviderModel(
      name: 'Dr. Sarah Chen',
      specialty: 'Cadiologist',
      rating: 4.7,
      reviews: 127,
      location: 'Dhaka, Bangladesh',
      image: ImagePath.profile4,
      about:
          'Dr. Sarah Johnson is a board-certified cardiologist with over 15 years of experience in heart health.',
      services: [
        UserServiceModel(name: 'General Consultation', price: 150),
        UserServiceModel(name: 'Precision Cut', price: 29),
        UserServiceModel(name: 'General Consultation', price: 150),
      ],
      insurances: [
        UserInsuranceModel(
          name: 'MetLife',
          coverage: 'Covers up to 80% consultation',
        ),
        UserInsuranceModel(
          name: 'Blue Cross',
          coverage: 'Full coverage for preventive care',
        ),
      ],
      reviewList: [],
    ),
    UserProviderModel(
      name: 'Dr. Sarah Chen',
      specialty: 'Nutritionist',
      rating: 4.7,
      reviews: 127,
      location: 'Dhaka, Bangladesh',
      image: ImagePath.porfile3,
      about:
          'Expert nutritionist focusing on weight management and dietary balance.',
      services: [
        UserServiceModel(name: 'General Consultation', price: 150),
        UserServiceModel(name: 'Precision Cut', price: 29),
        UserServiceModel(name: 'General Consultation', price: 150),
      ],
      insurances: [
        UserInsuranceModel(
          name: 'MetLife',
          coverage: 'Covers up to 80% consultation',
        ),
        UserInsuranceModel(
          name: 'Blue Cross',
          coverage: 'Full coverage for preventive care',
        ),
      ],
      reviewList: [],
    ),
    UserProviderModel(
      name: 'Dr. Sarah Chen',
      specialty: 'Nutritionist',
      rating: 4.7,
      reviews: 127,
      location: 'Dhaka, Bangladesh',
      image: ImagePath.profile4,
      about:
          'Experienced nutritionist with a focus on sports nutrition and performance.',
      services: [
        UserServiceModel(name: 'General Consultation', price: 150),
        UserServiceModel(name: 'Precision Cut', price: 29),
        UserServiceModel(name: 'General Consultation', price: 150),
      ],
      insurances: [
        UserInsuranceModel(
          name: 'MetLife',
          coverage: 'Covers up to 80% consultation',
        ),
        UserInsuranceModel(
          name: 'Blue Cross',
          coverage: 'Full coverage for preventive care',
        ),
      ],
      reviewList: [],
    ),
  ];

  var filteredProviders = <UserProviderModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredProviders.assignAll(allProviders);

    ever(searchQuery, (_) => _filterProviders());
    ever(selectedCategoryIndex, (_) => _filterProviders());
  }

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  void _filterProviders() {
    var result = allProviders.where((provider) {
      final matchesSearch =
          provider.name.toLowerCase().contains(
                searchQuery.value.toLowerCase(),
              ) ||
          provider.specialty.toLowerCase().contains(
                searchQuery.value.toLowerCase(),
              );

      final matchesCategory =
          selectedCategoryIndex.value == 0 ||
          provider.specialty == categories[selectedCategoryIndex.value];

      return matchesSearch && matchesCategory;
    }).toList();

    filteredProviders.assignAll(result);
  }
}
