class UserAppointmentModel {
  final String id;
  final String doctorName;
  final String doctorAvatar;
  final String service;
  final String time;
  final String date;
  final String status;
  final double price;

  const UserAppointmentModel({
    required this.id,
    required this.doctorName,
    required this.doctorAvatar,
    required this.service,
    required this.time,
    required this.date,
    required this.status,
    required this.price,
  });
}
