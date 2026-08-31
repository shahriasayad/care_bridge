import 'package:get/get.dart';
import 'package:care_bridge/core/const/image_path.dart';
import 'package:care_bridge/features/role/user/user_appointments/model/user_appointment_model.dart';

class UserAppointmentsController extends GetxController {
  final searchQuery = ''.obs;
  final selectedFilterIndex = 0.obs;

  final appointments = <UserAppointmentModel>[
    const UserAppointmentModel(
      id: '1',
      doctorName: 'Dr. Sarah Chen',
      doctorAvatar: ImagePath.porfile3,
      service: 'General Consultation',
      time: '10:00',
      date: 'Sunday, January 1',
      status: 'Upcoming',
      price: 48.0,
    ),
    const UserAppointmentModel(
      id: '2',
      doctorName: 'Dr. Sarah Chen',
      doctorAvatar: ImagePath.porfile3,
      service: 'General Consultation',
      time: '10:00',
      date: 'Sunday, January 1',
      status: 'Completed',
      price: 48.0,
    ),
    const UserAppointmentModel(
      id: '3',
      doctorName: 'Dr. Sarah Chen',
      doctorAvatar: ImagePath.porfile3,
      service: 'General Consultation',
      time: '10:00',
      date: 'Sunday, January 1',
      status: 'Canceled',
      price: 48.0,
    ),
  ].obs;

  List<UserAppointmentModel> get filteredAppointments {
    List<UserAppointmentModel> list = appointments;

    if (searchQuery.value.isNotEmpty) {
      list = list
          .where((a) =>
              a.doctorName.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
              a.service.toLowerCase().contains(searchQuery.value.toLowerCase()))
          .toList();
    }

    if (selectedFilterIndex.value == 1) {
      list = list.where((a) => a.status.toLowerCase() == 'upcoming').toList();
    } else if (selectedFilterIndex.value == 2) {
      list = list.where((a) => a.status.toLowerCase() == 'completed').toList();
    }

    return list;
  }

  int get upcomingCount =>
      appointments.where((a) => a.status.toLowerCase() == 'upcoming').length;

  int get completedCount =>
      appointments.where((a) => a.status.toLowerCase() == 'completed').length;

  void selectFilter(int index) {
    selectedFilterIndex.value = index;
  }

  void onSearchChanged(String val) {
    searchQuery.value = val;
  }

  void rescheduleAppointment(UserAppointmentModel appointment) {
    Get.snackbar(
      'Reschedule',
      'Rescheduling with ${appointment.doctorName} is coming soon!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void messageDoctor(UserAppointmentModel appointment) {
    Get.snackbar(
      'Message',
      'Messaging ${appointment.doctorName} is coming soon!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void cancelAppointment(UserAppointmentModel appointment) {
    Get.snackbar(
      'Cancel',
      'Cancelling ${appointment.doctorName} consultation is coming soon!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
