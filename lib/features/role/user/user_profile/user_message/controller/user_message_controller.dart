import 'package:get/get.dart';
import 'package:care_bridge/features/role/user/user_profile/user_message/model/user_message_model.dart';

class UserMessageController extends GetxController {
  final RxList<UserMessageModel> conversations = <UserMessageModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxString searchQuery = ''.obs;

  List<UserMessageModel> get filtered => searchQuery.isEmpty
      ? conversations
      : conversations
          .where((c) => c.senderName.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();

  @override
  void onInit() {
    super.onInit();
    _loadConversations();
  }

  Future<void> _loadConversations() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 600)); // simulate API
    conversations.assignAll(_mockData());
    isLoading.value = false;
  }

  Future<void> refresh() => _loadConversations();

  void onConversationTap(UserMessageModel message) =>
      Get.toNamed('/chat', arguments: message);

  void onSearch(String query) => searchQuery.value = query;

  List<UserMessageModel> _mockData() => List.generate(
        9,
        (i) => UserMessageModel(
          id: 'msg_$i',
          senderName: 'Dr. Sarah Chen',
          lastMessage: i == 1 ? 'How are youHow are you' : 'How are you',
          time: '${9 + i}:0${i % 5} AM',
          unreadCount: i == 0 ? 2 : 0,
          isOnline: i.isEven,
        ),
      );
}