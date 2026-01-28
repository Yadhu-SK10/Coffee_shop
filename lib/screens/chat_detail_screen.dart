import 'dart:io';
import 'package:flutter/material.dart';
import 'package:coffee_shop/widgets/custom_app_bar.dart';
import 'package:coffee_shop/models/chat_model.dart';
import 'package:coffee_shop/models/message_data.dart'; // Import for Message class
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ChatDetailScreen extends StatefulWidget {
  final ChatModel chat;

  const ChatDetailScreen({super.key, required this.chat});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ImagePicker _picker = ImagePicker();

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // LOGIC: SEND TEXT
  void _sendTextMessage() {
    if (_textController.text.trim().isEmpty) return;

    setState(() {
      // 1. Create the Message Object
      final newMessage = Message(text: _textController.text.trim(), isMe: true, type: 'text');

      // 2. Add it to the model's list directly
      widget.chat.messages.add(newMessage);

      _textController.clear();
    });
    _scrollToBottom();
  }

  // LOGIC: SEND IMAGE
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        // 1. Create Image Message Object
        final newMessage = Message(
          text: "Image", // Fallback text
          isMe: true,
          type: 'image',
          path: image.path,
        );

        // 2. Add to list
        widget.chat.messages.add(newMessage);
      });
      _scrollToBottom();
    }
  }

  @override
  Widget build(BuildContext context) {
    // USE THE LIST FROM THE MODEL DIRECTLY
    final messages = widget.chat.messages;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 375,
          height: 812,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1), // Fixed compatibility
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 44),
              // APP BAR
              CustomAppBar(
                title: widget.chat.name,
                leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios, color: Color(0xFF007AFF), size: 20),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: 42,
                      height: 42,
                      color: const Color(0xFFF2F2F7),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SvgPicture.asset('assets/icons/avatar.svg', width: 32, height: 32, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: messages.isEmpty
                    ? const Center(child: Text("No messages yet"))
                    : ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final msg = messages[index];

                          // CHANGED: Use dot notation (msg.isMe) instead of map ['isMe']
                          return Align(
                            alignment: msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                              decoration: msg.type == 'text'
                                  ? BoxDecoration(
                                      color: msg.isMe ? const Color(0xFF007AFF) : const Color(0xFFF2F2F7),
                                      borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(20),
                                        topRight: const Radius.circular(20),
                                        bottomLeft: const Radius.circular(20),
                                        bottomRight: msg.isMe ? const Radius.circular(4) : const Radius.circular(20),
                                      ),
                                    )
                                  : null,
                              padding: msg.type == 'text'
                                  ? const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
                                  : EdgeInsets.zero,
                              child: msg.type == 'image'
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      // CHANGED: Use msg.path! instead of msg['path']
                                      child: Image.file(File(msg.path!), height: 200, width: 200, fit: BoxFit.cover),
                                    )
                                  : Text(
                                      msg.text, // CHANGED: msg.text instead of msg['text']
                                      style: TextStyle(
                                        color: msg.isMe ? Colors.white : Colors.black,
                                        fontSize: 16,
                                        height: 1.3,
                                      ),
                                    ),
                            ),
                          );
                        },
                      ),
              ),

              // BOTTOM INPUT BAR
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(color: Color(0xFFBDC5CD), width: 0.5)),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: const Icon(Icons.add, color: Color(0xFF007AFF), size: 28),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 6, top: 6, bottom: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F2F7),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFE5E5EA)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _textController,
                                onSubmitted: (_) => _sendTextMessage(),
                                decoration: const InputDecoration(
                                  hintText: "Type a message...",
                                  hintStyle: TextStyle(color: Color(0xFF8E8E93)),
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: _sendTextMessage,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(color: Color(0xFF007AFF), shape: BoxShape.circle),
                                // Added padding to center the icon better
                                padding: const EdgeInsets.all(6.0),
                                child: SvgPicture.asset(
                                  'assets/icons/send.svg',
                                  fit: BoxFit.contain,
                                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
