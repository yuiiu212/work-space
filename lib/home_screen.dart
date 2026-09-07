import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/chat_item.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/homeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // تم تغيير الخلفية إلى الأبيض
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Chats',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xff1E293B), // لون داكن واضح على الأبيض
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xffE0F2FE), // أزرق سماوي هادئ
            ),
            child: const Row(
              children: [
                Icon(Icons.add, color: Color(0xff0284C7), size: 20),
                SizedBox(width: 6),
                Text(
                  'New Chat',
                  style: TextStyle(
                    color: Color(0xff0284C7),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 12),

              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF1F5F9), // رمادي فاتح مريح
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  style: const TextStyle(color: Color(0xff0F172A)),
                  decoration: InputDecoration(
                    hintText: 'Search conversations...',
                    hintStyle: const TextStyle(color: Color(0xff94A3B8)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/svgs/search_icon.svg',
                        colorFilter: const ColorFilter.mode(
                          Color(0xff64748B),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Chat List
              Column(children: _buildChatItems()),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildChatItems() => [
    ChatItem(
      imagePath: 'assets/img/images (3).jpg',
      name: 'Mohamed Waleed',
      message: 'Just shared the finalized design screens with you.',
      dateTime: DateTime.now(),
    ),
    ChatItem(
      imagePath: 'assets/img/images (1).jpg',
      name: 'Alia Mohamed',
      message: 'Are we still on for the standup call at 3 PM?',
      dateTime: DateTime.now().subtract(const Duration(minutes: 25)),
    ),
    ChatItem(
      imagePath: 'assets/img/images (2).jpg',
      name: 'Omar Said',
      message: 'Huge thanks for debugging that tricky API issue!',
      dateTime: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    ChatItem(
      imagePath: 'assets/img/images (4).jpg',
      name: 'Hany Ali',
      message: 'Payment received. I will send over the receipt shortly.',
      dateTime: DateTime.now().subtract(const Duration(hours: 6)),
    ),
    ChatItem(
      imagePath: 'assets/img/images (5).jpg',
      name: 'Mike Samir',
      message: 'The production deploy went smoothly without errors.',
      dateTime: DateTime.now().subtract(const Duration(days: 1)),
    ),
    ChatItem(
      imagePath: 'assets/img/images.jpg',
      name: 'Reem Mostafa',
      message: 'Let me know what you think of the new proposal.',
      dateTime: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];
}