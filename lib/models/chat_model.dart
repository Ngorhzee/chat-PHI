class ChatModel {
  final String name;
  final String lastMessage;
  final String? sentBy;
  final String? profilePic;
  final bool isGroup;

  ChatModel({required this.name, required this.lastMessage,  this.sentBy,  this.profilePic, required this.isGroup});
}
