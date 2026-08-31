import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:care_bridge/core/const/image_path.dart';
import 'package:care_bridge/features/role/provider/message/message_details/model/message_details_model.dart';

class MessageDetailsController extends GetxController {
  final RxList<MessageDetailsModel> messages = <MessageDetailsModel>[].obs;
  final RxBool isLoading = true.obs;
  final messageTextController = TextEditingController();
  final scrollController = ScrollController();

  final _imagePicker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    _loadMessages();
  }

  @override
  void onClose() {
    messageTextController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  Future<void> _loadMessages() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 300));
    messages.assignAll(_mockMessages());
    isLoading.value = false;
    _scrollToBottom();
  }

  void sendMessage() {
    final text = messageTextController.text.trim();
    if (text.isEmpty) return;

    final newMsg = MessageDetailsModel(
      id: 'msg_${DateTime.now().millisecondsSinceEpoch}',
      senderId: 'provider',
      text: text,
      timestamp: DateTime.now(),
      isSentByMe: true,
    );

    messages.add(newMsg);
    messageTextController.clear();
    _scrollToBottom();
  }

  Future<void> sendImageMessage() async {
    final XFile? picked = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (picked == null) return;

    final newMsg = MessageDetailsModel(
      id: 'msg_${DateTime.now().millisecondsSinceEpoch}',
      senderId: 'provider',
      imageFilePath: picked.path,
      timestamp: DateTime.now(),
      isSentByMe: true,
    );

    messages.add(newMsg);
    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  List<MessageDetailsModel> _mockMessages() => [
    MessageDetailsModel(
      id: 'msg_1',
      senderId: 'client',
      text: 'Hi How are your',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      isSentByMe: false,
    ),
    MessageDetailsModel(
      id: 'msg_2',
      senderId: 'provider',
      text: 'Hi How are your',
      timestamp: DateTime.now().subtract(const Duration(minutes: 4)),
      isSentByMe: true,
    ),
    MessageDetailsModel(
      id: 'msg_3',
      senderId: 'provider',
      imageUrl: ImagePath.attendanceCalendar,
      timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
      isSentByMe: true,
    ),
  ];
}
