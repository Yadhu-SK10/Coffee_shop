import 'package:flutter/material.dart';
import 'package:coffee_shop/widgets/custom_app_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:coffee_shop/models/chat_model.dart';
import 'package:coffee_shop/screens/chat_detail_screen.dart';
import 'package:coffee_shop/models/message_data.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: Center(
        child: Container(
          width: 375,
          height: 812,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha:0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRect(
            child: Column(
              children: [
                const SizedBox(height: 44),

                // CUSTOM APP BAR
                CustomAppBar(
                  title: "Chats",
                  leading: GestureDetector(
                    onTap: () {
                      print("Edit Clicked");
                    },
                    child: const Text(
                      "Edit",
                      style: TextStyle(
                        color: Color(0xFF007AFF),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      print("New Chat Clicked");
                    },
                    child: SvgPicture.asset(
                      'assets/icons/Right_button.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                //  SEARCH BAR
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FE),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Color(0xFF3F3036)),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: TextStyle(color: Color(0xFF8F9098)),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //  CHAT LISTVIEW
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 0),
                    itemCount: dummyChats.length,
                    itemBuilder: (context, index) {
                      final chat = dummyChats[index];

                      // DYNAMIC LAST MESSAGE LOGIC
                      String displayMessage = "";
                      if (chat.messages.isNotEmpty) {
                        final lastMsg = chat.messages.last;
                        if (lastMsg.type == 'image') {
                          displayMessage = "Sent an image";
                        } else {
                          displayMessage = lastMsg.text;
                        }
                      }

// REFRESH LOGIC
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailScreen(chat: chat),)).then((_) {
                          setState(() {}); // <--- This forces the list to update when you return
                        });
                      };

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatDetailScreen(chat: chat),
                            ),
                          ).then((_) {
                            // "Callback" to refresh the list when we come back
                            // This ensures the "Last Message" updates immediately
                            setState(() {});
                          });
                        },
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // AVATAR
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Container(
                                    width: 42,
                                    height: 42,
                                    color: const Color(0xFFF2F2F7),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: SvgPicture.asset(
                                        'assets/icons/avatar.svg',
                                        width: 32,
                                        height: 32,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Name
                                    Text(
                                      chat.name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF1F2024),
                                      ),
                                    ),

                                    const SizedBox(height: 2),

                                    Text(
                                      displayMessage, //  last message
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF71727A),
                                        height: 1.6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //  BADGE
                              if (chat.unreadCount > 0) ...[
                                const SizedBox(width: 8),
                                Container(
                                  width: 28,
                                  height: 28,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF006FFD), // Figma Blue
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                  child: Text(
                                    chat.unreadCount.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                //  BOTTOM TAB BAR
                Container(
                  padding: const EdgeInsets.only(top: 14, bottom: 30),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // CHATS (Active)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/chat.svg',
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Chats",
                            style: TextStyle(
                              color: Color(0xFF1F2024),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      // FRIENDS
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/friends.svg',
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Friends",
                            style: TextStyle(
                              color: Color(0xFF8E8E93),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      // SETTINGS
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/settings.svg',
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Settings",
                            style: TextStyle(
                              color: Color(0xFF8E8E93),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
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
        ),
      ),
    );
  }
}