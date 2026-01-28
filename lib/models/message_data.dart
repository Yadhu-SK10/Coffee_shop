class Message {
  final String text;
  final bool isMe;
  final String type; // 'text' or 'image'
  final String? path; // Nullable, only for images

  Message({
    required this.text,
    required this.isMe,
    this.type = 'text',
    this.path,
  });
}