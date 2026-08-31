import 'package:get/get.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/provider/message/message_list/model/provider_message_model.dart';

import 'package:care_bridge/features/role/provider/message/message_details/screen/message_details_screen.dart';

class ProviderMessageController extends GetxController {
  final RxList<ProviderMessageModel> conversations =
      <ProviderMessageModel>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _loadConversations();
  }

  Future<void> _loadConversations() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 300));
    conversations.assignAll(_mockData());
    isLoading.value = false;
  }

  Future<void> refreshConversations() => _loadConversations();

  void onConversationTap(ProviderMessageModel message) {
    Get.to(
      () => MessageDetailsScreen(
        userName: message.senderName,
        userAvatar: message.avatarUrl ?? IconPath.user,
      ),
    );
  }

  List<ProviderMessageModel> _mockData() => [
    const ProviderMessageModel(
      id: 'msg_1',
      senderName: 'Alex John',
      lastMessage: 'How are you',
      time: '12:00 PM',
      avatarUrl: IconPath.user,
    ),
    const ProviderMessageModel(
      id: 'msg_2',
      senderName: 'Alex John',
      lastMessage: 'How are youHow are you',
      time: '11:45 AM',
      avatarUrl: IconPath.user,
    ),
    const ProviderMessageModel(
      id: 'msg_3',
      senderName: 'Alex John',
      lastMessage: 'How are you',
      time: '11:30 AM',
      avatarUrl: IconPath.user,
    ),
    const ProviderMessageModel(
      id: 'msg_4',
      senderName: 'Alex John',
      lastMessage: 'How are you',
      time: '11:15 AM',
      avatarUrl: IconPath.user,
    ),
    const ProviderMessageModel(
      id: 'msg_5',
      senderName: 'Alex John',
      lastMessage: 'How are you',
      time: '11:00 AM',
      avatarUrl: IconPath.user,
    ),
    const ProviderMessageModel(
      id: 'msg_6',
      senderName: 'Alex John',
      lastMessage: 'How are you',
      time: '10:45 AM',
      avatarUrl: IconPath.user,
    ),
    const ProviderMessageModel(
      id: 'msg_7',
      senderName: 'Alex John',
      lastMessage: 'How are you',
      time: '10:30 AM',
      avatarUrl: IconPath.user,
    ),
    const ProviderMessageModel(
      id: 'msg_8',
      senderName: 'Alex John',
      lastMessage: 'How are you',
      time: '10:15 AM',
      avatarUrl: IconPath.user,
    ),
  ];
}
