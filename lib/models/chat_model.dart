import 'message_data.dart'; // Import the new structure

class ChatModel {
  final String name;
  final String avatarUrl;
  final int unreadCount;
  // Each chat now owns its own list of messages
  final List<Message> messages;

  ChatModel({
    required this.name,
    this.avatarUrl = '',
    this.unreadCount = 0,
    required this.messages,
  });
}

// WE POPULATE DATA HERE USING THE MODEL STRUCTURE
List<ChatModel> dummyChats = [
  ChatModel(
      name: "Brooke Davis",
      unreadCount: 2,
      messages: [
        Message(text: "Hey Lucas!", isMe: false),
        Message(text: "How's your project going?", isMe: false),
        Message(text: "Hi Brooke!", isMe: true),
        Message(text: "It's going well. Thanks for asking!", isMe: true),
        Message(text: "No worries. Let me know if you need any help 😉", isMe: false),
        Message(text: "You're the best!", isMe: true),
      ]
  ),
  ChatModel(
      name: "Haley James",
      unreadCount: 9,
      messages: [
        Message(text: "Stand up for what you believe in", isMe: false),
      ]
  ),
  ChatModel(
      name: "Nathan Scott",
      unreadCount: 0,
      messages: [
        Message(text: "One day you're seventeen and planning for someday...", isMe: false),
      ]
  ),
  // Initialize others with empty lists to avoid errors
  ChatModel(name: "Jamie Scott", messages: []),
  ChatModel(name: "Marvin McFadden", messages: []),
  ChatModel(name: "Antwon Taylor", messages: []),
  ChatModel(name: "Jake Jagielski", messages: []),
  ChatModel(name: "Abdul Pallakad", messages: []),
];