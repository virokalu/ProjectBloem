class MessageModel{
  late String type;
  late String message;
  late String sourceName;
  late String targetName;
  late DateTime time;
  MessageModel({required this.type, required this.message, required this.sourceName, required this.targetName, required this.time});
}