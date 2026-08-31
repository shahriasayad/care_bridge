// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:care_bridge/core/common/widgets/custom_button.dart';
// import 'package:care_bridge/core/const/app_colors.dart';
// import 'package:care_bridge/core/const/global_text_style.dart';
// import 'package:care_bridge/features/role/user/user_log_exercise/controller/user_log_exercise_controller.dart';

// class UserLogExerciseScreen extends StatelessWidget {
//   const UserLogExerciseScreen({super.key});

//   String _formatDate(DateTime dt) {
//     final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
//     return "${months[dt.month - 1]} ${dt.day}, ${dt.year}";
//   }

//   String _formatTime(TimeOfDay time) {
//     final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
//     final min = time.minute.toString().padLeft(2, '0');
//     final period = time.period == DayPeriod.am ? 'AM' : 'PM';
//     return "$hour:$min $period";
//   }

//   Widget _buildSectionHeader(String number, String title, {Widget? trailing}) {
//     return Row(
//       children: [
//         Container(
//           width: 24,
//           height: 24,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Color(0xFF384A3E),
//           ),
//           child: Center(
//             child: Text(
//               number,
//               style: const TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(width: 8),
//         Expanded(
//           child: Text(
//             title,
//             style: getTextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               color: AppColors.primaryTextColor,
//             ),
//           ),
//         ),
//         if (trailing != null) trailing,
//       ],
//     );
//   }

//   Widget _buildCategoryButton(
//     String name,
//     IconData icon,
//     bool isSelected,
//     VoidCallback onTap,
//   ) {
//     final activeColor = const Color(0xFF384A3E);
//     final inactiveColor = const Color(0xFF8C8075);

//     return Expanded(
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 12),
//           decoration: BoxDecoration(
//             color: isSelected ? const Color(0xFFF0F4F1) : Colors.white,
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(
//               color: isSelected ? activeColor : const Color(0xFFE5DFD9),
//               width: isSelected ? 2 : 1,
//             ),
//           ),
//           child: Column(
//             children: [
//               Icon(
//                 icon,
//                 color: isSelected ? activeColor : inactiveColor,
//                 size: 24,
//               ),
//               const SizedBox(height: 6),
//               Text(
//                 name,
//                 style: getTextStyle(
//                   fontSize: 13,
//                   fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
//                   color: isSelected ? activeColor : inactiveColor,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailRow({
//     required IconData icon,
//     required String label,
//     required Widget valueWidget,
//     VoidCallback? onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 12.0),
//         child: Row(
//           children: [
//             Icon(icon, color: AppColors.secondaryTextColor, size: 20),
//             const SizedBox(width: 12),
//             Text(
//               label,
//               style: getTextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.secondaryTextColor,
//               ),
//             ),
//             const Spacer(),
//             valueWidget,
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(UserLogExerciseController());

//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Top grovr Branding Bar
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//               child: Row(
//                 children: [
//                   Text(
//                     'grovr',
//                     style: getTextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w800,
//                       color: AppColors.primaryTextColor,
//                     ),
//                   ),
//                   const Spacer(),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(color: const Color(0xFFE5DFD9)),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         const Icon(Icons.schedule, size: 14, color: AppColors.primaryTextColor),
//                         const SizedBox(width: 4),
//                         Text(
//                           '12',
//                           style: getTextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w600,
//                             color: AppColors.primaryTextColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   const CircleAvatar(
//                     radius: 18,
//                     backgroundImage: AssetImage('assets/images/profile6.jpg'),
//                   ),
//                 ],
//               ),
//             ),

//             // Main scrollable content
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     // Title and workout illustration header
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Log Exercise',
//                                 style: getTextStyle(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                   color: AppColors.primaryTextColor,
//                                 ),
//                               ),
//                               const SizedBox(height: 6),
//                               Text(
//                                 'Track your workouts and let Grovr AI turning your effort into insights.',
//                                 style: getTextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColors.secondaryTextColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         // Workout Vector Stack Illustration
//                         Container(
//                           width: 80,
//                           height: 80,
//                           decoration: const BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Color(0xFFE6F0EA),
//                           ),
//                           child: Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               Positioned(
//                                 top: 12,
//                                 right: 12,
//                                 child: Icon(
//                                   Icons.water_drop_outlined,
//                                   size: 20,
//                                   color: Colors.blue.withOpacity(0.6),
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 12,
//                                 left: 12,
//                                 child: Icon(
//                                   Icons.spa_outlined,
//                                   size: 20,
//                                   color: Colors.green.withOpacity(0.6),
//                                 ),
//                               ),
//                               const Icon(
//                                 Icons.fitness_center,
//                                 size: 36,
//                                 color: Color(0xFF384A3E),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 24),

//                     // SECTION 1: What did you do?
//                     Container(
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFFDFBF7),
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: const Color(0xFFF3EFE9)),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           _buildSectionHeader('1', 'What did you do?'),
//                           const SizedBox(height: 16),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: Container(
//                                   height: 44,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(12),
//                                     border: Border.all(color: const Color(0xFFE5DFD9)),
//                                   ),
//                                   child: const TextField(
//                                     decoration: InputDecoration(
//                                       hintText: 'Search...',
//                                       hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
//                                       prefixIcon: Icon(Icons.search, size: 20, color: Colors.grey),
//                                       border: InputBorder.none,
//                                       contentPadding: EdgeInsets.symmetric(vertical: 10),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 8),
//                               Container(
//                                 height: 44,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(12),
//                                   border: Border.all(color: const Color(0xFFE5DFD9)),
//                                 ),
//                                 child: TextButton.icon(
//                                   onPressed: () {},
//                                   icon: const Icon(Icons.add, size: 16, color: AppColors.primaryTextColor),
//                                   label: Text(
//                                     'Custom',
//                                     style: getTextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w600,
//                                       color: AppColors.primaryTextColor,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 16),

//                           // Workout Category Buttons
//                           Obx(() {
//                             final selected = controller.selectedCategory.value;
//                             return Row(
//                               children: [
//                                 _buildCategoryButton(
//                                   'Strength',
//                                   Icons.fitness_center,
//                                   selected == 'Strength',
//                                   () => controller.selectCategory('Strength'),
//                                 ),
//                                 const SizedBox(width: 8),
//                                 _buildCategoryButton(
//                                   'Cardio',
//                                   Icons.directions_run,
//                                   selected == 'Cardio',
//                                   () => controller.selectCategory('Cardio'),
//                                 ),
//                                 const SizedBox(width: 8),
//                                 _buildCategoryButton(
//                                   'Yoga',
//                                   Icons.self_improvement,
//                                   selected == 'Yoga',
//                                   () => controller.selectCategory('Yoga'),
//                                 ),
//                                 const SizedBox(width: 8),
//                                 _buildCategoryButton(
//                                   'Pilates',
//                                   Icons.accessibility_new,
//                                   selected == 'Pilates',
//                                   () => controller.selectCategory('Pilates'),
//                                 ),
//                               ],
//                             );
//                           }),
//                           const SizedBox(height: 16),

//                           // Describe workout textarea
//                           Container(
//                             height: 100,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(color: const Color(0xFFE5DFD9)),
//                             ),
//                             child: TextField(
//                               controller: controller.descriptionController,
//                               maxLines: 4,
//                               maxLength: 500,
//                               buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
//                               decoration: const InputDecoration(
//                                 hintText: 'Describe your workout...',
//                                 hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
//                                 contentPadding: EdgeInsets.all(12),
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: Obx(() {
//                               return Text(
//                                 '${controller.descriptionLength.value}/500',
//                                 style: getTextStyle(
//                                   fontSize: 12,
//                                   color: AppColors.secondaryTextColor,
//                                 ),
//                               );
//                             }),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 16),

//                     // SECTION 2: How long?
//                     Container(
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFFDFBF7),
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: const Color(0xFFF3EFE9)),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           _buildSectionHeader('2', 'How long?'),
//                           const SizedBox(height: 16),

//                           // Dynamic HR : MIN : SEC Input Box
//                           Container(
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFF6F3ED),
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     // Hours
//                                     SizedBox(
//                                       width: 44,
//                                       child: TextField(
//                                         keyboardType: TextInputType.number,
//                                         textAlign: TextAlign.center,
//                                         style: getTextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                                         decoration: const InputDecoration(
//                                           hintText: '- -',
//                                           border: InputBorder.none,
//                                         ),
//                                         onChanged: (val) {
//                                           controller.hours.value = int.tryParse(val) ?? 0;
//                                         },
//                                       ),
//                                     ),
//                                     Text(':', style: getTextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//                                     // Minutes
//                                     SizedBox(
//                                       width: 44,
//                                       child: TextField(
//                                         keyboardType: TextInputType.number,
//                                         textAlign: TextAlign.center,
//                                         controller: TextEditingController(text: '45'),
//                                         style: getTextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                                         decoration: const InputDecoration(
//                                           border: InputBorder.none,
//                                         ),
//                                         onChanged: (val) {
//                                           controller.minutes.value = int.tryParse(val) ?? 45;
//                                         },
//                                       ),
//                                     ),
//                                     Text(':', style: getTextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//                                     // Seconds
//                                     SizedBox(
//                                       width: 44,
//                                       child: TextField(
//                                         keyboardType: TextInputType.number,
//                                         textAlign: TextAlign.center,
//                                         controller: TextEditingController(text: '00'),
//                                         style: getTextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                                         decoration: const InputDecoration(
//                                           border: InputBorder.none,
//                                         ),
//                                         onChanged: (val) {
//                                           controller.seconds.value = int.tryParse(val) ?? 0;
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     SizedBox(width: 44, child: Center(child: Text('HR', style: getTextStyle(fontSize: 11, color: AppColors.secondaryTextColor)))),
//                                     const SizedBox(width: 8),
//                                     SizedBox(width: 44, child: Center(child: Text('MIN', style: getTextStyle(fontSize: 11, color: AppColors.secondaryTextColor)))),
//                                     const SizedBox(width: 8),
//                                     SizedBox(width: 44, child: Center(child: Text('SEC', style: getTextStyle(fontSize: 11, color: AppColors.secondaryTextColor)))),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 16),

//                     // SECTION 3: How intense?
//                     Container(
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFFDFBF7),
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: const Color(0xFFF3EFE9)),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           _buildSectionHeader(
//                             '3',
//                             'How intense?',
//                             trailing: const Icon(Icons.info_outline, size: 18, color: Colors.grey),
//                           ),
//                           const SizedBox(height: 16),

//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Perceived Effort',
//                                     style: getTextStyle(fontSize: 13, fontWeight: FontWeight.w500),
//                                   ),
//                                   Text(
//                                     '(RPE Scale)',
//                                     style: getTextStyle(fontSize: 11, color: AppColors.secondaryTextColor),
//                                   ),
//                                 ],
//                               ),
//                               Obx(() {
//                                 return Text(
//                                   '${controller.intensity.value.round()} / 10',
//                                   style: getTextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                                 );
//                               }),
//                             ],
//                           ),
//                           const SizedBox(height: 16),

//                           // Custom Slider
//                           Obx(() {
//                             return SliderTheme(
//                               data: SliderTheme.of(context).copyWith(
//                                 activeTrackColor: const Color(0xFF384A3E),
//                                 inactiveTrackColor: const Color(0xFFE5DFD9),
//                                 thumbColor: Colors.white,
//                                 overlayColor: const Color(0xFF384A3E).withOpacity(0.1),
//                                 valueIndicatorColor: const Color(0xFF384A3E),
//                                 trackHeight: 6,
//                               ),
//                               child: Slider(
//                                 value: controller.intensity.value,
//                                 min: 1,
//                                 max: 10,
//                                 divisions: 9,
//                                 onChanged: controller.updateIntensity,
//                               ),
//                             );
//                           }),

//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text('Very Easy', style: getTextStyle(fontSize: 11, color: AppColors.secondaryTextColor)),
//                                 Text('Moderate', style: getTextStyle(fontSize: 11, color: AppColors.secondaryTextColor)),
//                                 Text('Max Effort', style: getTextStyle(fontSize: 11, color: AppColors.secondaryTextColor)),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 16),

//                     // SECTION 4: Add details (optional)
//                     Container(
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFFDFBF7),
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: const Color(0xFFF3EFE9)),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           _buildSectionHeader('4', 'Add details (optional)'),
//                           const SizedBox(height: 8),

//                           // Date picker row
//                           Obx(() {
//                             final dateStr = _formatDate(controller.selectedDate.value);
//                             final isToday = controller.selectedDate.value.year == 2024 &&
//                                 controller.selectedDate.value.month == 5 &&
//                                 controller.selectedDate.value.day == 20;
//                             return _buildDetailRow(
//                               icon: Icons.calendar_today_outlined,
//                               label: 'Date',
//                               onTap: () => controller.selectDate(context),
//                               valueWidget: Row(
//                                 children: [
//                                   Text(
//                                     '${isToday ? 'Today, ' : ''}$dateStr',
//                                     style: getTextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                                   ),
//                                   const Icon(Icons.keyboard_arrow_down, size: 20),
//                                 ],
//                               ),
//                             );
//                           }),
//                           const Divider(height: 1, color: Color(0xFFF3EFE9)),

//                           // Time picker row
//                           Obx(() {
//                             final time = controller.selectedTime.value;
//                             final timeStr = _formatTime(time);
//                             return _buildDetailRow(
//                               icon: Icons.access_time,
//                               label: 'Time',
//                               onTap: () => controller.selectTime(context),
//                               valueWidget: Row(
//                                 children: [
//                                   Text(
//                                     timeStr,
//                                     style: getTextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                                   ),
//                                   const Icon(Icons.keyboard_arrow_down, size: 20),
//                                 ],
//                               ),
//                             );
//                           }),
//                           const Divider(height: 1, color: Color(0xFFF3EFE9)),

//                           // Location selector dropdown
//                           Obx(() {
//                             return _buildDetailRow(
//                               icon: Icons.location_on_outlined,
//                               label: 'Location',
//                               valueWidget: DropdownButton<String>(
//                                 value: controller.selectedLocation.value,
//                                 underline: const SizedBox(),
//                                 icon: const Icon(Icons.keyboard_arrow_down, size: 20, color: Colors.black),
//                                 style: getTextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
//                                 items: controller.locations.map((String loc) {
//                                   return DropdownMenuItem<String>(
//                                     value: loc,
//                                     child: Text(loc),
//                                   );
//                                 }).toList(),
//                                 onChanged: (val) {
//                                   if (val != null) controller.selectLocation(val);
//                                 },
//                               ),
//                             );
//                           }),
//                           const Divider(height: 1, color: Color(0xFFF3EFE9)),

//                           // Tags selector row with chip list
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 8.0),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Padding(
//                                   padding: EdgeInsets.only(top: 8.0),
//                                   child: Icon(Icons.local_offer_outlined, color: AppColors.secondaryTextColor, size: 20),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 8.0),
//                                   child: Text(
//                                     'Tags',
//                                     style: getTextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w500,
//                                       color: AppColors.secondaryTextColor,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Expanded(
//                                   child: Wrap(
//                                     spacing: 6,
//                                     runSpacing: 6,
//                                     children: [
//                                       Obx(() {
//                                         return Wrap(
//                                           spacing: 6,
//                                           runSpacing: 6,
//                                           children: controller.tags.map((tag) {
//                                             return Chip(
//                                               label: Text(tag, style: const TextStyle(fontSize: 12)),
//                                               backgroundColor: const Color(0xFFE6F0EA),
//                                               deleteIcon: const Icon(Icons.close, size: 14),
//                                               onDeleted: () => controller.removeTag(tag),
//                                               padding: EdgeInsets.zero,
//                                               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                                             );
//                                           }).toList(),
//                                         );
//                                       }),
//                                       GestureDetector(
//                                         onTap: () {
//                                           Get.defaultDialog(
//                                             title: 'Add Tag',
//                                             content: TextField(
//                                               decoration: const InputDecoration(hintText: 'Enter tag name...'),
//                                               onSubmitted: (val) {
//                                                 controller.addTag(val);
//                                                 Get.back();
//                                               },
//                                             ),
//                                             textConfirm: 'Add',
//                                             confirmTextColor: Colors.white,
//                                             buttonColor: const Color(0xffB07B56),
//                                             onConfirm: () {
//                                               // Handled onSubmitted
//                                             },
//                                           );
//                                         },
//                                         child: Container(
//                                           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                                           decoration: BoxDecoration(
//                                             border: Border.all(color: const Color(0xFFE5DFD9)),
//                                             borderRadius: BorderRadius.circular(12),
//                                           ),
//                                           child: const Row(
//                                             mainAxisSize: MainAxisSize.min,
//                                             children: [
//                                               Icon(Icons.add, size: 14),
//                                               Text('Add', style: TextStyle(fontSize: 12)),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const Divider(height: 1, color: Color(0xFFF3EFE9)),

//                           // Notes row
//                           _buildDetailRow(
//                             icon: Icons.description_outlined,
//                             label: 'Notes',
//                             valueWidget: Expanded(
//                               child: TextField(
//                                 controller: controller.notesController,
//                                 textAlign: TextAlign.right,
//                                 style: getTextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                                 decoration: const InputDecoration(
//                                   hintText: 'How did it go? Anything else to note?',
//                                   hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
//                                   border: InputBorder.none,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 16),

//                     // SECTION 5: AI Workout Summary
//                     Container(
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFFDFBF7),
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: const Color(0xFFF3EFE9)),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           _buildSectionHeader(
//                             '5',
//                             'AI Workout Summary',
//                             trailing: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//                               decoration: BoxDecoration(
//                                 color: Colors.blue.withOpacity(0.08),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   const Icon(Icons.auto_awesome, size: 10, color: Colors.blue),
//                                   const SizedBox(width: 4),
//                                   Text(
//                                     'Powered by Grovr AI',
//                                     style: getTextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.blue),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16),

//                           Row(
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   'Grovr AI will analyze your workout and turn it into personalized insights to help you improve.',
//                                   style: getTextStyle(fontSize: 13, color: AppColors.secondaryTextColor),
//                                 ),
//                               ),
//                               const SizedBox(width: 12),
//                               // Brain and Dumbbell Illustration overlay
//                               Container(
//                                 width: 60,
//                                 height: 60,
//                                 decoration: const BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Color(0xFFEAE6E1),
//                                 ),
//                                 child: const Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     Positioned(
//                                       top: 8,
//                                       right: 8,
//                                       child: Icon(Icons.auto_awesome, size: 14, color: Color(0xffB07B56)),
//                                     ),
//                                     Icon(Icons.psychology, size: 36, color: Color(0xFF384A3E)),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 16),

//                           // AI summary display / button
//                           Obx(() {
//                             if (controller.isGeneratingAiSummary.value) {
//                               return const Center(
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(vertical: 16.0),
//                                   child: CircularProgressIndicator(color: Color(0xffB07B56)),
//                                 ),
//                               );
//                             }

//                             if (controller.aiSummaryText.value.isNotEmpty) {
//                               return Container(
//                                 margin: const EdgeInsets.only(top: 8),
//                                 padding: const EdgeInsets.all(14),
//                                 decoration: BoxDecoration(
//                                   color: const Color(0xFFE6F0EA).withOpacity(0.5),
//                                   borderRadius: BorderRadius.circular(12),
//                                   border: Border.all(color: const Color(0xFFE5DFD9)),
//                                 ),
//                                 child: Text(
//                                   controller.aiSummaryText.value,
//                                   style: getTextStyle(
//                                     fontSize: 13,
//                                     color: AppColors.primaryTextColor,
//                                   ).copyWith(height: 1.4),
//                                 ),
//                               );
//                             }

//                             return Center(
//                               child: TextButton.icon(
//                                 style: TextButton.styleFrom(
//                                   backgroundColor: const Color(0xffB07B56),
//                                   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                                 ),
//                                 onPressed: controller.generateAiSummary,
//                                 icon: const Icon(Icons.auto_awesome, size: 16, color: Colors.white),
//                                 label: const Text(
//                                   'Generate AI Summary',
//                                   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
//                                 ),
//                               ),
//                             );
//                           }),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                   ],
//                 ),
//               ),
//             ),

//             // Log Exercise Button
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
//               child: CustomButton(
//                 text: 'Log Exercise',
//                 onTap: controller.logExercise,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/user/user_log_exercise/controller/user_log_exercise_controller.dart';

class PillSliderThumbShape extends SliderComponentShape {
  final double thumbWidth;
  final double thumbHeight;
  final double radius;

  const PillSliderThumbShape({
    this.thumbWidth = 36.0,
    this.thumbHeight = 16.0,
    this.radius = 8.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbWidth, thumbHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;
    final paint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = const Color(0xFF384A3E)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final rect = Rect.fromCenter(
      center: center,
      width: thumbWidth,
      height: thumbHeight,
    );
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    canvas.drawRRect(rrect, paint);
    canvas.drawRRect(rrect, borderPaint);
  }
}

class UserLogExerciseScreen extends StatelessWidget {
  const UserLogExerciseScreen({super.key});

  String _formatDate(DateTime dt) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return "${months[dt.month - 1]} ${dt.day}, ${dt.year}";
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final min = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return "$hour:$min $period";
  }

  Widget _buildSectionHeader(String number, String title, {Widget? trailing}) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF384A3E),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: getTextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF384A3E),
            ),
          ),
        ),
        if (trailing != null) trailing,
      ],
    );
  }

  Widget _buildCategoryButton(
    String name,
    IconData icon,
    bool isSelected,
    VoidCallback onTap,
  ) {
    final activeColor = const Color(0xFF384A3E);
    final inactiveColor = const Color(0xFF8C8075);
    final activeBgColor = const Color(0xFFE6F0EA);

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? activeBgColor : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? activeColor : const Color(0xFFE5DFD9),
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? activeColor : inactiveColor,
                size: 24,
              ),
              const SizedBox(height: 6),
              Text(
                name,
                style: getTextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? activeColor : inactiveColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required Widget valueWidget,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF8C8075), size: 20),
            const SizedBox(width: 12),
            Text(
              label,
              style: getTextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF8C8075),
              ),
            ),
            const Spacer(),
            valueWidget,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserLogExerciseController());
    const terracottaColor = Color(0xFFB07B56);
    const cardBgColor = Color(0xFFF8F3EB);
    const pageBgColor = Color(0xFFFCFAF7);

    return Scaffold(
      backgroundColor: pageBgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top grovr Branding Bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: Row(
                children: [
                  Text(
                    'grovr',
                    style: getTextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF384A3E),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: const Color(0xFFE5DFD9)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.schedule,
                          size: 14,
                          color: Color(0xFF384A3E),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '12',
                          style: getTextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF384A3E),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFE5DFD9),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'S',
                      style: getTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF384A3E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Main scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Title and illustration header
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.back(),
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                          color: const Color(0xFFE5DFD9),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_back_ios_new,
                                        size: 12,
                                        color: Color(0xFF384A3E),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      'Log Exercise',
                                      style: getTextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF384A3E),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.only(left: 38.0),
                                child: Text(
                                  'Track your workouts and let Grovr AI turning your effort into insights.',
                                  style: getTextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF8C8075),
                                  ).copyWith(height: 1.3),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Workout Illustration from IconPath
                        Image.asset(
                          IconPath.logIcon,
                          width: 110,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // SECTION 1: What did you do?
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFFFAF2EC),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFF2ECE4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildSectionHeader('1', 'What did you do?'),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: const Color(0xFFE5DFD9),
                                    ),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search...',
                                      hintStyle: TextStyle(
                                        color: Color(0xFFB5AD9C),
                                        fontSize: 14,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        size: 20,
                                        color: Color(0xFF8C8075),
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: const Color(0xFFE5DFD9),
                                  ),
                                ),
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    size: 16,
                                    color: Color(0xFF384A3E),
                                  ),
                                  label: Text(
                                    'Custom',
                                    style: getTextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF384A3E),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Workout Category Buttons
                          Obx(() {
                            final selected = controller.selectedCategory.value;
                            return Row(
                              children: [
                                _buildCategoryButton(
                                  'Strength',
                                  Icons.fitness_center,
                                  selected == 'Strength',
                                  () => controller.selectCategory('Strength'),
                                ),
                                const SizedBox(width: 8),
                                _buildCategoryButton(
                                  'Cardio',
                                  Icons.directions_run,
                                  selected == 'Cardio',
                                  () => controller.selectCategory('Cardio'),
                                ),
                                const SizedBox(width: 8),
                                _buildCategoryButton(
                                  'Yoga',
                                  Icons.spa_outlined,
                                  selected == 'Yoga',
                                  () => controller.selectCategory('Yoga'),
                                ),
                                const SizedBox(width: 8),
                                _buildCategoryButton(
                                  'Pilates',
                                  Icons.accessibility_new,
                                  selected == 'Pilates',
                                  () => controller.selectCategory('Pilates'),
                                ),
                              ],
                            );
                          }),
                          const SizedBox(height: 16),
                          // Describe workout textarea
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFE5DFD9),
                              ),
                            ),
                            child: TextField(
                              controller: controller.descriptionController,
                              maxLines: 4,
                              maxLength: 500,
                              buildCounter:
                                  (
                                    context, {
                                    required currentLength,
                                    required isFocused,
                                    maxLength,
                                  }) => null,
                              decoration: const InputDecoration(
                                hintText: 'Describe your workout...',
                                hintStyle: TextStyle(
                                  color: Color(0xFFB5AD9C),
                                  fontSize: 14,
                                ),
                                contentPadding: EdgeInsets.all(12),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Obx(() {
                              return Text(
                                '${controller.descriptionLength.value}/500',
                                style: getTextStyle(
                                  fontSize: 12,
                                  color: const Color(0xFF8C8075),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),

                    // SECTION 2: How long?
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFFFAF2EC),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFF2ECE4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildSectionHeader('2', 'How long?'),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0F4F1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Hours
                                    SizedBox(
                                      width: 44,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        style: getTextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF384A3E),
                                        ),
                                        decoration: const InputDecoration(
                                          hintText: '- -',
                                          hintStyle: TextStyle(
                                            color: Color(0xFF8C8075),
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (val) {
                                          controller.hours.value =
                                              int.tryParse(val) ?? 0;
                                        },
                                      ),
                                    ),
                                    Text(
                                      ':',
                                      style: getTextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF384A3E),
                                      ),
                                    ),
                                    // Minutes
                                    SizedBox(
                                      width: 44,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        controller: TextEditingController(
                                          text: '45',
                                        ),
                                        style: getTextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF384A3E),
                                        ),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (val) {
                                          controller.minutes.value =
                                              int.tryParse(val) ?? 45;
                                        },
                                      ),
                                    ),
                                    Text(
                                      ':',
                                      style: getTextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF384A3E),
                                      ),
                                    ),
                                    // Seconds
                                    SizedBox(
                                      width: 44,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        controller: TextEditingController(
                                          text: '00',
                                        ),
                                        style: getTextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF384A3E),
                                        ),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (val) {
                                          controller.seconds.value =
                                              int.tryParse(val) ?? 0;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 44,
                                      child: Center(
                                        child: Text(
                                          'HR',
                                          style: getTextStyle(
                                            fontSize: 11,
                                            color: const Color(0xFF8C8075),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    SizedBox(
                                      width: 44,
                                      child: Center(
                                        child: Text(
                                          'MIN',
                                          style: getTextStyle(
                                            fontSize: 11,
                                            color: const Color(0xFF8C8075),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    SizedBox(
                                      width: 44,
                                      child: Center(
                                        child: Text(
                                          'SEC',
                                          style: getTextStyle(
                                            fontSize: 11,
                                            color: const Color(0xFF8C8075),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // SECTION 3: How intense?
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFFFAF2EC),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFF2ECE4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildSectionHeader(
                            '3',
                            'How intense?',
                            trailing: const Icon(
                              Icons.help_outline,
                              size: 18,
                              color: Color(0xFF8C8075),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Perceived Effort',
                                    style: getTextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF384A3E),
                                    ),
                                  ),
                                  Text(
                                    '(RPE Scale)',
                                    style: getTextStyle(
                                      fontSize: 11,
                                      color: const Color(0xFF8C8075),
                                    ),
                                  ),
                                ],
                              ),
                              Obx(() {
                                return Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      '${controller.intensity.value.round()}',
                                      style: getTextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF384A3E),
                                      ),
                                    ),
                                    Text(
                                      ' / 10',
                                      style: getTextStyle(
                                        fontSize: 13,
                                        color: const Color(0xFF8C8075),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ],
                          ),
                          const SizedBox(height: 12),
                          // Custom Slider with pill thumb shape
                          Obx(() {
                            return SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: const Color(0xFF384A3E),
                                inactiveTrackColor: const Color(0xFFE5DFD9),
                                thumbColor: Colors.white,
                                overlayColor: const Color(
                                  0xFF384A3E,
                                ).withOpacity(0.1),
                                trackHeight: 6,
                                thumbShape: const PillSliderThumbShape(),
                              ),
                              child: Slider(
                                value: controller.intensity.value,
                                min: 1,
                                max: 10,
                                divisions: 9,
                                onChanged: controller.updateIntensity,
                              ),
                            );
                          }),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Very Easy',
                                  style: getTextStyle(
                                    fontSize: 11,
                                    color: const Color(0xFF8C8075),
                                  ),
                                ),
                                Text(
                                  'Moderate',
                                  style: getTextStyle(
                                    fontSize: 11,
                                    color: const Color(0xFF8C8075),
                                  ),
                                ),
                                Text(
                                  'Max Effort',
                                  style: getTextStyle(
                                    fontSize: 11,
                                    color: const Color(0xFF8C8075),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // SECTION 4: Add details (optional)
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFFFAF2EC),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFF2ECE4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildSectionHeader('4', 'Add details (optional)'),
                          const SizedBox(height: 8),

                          // Date picker row
                          Obx(() {
                            final dateStr = _formatDate(
                              controller.selectedDate.value,
                            );
                            final isToday =
                                controller.selectedDate.value.year == 2024 &&
                                controller.selectedDate.value.month == 5 &&
                                controller.selectedDate.value.day == 20;
                            return _buildDetailRow(
                              icon: Icons.calendar_today_outlined,
                              label: 'Date',
                              onTap: () => controller.selectDate(context),
                              valueWidget: Row(
                                children: [
                                  Text(
                                    '${isToday ? 'Today, ' : ''}$dateStr',
                                    style: getTextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF384A3E),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 20,
                                    color: Color(0xFF384A3E),
                                  ),
                                ],
                              ),
                            );
                          }),
                          const Divider(height: 1, color: Color(0xFFF2ECE4)),

                          // Time picker row
                          Obx(() {
                            final time = controller.selectedTime.value;
                            final timeStr = _formatTime(time);
                            return _buildDetailRow(
                              icon: Icons.access_time,
                              label: 'Time',
                              onTap: () => controller.selectTime(context),
                              valueWidget: Row(
                                children: [
                                  Text(
                                    timeStr,
                                    style: getTextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF384A3E),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 20,
                                    color: Color(0xFF384A3E),
                                  ),
                                ],
                              ),
                            );
                          }),
                          const Divider(height: 1, color: Color(0xFFF2ECE4)),

                          // Location selector dropdown
                          Obx(() {
                            return _buildDetailRow(
                              icon: Icons.location_on_outlined,
                              label: 'Location',
                              valueWidget: DropdownButton<String>(
                                value: controller.selectedLocation.value,
                                underline: const SizedBox(),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 20,
                                  color: Color(0xFF384A3E),
                                ),
                                style: getTextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF384A3E),
                                ),
                                items: controller.locations.map((String loc) {
                                  return DropdownMenuItem<String>(
                                    value: loc,
                                    child: Text(loc),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  if (val != null)
                                    controller.selectLocation(val);
                                },
                              ),
                            );
                          }),
                          const Divider(height: 1, color: Color(0xFFF2ECE4)),

                          // Tags selector row with chip list
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Icon(
                                    Icons.local_offer_outlined,
                                    color: Color(0xFF8C8075),
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    'Tags',
                                    style: getTextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF8C8075),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Obx(() {
                                    return Wrap(
                                      spacing: 6,
                                      runSpacing: 6,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        ...controller.tags.map((tag) {
                                          return Chip(
                                            label: Text(
                                              tag,
                                              style: getTextStyle(
                                                fontSize: 12,
                                                color: const Color(0xFF384A3E),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            backgroundColor: const Color(
                                              0xFFE6F0EA,
                                            ),
                                            deleteIcon: const Icon(
                                              Icons.close,
                                              size: 12,
                                              color: Color(0xFF384A3E),
                                            ),
                                            onDeleted: () =>
                                                controller.removeTag(tag),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 4,
                                              vertical: 2,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              side: BorderSide.none,
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                          );
                                        }).toList(),
                                        GestureDetector(
                                          onTap: () {
                                            Get.defaultDialog(
                                              title: 'Add Tag',
                                              content: TextField(
                                                decoration:
                                                    const InputDecoration(
                                                      hintText:
                                                          'Enter tag name...',
                                                    ),
                                                onSubmitted: (val) {
                                                  controller.addTag(val);
                                                  Get.back();
                                                },
                                              ),
                                              textConfirm: 'Add',
                                              confirmTextColor: Colors.white,
                                              buttonColor: terracottaColor,
                                              onConfirm: () {
                                                // Handled onSubmitted
                                              },
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: const Color(0xFFE5DFD9),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: const Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 16,
                                              color: Color(0xFF384A3E),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                          const Divider(height: 1, color: Color(0xFFF2ECE4)),

                          // Notes row
                          _buildDetailRow(
                            icon: Icons.description_outlined,
                            label: 'Notes',
                            valueWidget: Expanded(
                              child: TextField(
                                controller: controller.notesController,
                                textAlign: TextAlign.right,
                                style: getTextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF384A3E),
                                ),
                                decoration: const InputDecoration(
                                  hintText:
                                      'How did it go? Anything else to note?',
                                  hintStyle: TextStyle(
                                    color: Color(0xFFB5AD9C),
                                    fontSize: 12,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // SECTION 5: AI Workout Summary
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 24),
                      decoration: BoxDecoration(
                        color: Color(0xFFFAF2EC),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFF2ECE4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildSectionHeader(
                            '5',
                            'AI Workout Summary',
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE5DFD9),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.auto_awesome,
                                    size: 10,
                                    color: Color(0xFF384A3E),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Powered by Grovr AI',
                                    style: getTextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF384A3E),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Grovr AI will analyze your workout and turn it into personalized insights to help you improve.',
                                  style: getTextStyle(
                                    fontSize: 13,
                                    color: const Color(0xFF8C8075),
                                  ).copyWith(height: 1.4),
                                ),
                              ),
                              const SizedBox(width: 12),
                              // Brain and Dumbbell Illustration overlay
                              Container(
                                width: 64,
                                height: 64,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFEAE6E1),
                                ),
                                child: const Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Icon(
                                      Icons.psychology_outlined,
                                      size: 38,
                                      color: Color(0xFF384A3E),
                                    ),
                                    Positioned(
                                      bottom: 6,
                                      right: 6,
                                      child: Icon(
                                        Icons.fitness_center,
                                        size: 20,
                                        color: Color(0xFF384A3E),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Icon(
                                        Icons.auto_awesome,
                                        size: 12,
                                        color: Color(0xFF384A3E),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // AI summary display / button
                          Obx(() {
                            if (controller.isGeneratingAiSummary.value) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  child: CircularProgressIndicator(
                                    color: terracottaColor,
                                  ),
                                ),
                              );
                            }

                            if (controller.aiSummaryText.value.isNotEmpty) {
                              return Container(
                                margin: const EdgeInsets.only(top: 8),
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xFFE6F0EA,
                                  ).withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: const Color(0xFFE5DFD9),
                                  ),
                                ),
                                child: Text(
                                  controller.aiSummaryText.value,
                                  style: getTextStyle(
                                    fontSize: 13,
                                    color: const Color(0xFF384A3E),
                                  ).copyWith(height: 1.4),
                                ),
                              );
                            }

                            return CustomButton(
                              text: 'Generate AI Summary',
                              onTap: controller.generateAiSummary,
                              backgroundColor: terracottaColor,
                            );
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Log Exercise Button
                    CustomButton(
                      text: 'Log Exercise',
                      onTap: controller.logExercise,
                      backgroundColor: terracottaColor,
                    ),
                    const SizedBox(
                      height: 110,
                    ), // Bottom padding for navbar clearance
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
