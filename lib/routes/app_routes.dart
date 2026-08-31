import 'package:get/get.dart';
import 'package:care_bridge/features/auth/choose_your_specialisation/screen/choose_your_specialisation_screen.dart';
import 'package:care_bridge/features/auth/create_account/screen/create_account_screen.dart';
import 'package:care_bridge/features/auth/forget/screen/forget_password_email_screen.dart';
import 'package:care_bridge/features/auth/login/screen/login_screen.dart';
import 'package:care_bridge/features/bottom_nav/screen/bottom_nav_screen.dart';
import 'package:care_bridge/features/role/provider/home/screen/provider_home_screen.dart';
import 'package:care_bridge/features/role/provider/profile/change_password/screen/provider_change_password_screen.dart';
import 'package:care_bridge/features/role/provider/profile/subscription/cancel_subscription/screen/provider_cancel_subscription_screen.dart';
import 'package:care_bridge/features/role/provider/profile/subscription/provider_subscription_cancel_feedback/screen/provider_subscription_cancel_feedback_screen.dart';
import 'package:care_bridge/features/role/provider/profile/subscription/provider_subscription_cancel_reason/screen/provider_subscription_cancel_reason_screen.dart';
import 'package:care_bridge/features/role/provider/profile/subscription/provider_subscription_cancel_success/screen/provider_subscription_cancel_success_screen.dart';
import 'package:care_bridge/features/role/provider/profile/subscription/screen/provider_subscription_screen.dart';
import 'package:care_bridge/features/role/role_selection/screen/role_screen.dart';
import 'package:care_bridge/features/role/user/user_home/screen/user_home_screen.dart';
import 'package:care_bridge/features/role/user/user_insights/screen/user_insights_screen.dart';
import 'package:care_bridge/core/notifications/screen/notifications_screen.dart';
import 'package:care_bridge/features/role/user/user_profile/user_message/screen/user_message_screen.dart';
import 'package:care_bridge/features/role/user/user_profile/user_password/screen/user_change_password_screen.dart';
import 'package:care_bridge/features/role/user/user_profile/user_payment/screen/user_payment_screen.dart';
import 'package:care_bridge/features/role/user/user_profile/user_profile_info/screen/user_profile_information_screen.dart';
import 'package:care_bridge/features/role/user/user_profile/user_subscription/screen/user_subscription_screen.dart';
import 'package:care_bridge/features/role/user/user_services/user_main_services/screen/user_services_screen.dart';
import 'package:care_bridge/features/role/user/user_track/screen/user_track_meal_screen.dart';
import 'package:care_bridge/features/role/user/user_services/user_provider_details/screen/user_provider_details_screen.dart';
import 'package:care_bridge/features/role/user/user_services/user_booking/screen/user_booking_screen.dart';
import 'package:care_bridge/features/role/user/user_services/user_booking/screen/user_booking_success_screen.dart';
import 'package:care_bridge/features/role/user/user_services/user_provider_details/binding/user_provider_details_binding.dart';
import 'package:care_bridge/features/role/user/user_services/user_booking/binding/user_booking_binding.dart';
import 'package:care_bridge/features/bottom_nav/binding/bottom_nav_binding.dart';
import 'package:care_bridge/features/splash/screen/splash_screen.dart';
import 'package:care_bridge/features/splash/screen/create_splash_screen.dart';
import 'package:care_bridge/features/auth/about_you/screen/about_you_screen.dart';
import 'package:care_bridge/features/auth/about_you/screen/select_gender_screen.dart';
import 'package:care_bridge/features/auth/about_you/screen/select_units_screen.dart';
import 'package:care_bridge/features/auth/about_you/screen/select_height_screen.dart';
import 'package:care_bridge/features/auth/about_you/screen/select_activity_screen.dart';
import 'package:care_bridge/features/auth/about_you/screen/select_diet_screen.dart';
import 'package:care_bridge/features/auth/about_you/screen/select_goals_screen.dart';
import 'package:care_bridge/features/auth/about_you/screen/select_motivation_screen.dart';
import 'package:care_bridge/features/auth/about_you/screen/select_conditions_screen.dart';
import 'package:care_bridge/features/auth/about_you/screen/select_medications_screen.dart';
import 'package:care_bridge/features/auth/about_you/screen/all_set_screen.dart';
import 'package:care_bridge/features/auth/about_you/screen/get_premium_screen.dart';
import 'package:care_bridge/features/role/provider/profile/profile_info/screen/provider_profile_info_screen.dart';
import 'package:care_bridge/features/role/user/user_profile/user_message/model/user_message_model.dart';
import 'package:care_bridge/features/role/provider/message/message_details/screen/message_details_screen.dart';
import 'package:care_bridge/features/video_call/screen/video_call_screen.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/user/user_appointments/binding/user_appointments_binding.dart';
import 'package:care_bridge/features/role/user/user_appointments/screen/user_appointments_screen.dart';
import 'package:care_bridge/features/role/user/user_profile/user_help_support/binding/user_help_support_binding.dart';
import 'package:care_bridge/features/role/user/user_profile/user_help_support/screen/user_help_support_screen.dart';
import 'package:care_bridge/features/role/user/user_profile/user_tickets/binding/user_tickets_binding.dart';
import 'package:care_bridge/features/role/user/user_profile/user_tickets/screen/user_tickets_screen.dart';
import 'package:care_bridge/features/role/user/user_profile/user_tickets/binding/my_tickets_list_binding.dart';
import 'package:care_bridge/features/role/user/user_profile/user_tickets/screen/my_tickets_list_screen.dart';
import 'package:care_bridge/features/role/user/user_profile/user_subscription/screen/user_subscription_cancel_screen.dart';
import 'package:care_bridge/features/role/user/user_profile/user_subscription/screen/user_subscription_cancel_reasons_screen.dart';
import 'package:care_bridge/features/role/user/user_profile/user_subscription/screen/user_subscription_cancel_feedback_screen.dart';
import 'package:care_bridge/features/role/user/user_profile/user_subscription/screen/user_subscription_cancel_confirmation_screen.dart';
import 'package:care_bridge/features/role/user/user_log_exercise/screen/user_log_exercise_screen.dart';
import 'package:care_bridge/features/role/user/user_log_exercise/binding/user_log_exercise_binding.dart';
import 'package:care_bridge/features/role/provider/client_details/screen/client_details_screen.dart';
import 'package:care_bridge/features/role/provider/client_details/binding/client_details_binding.dart';

class AppRoutes {
  static String splashScreen = '/splashScreen';
  static String roleScreen = '/roleScreen';
  static String loginScreen = '/loginScreen';
  static String createAccountScreen = '/createAccountScreen';
  static String createSplashScreen = '/createSplashScreen';
  static String aboutYouScreen = '/aboutYouScreen';
  static String selectGenderScreen = '/selectGenderScreen';
  static String selectUnitsScreen = '/selectUnitsScreen';
  static String selectHeightScreen = '/selectHeightScreen';
  static String selectActivityScreen = '/selectActivityScreen';
  static String selectDietScreen = '/selectDietScreen';
  static String selectGoalsScreen = '/selectGoalsScreen';
  static String selectMotivationScreen = '/selectMotivationScreen';
  static String selectConditionsScreen = '/selectConditionsScreen';
  static String selectMedicationsScreen = '/selectMedicationsScreen';
  static String allSetScreen = '/allSetScreen';
  static String getPremiumScreen = '/getPremiumScreen';
  static String forgetPasswordEmailScreen = '/forgetPasswordEmailScreen';
  static String chooseYourSpecialisationScreen =
      '/chooseYourSpecialisationScreen';
  static String providerHomeScreen = '/providerHomeScreen';
  static String userHomeScreen = '/userHomeScreen';
  static String userInsightsScreen = '/userInsightsScreen';
  static String notificationsScreen = '/notificationsScreen';
  static String userTrackMealScreen = '/userTrackMealScreen';
  static String userServicesScreen = '/userServicesScreen';
  static String userProviderDetailsScreen = '/userProviderDetailsScreen';
  static String userBookingScreen = '/userBookingScreen';
  static String userBookingSuccessScreen = '/userBookingSuccessScreen';
  static String bottomNavScreen = '/bottomNavScreen';
  static String userprofileInformationScreen = '/UserProfileInformationScreen';
  static String userMessageScreen = '/UserMessageScreen';
  static String chatScreen = '/chat';
  static String userChangePasswordScreen = '/UserChangePasswordScreen';
  static String userPaymentScreen = '/UserPaymentScreen';
  static String userSubscriptionScreen = '/UserSubscriptionScreen';
  static String providerProfileInformationScreen =
      '/ProviderProfileInformationScreen';

  static String providerChangePasswordScreen = '/change-password';
  static String videoCallScreen = '/videoCallScreen';
  static String userAppointmentsScreen = '/UserAppointmentsScreen';
  static String userHelpSupportScreen = '/UserHelpSupportScreen';
  static String userTicketsScreen = '/UserTicketsScreen';
  static String myTicketsListScreen = '/MyTicketsListScreen';
  static String userSubscriptionCancelScreen = '/UserSubscriptionCancelScreen';
  static String userSubscriptionCancelReasonsScreen = '/UserSubscriptionCancelReasonsScreen';
  static String userSubscriptionCancelFeedbackScreen = '/UserSubscriptionCancelFeedbackScreen';
  static String userSubscriptionCancelConfirmationScreen = '/UserSubscriptionCancelConfirmationScreen';
  static String userLogExerciseScreen = '/UserLogExerciseScreen';
  static String providerSubscriptionScreen = '/ProviderSubscription';
  static String providerCancelSubscriptionScreen = '/ProviderCancelSubscription';
  static String providerSubscriptionCancelReasonScreen = '/ProviderSubscriptionCancelReasonScreen';
  static String providerSubscriptionCancelFeedbackScreen = '/ProviderSubscriptionCancelFeedbackScreen';
  static String providerSubscriptionCancelSuccessScreen = '/ProviderSubscriptionCancelSuccessScreen';
  static String clientDetailsScreen = '/ClientDetailsScreen';

  

  static String getSplashScreen() => splashScreen;
  static String getRoleScreen() => roleScreen;
  static String getLoginScreen() => loginScreen;
  static String getCreateAccountScreen() => createAccountScreen;
  static String getCreateSplashScreen() => createSplashScreen;
  static String getAboutYouScreen() => aboutYouScreen;
  static String getSelectGenderScreen() => selectGenderScreen;
  static String getSelectUnitsScreen() => selectUnitsScreen;
  static String getSelectHeightScreen() => selectHeightScreen;
  static String getSelectActivityScreen() => selectActivityScreen;
  static String getSelectDietScreen() => selectDietScreen;
  static String getSelectGoalsScreen() => selectGoalsScreen;
  static String getSelectMotivationScreen() => selectMotivationScreen;
  static String getSelectConditionsScreen() => selectConditionsScreen;
  static String getSelectMedicationsScreen() => selectMedicationsScreen;
  static String getAllSetScreen() => allSetScreen;
  static String getGetPremiumScreen() => getPremiumScreen;
  static String getForgetPasswordEmailScreen() => forgetPasswordEmailScreen;
  static String getChooseYourSpecialisationScreen() =>
      chooseYourSpecialisationScreen;
  static String getProviderHomeScreen() => providerHomeScreen;
  static String getUserHomeScreen() => userHomeScreen;
  static String getUserInsightsScreen() => userInsightsScreen;
  static String getNotificationsScreen() => notificationsScreen;
  static String getUserTrackMealScreen() => userTrackMealScreen;
  static String getUserServicesScreen() => userServicesScreen;
  static String getUserProviderDetailsScreen() => userProviderDetailsScreen;
  static String getUserBookingScreen() => userBookingScreen;
  static String getUserBookingSuccessScreen() => userBookingSuccessScreen;
  static String getBottomNavScreen() => bottomNavScreen;
  static String getUserProfileInformationScreen() =>
      userprofileInformationScreen;
  static String getUserMessageScreen() => userMessageScreen;
  static String getChatScreen() => chatScreen;
  static String getUserChangePasswordScreen() => userChangePasswordScreen;
  static String getUserPaymentScreen() => userPaymentScreen;
  static String getUserSubscriptionScreen() => userSubscriptionScreen;
  static String getProviderProfileInformationScreen() =>
      providerProfileInformationScreen;

  static String getProviderChangePasswordScreen() =>
      providerChangePasswordScreen;
  static String getVideoCallScreen() => videoCallScreen;
  static String getUserAppointmentsScreen() => userAppointmentsScreen;
  static String getUserHelpSupportScreen() => userHelpSupportScreen;
  static String getUserTicketsScreen() => userTicketsScreen;
  static String getMyTicketsListScreen() => myTicketsListScreen;
  static String getUserSubscriptionCancelScreen() => userSubscriptionCancelScreen;
  static String getUserSubscriptionCancelReasonsScreen() => userSubscriptionCancelReasonsScreen;
  static String getUserSubscriptionCancelFeedbackScreen() => userSubscriptionCancelFeedbackScreen;
  static String getUserSubscriptionCancelConfirmationScreen() => userSubscriptionCancelConfirmationScreen;
  static String getUserLogExerciseScreen() => userLogExerciseScreen;
  static String getProviderProfileInfoScreen() => providerProfileInformationScreen;
  static String getProviderChangePasswordScreens() => providerChangePasswordScreen;
  static String getProviderSubscriptionScreen() => providerSubscriptionScreen;
  static String getProviderCancelSubscriptionScreen() => providerCancelSubscriptionScreen;
  static String getProviderSubscriptionCancelReasonScreen() => providerSubscriptionCancelReasonScreen;
  static String getProviderSubscriptionCancelFeedbackScreen() => providerSubscriptionCancelFeedbackScreen;
  static String getProviderSubscriptionCancelSuccessScreen() => providerSubscriptionCancelSuccessScreen;




  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 800),
    ),
    GetPage(
      name: createSplashScreen,
      page: () => const CreateSplashScreen(),
    ),
    GetPage(
      name: aboutYouScreen,
      page: () => const AboutYouScreen(),
    ),
    GetPage(
      name: selectGenderScreen,
      page: () => const SelectGenderScreen(),
    ),
    GetPage(
      name: selectUnitsScreen,
      page: () => const SelectUnitsScreen(),
    ),
    GetPage(
      name: selectHeightScreen,
      page: () => const SelectHeightScreen(),
    ),
    GetPage(
      name: selectActivityScreen,
      page: () => const SelectActivityScreen(),
    ),
    GetPage(
      name: selectDietScreen,
      page: () => const SelectDietScreen(),
    ),
    GetPage(
      name: selectGoalsScreen,
      page: () => const SelectGoalsScreen(),
    ),
    GetPage(
      name: selectMotivationScreen,
      page: () => const SelectMotivationScreen(),
    ),
    GetPage(
      name: selectConditionsScreen,
      page: () => const SelectConditionsScreen(),
    ),
    GetPage(
      name: selectMedicationsScreen,
      page: () => const SelectMedicationsScreen(),
    ),
    GetPage(
      name: allSetScreen,
      page: () => const AllSetScreen(),
    ),
    GetPage(
      name: getPremiumScreen,
      page: () => const GetPremiumScreen(),
    ),
    GetPage(name: roleScreen, page: () => RoleScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: createAccountScreen, page: () => CreateAccountScreen()),
    GetPage(
      name: forgetPasswordEmailScreen,
      page: () => ForgetPasswordEmailScreen(),
    ),
    GetPage(
      name: chooseYourSpecialisationScreen,
      page: () => ChooseYourSpecialisationScreen(),
    ),
    GetPage(name: providerHomeScreen, page: () => ProviderHomeScreen()),
    GetPage(name: userHomeScreen, page: () => UserHomeScreen()),
    GetPage(name: userInsightsScreen, page: () => UserInsightsScreen()),
    GetPage(name: notificationsScreen, page: () => NotificationsScreen()),
    GetPage(name: userTrackMealScreen, page: () => UserTrackMealScreen()),
    GetPage(name: userServicesScreen, page: () => const UserServicesScreen()),
    GetPage(
      name: userProviderDetailsScreen,
      page: () => const UserProviderDetailsScreen(),
      binding: UserProviderDetailsBinding(),
    ),
    GetPage(
      name: userBookingScreen,
      page: () => const UserBookingScreen(),
      binding: UserBookingBinding(),
    ),
    GetPage(
      name: userBookingSuccessScreen,
      page: () => const UserBookingSuccessScreen(),
    ),
    GetPage(
      name: bottomNavScreen,
      page: () => BottomNavScreen(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: userprofileInformationScreen,
      page: () => const UserProfileInformationScreen(),
    ),
    GetPage(name: userMessageScreen, page: () => const UserMessageScreen()),

    GetPage(
      name: userChangePasswordScreen,
      page: () => const UserChangePasswordScreen(),
    ),
    GetPage(name: userPaymentScreen, page: () => const UserPaymentScreen()),
    GetPage(
      name: userSubscriptionScreen,
      page: () => const UserSubscriptionScreen(),
    ),
    GetPage(
      name: providerProfileInformationScreen,
      page: () => const ProviderProfileInfoScreen(),
    ),

    GetPage(
      name: providerChangePasswordScreen,
      page: () => const ProviderChangePasswordScreens(),
    ),
    GetPage(
      name: chatScreen,
      page: () {
        final args = Get.arguments;
        if (args is UserMessageModel) {
          return MessageDetailsScreen(
            userName: args.senderName,
            userAvatar: args.avatarUrl ?? IconPath.userProfileIcon2,
          );
        }
        return const MessageDetailsScreen(
          userName: 'Dr. Sarah Chen',
          userAvatar: IconPath.userProfileIcon2,
        );
      },
    ),
    GetPage(
      name: videoCallScreen,
      page: () => const VideoCallScreen(),
    ),
    GetPage(
      name: userAppointmentsScreen,
      page: () => const UserAppointmentsScreen(),
      binding: UserAppointmentsBinding(),
    ),
    GetPage(
      name: userHelpSupportScreen,
      page: () => const UserHelpSupportScreen(),
      binding: UserHelpSupportBinding(),
    ),
    GetPage(
      name: userTicketsScreen,
      page: () => const UserTicketsScreen(),
      binding: UserTicketsBinding(),
    ),
    GetPage(
      name: myTicketsListScreen,
      page: () => const MyTicketsListScreen(),
      binding: MyTicketsListBinding(),
    ),
    GetPage(
      name: userSubscriptionCancelScreen,
      page: () => const UserSubscriptionCancelScreen(),
    ),
    GetPage(
      name: userSubscriptionCancelReasonsScreen,
      page: () => const UserSubscriptionCancelReasonsScreen(),
    ),
    GetPage(
      name: userSubscriptionCancelFeedbackScreen,
      page: () => const UserSubscriptionCancelFeedbackScreen(),
    ),
    GetPage(
      name: userSubscriptionCancelConfirmationScreen,
      page: () => const UserSubscriptionCancelConfirmationScreen(),
    ),
    GetPage(
      name: userLogExerciseScreen,
      page: () => const UserLogExerciseScreen(),
      binding: UserLogExerciseBinding(),
    ),
  GetPage(name: providerChangePasswordScreen, page: () => const ProviderChangePasswordScreens()),
  GetPage(name: providerSubscriptionScreen, page: () => const ProviderSubscriptionScreen()),
  GetPage(name: providerCancelSubscriptionScreen, page: () => const ProviderCancelSubscriptionScreen()),
  GetPage(name: providerSubscriptionCancelReasonScreen, page: () => const ProviderSubscriptionCancelReasonScreen()),
  GetPage(name: providerSubscriptionCancelFeedbackScreen, page: () => const ProviderSubscriptionCancelFeedbackScreen()),
  GetPage(name: providerSubscriptionCancelSuccessScreen, page: () => const ProviderSubscriptionCancelSuccessScreen()),
  GetPage(
    name: clientDetailsScreen,
    page: () => const ClientDetailsScreen(),
    binding: ClientDetailsBinding(),
  ),
  ];
}
