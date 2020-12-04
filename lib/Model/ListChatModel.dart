class ListChatModel{
  final String image;
  final String lastMessage;
  final String contactName;
  final DateTime dateTime;
  final int numberOfMessage;

  ListChatModel(this.dateTime,this.image,this.contactName,this.lastMessage,this.numberOfMessage);
}

enum popUpMenu{
  newGroup,
  newBroadCast,
  whatsAppWeb,
  starredMessages,
  settings
}