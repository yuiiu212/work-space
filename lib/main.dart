import 'package:flutter/material.dart';

void main() {
  runApp(const ContactsApp());
}

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFBFBFB),
        fontFamily: 'Roboto',
      ),
      home: const MainScreen(),
    );
  }
}

// -------------------------------------------------------------
// MODELS (تحديث الموديل ليدعم مسار أو رابط الصورة)
// -------------------------------------------------------------
class ContactItem {
  final String name;
  final String role;
  final String phone;
  final String email;
  final String birthday;
  final String? avatarUrl; // إضافة حقل الصورة

  const ContactItem({
    required this.name,
    required this.role,
    this.phone = '+20 108 333 6677',
    this.email = 'user@example.com',
    this.birthday = '11th November',
    this.avatarUrl,
  });
}

class RecentCallItem {
  final String name;
  final String time;
  final bool isMissed;
  final ContactItem contactInfo;

  const RecentCallItem({
    required this.name,
    required this.time,
    required this.isMissed,
    required this.contactInfo,
  });
}

// -------------------------------------------------------------
// HELPER: AVATAR WIDGET (دعم الصور الديناميكية)
// -------------------------------------------------------------
Widget buildAvatar({required String? avatarUrl, double radius = 22}) {
  return CircleAvatar(
    radius: radius,
    backgroundColor: const Color(0xFFE5E7EB),
    backgroundImage: (avatarUrl != null && avatarUrl.isNotEmpty)
        ? (avatarUrl.startsWith('http')
            ? NetworkImage(avatarUrl)
            : AssetImage(avatarUrl) as ImageProvider)
        : null,
    child: (avatarUrl == null || avatarUrl.isEmpty)
        ? Icon(
            Icons.person,
            color: const Color(0xFF9CA3AF),
            size: radius * 1.15,
          )
        : null,
  );
}

// -------------------------------------------------------------
// MAIN NAVIGATION (Home & Recent)
// -------------------------------------------------------------
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: SafeArea(
        child: IndexedStack(
          index: _navIndex,
          children: const [
            HomeScreen(),
            RecentScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 72,
        decoration: const BoxDecoration(
          color: Color(0xFFF3F3F5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(0, Icons.home_outlined),
            _buildNavItem(1, Icons.phone_outlined),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    final bool isSelected = _navIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _navIndex = index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 56,
        height: 46,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE9E5FD) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          icon,
          size: 26,
          color: isSelected ? const Color(0xFF4C3EC9) : const Color(0xFF262626),
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// 1. HOME SCREEN (مع ربط صور المفضلة وصفة جهات الاتصال)
// -------------------------------------------------------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // قائمة المفضلة مخصصة كأجسام ContactItem بدلاً من مجرد أسماء نصية
  static const List<ContactItem> favoriteContacts = [
    ContactItem(name: 'Ahmed', role: 'Work', avatarUrl: 'https://i.pravatar.cc/150?img=11'),
    ContactItem(name: 'Mariam', role: 'Friend', avatarUrl: 'https://i.pravatar.cc/150?img=5'),
    ContactItem(name: 'Omar', role: 'Work', avatarUrl: 'https://i.pravatar.cc/150?img=12'),
    ContactItem(name: 'Salma', role: 'Friend', avatarUrl: 'https://i.pravatar.cc/150?img=9'),
    ContactItem(name: 'Youssef', role: 'Work', avatarUrl: 'https://i.pravatar.cc/150?img=13'),
    ContactItem(name: 'Nour', role: 'Friend', avatarUrl: 'https://i.pravatar.cc/150?img=20'),
    ContactItem(name: 'Karim', role: 'Work', avatarUrl: 'https://i.pravatar.cc/150?img=33'),
    ContactItem(name: 'Hana', role: 'Friend', avatarUrl: 'https://i.pravatar.cc/150?img=47'),
  ];

  static const Map<String, List<ContactItem>> contacts = {
    'A': [
      ContactItem(
        name: 'Ahmed',
        role: 'Work',
        phone: '+20 101 234 5678',
        email: 'ahmed@gmail.com',
        birthday: '14th January',
        avatarUrl: 'https://i.pravatar.cc/150?img=11',
      ),
      ContactItem(
        name: 'Ali',
        role: 'Friend',
        phone: '+966 50 123 4567',
        email: 'ali@gmail.com',
        birthday: '3rd March',
        avatarUrl: 'https://i.pravatar.cc/150?img=60',
      ),
    ],
    'H': [
      ContactItem(
        name: 'Hana',
        role: 'Friend',
        phone: '+20 108 333 6677',
        email: 'hana@gmail.com',
        birthday: '22nd October',
        avatarUrl: 'https://i.pravatar.cc/150?img=47',
      ),
    ],
    'K': [
      ContactItem(
        name: 'Karim',
        role: 'Work',
        phone: '+20 122 456 7890',
        email: 'karim@gmail.com',
        birthday: '5th August',
        avatarUrl: 'https://i.pravatar.cc/150?img=33',
      ),
    ],
    'M': [
      ContactItem(
        name: 'Mariam',
        role: 'Friend',
        phone: '+20 109 876 5432',
        email: 'mariam@gmail.com',
        birthday: '27th October',
        avatarUrl: 'https://i.pravatar.cc/150?img=5',
      ),
    ],
    'O': [
      ContactItem(
        name: 'Omar',
        role: 'Work',
        phone: '+971 50 123 4567',
        email: 'omar@gmail.com',
        birthday: '8th November',
        avatarUrl: 'https://i.pravatar.cc/150?img=12',
      ),
    ],
    'S': [
      ContactItem(
        name: 'Salma',
        role: 'Friend',
        phone: '+20 115 554 3210',
        email: 'salma@gmail.com',
        birthday: '21st May',
        avatarUrl: 'https://i.pravatar.cc/150?img=9',
      ),
    ],
    'Y': [
      ContactItem(
        name: 'Youssef',
        role: 'Work',
        phone: '+20 106 777 8888',
        email: 'youssef@gmail.com',
        birthday: '16th August',
        avatarUrl: 'https://i.pravatar.cc/150?img=13',
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      children: [
        Row(
          children: [
            buildAvatar(avatarUrl: 'https://i.pravatar.cc/150?img=68', radius: 26),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Youssef Ali Bakr',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF1E1E1E)),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '8 Contacts',
                    style: TextStyle(fontSize: 13, color: Color(0xFF7A7A7A)),
                  ),
                ],
              ),
            ),
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Color(0xFFEBEBEB),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: const Text(
                'i',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF333333)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        const Text(
          'Favorite',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF1E1E1E)),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 48,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: favoriteContacts.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final fav = favoriteContacts[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PersonalDetailsScreen(contact: fav),
                    ),
                  );
                },
                child: buildAvatar(avatarUrl: fav.avatarUrl, radius: 24),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: const [
              Icon(Icons.search, size: 20, color: Color(0xFF8E8E8E)),
              SizedBox(width: 10),
              Text(
                'Search',
                style: TextStyle(color: Color(0xFF8E8E8E), fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ...contacts.entries.expand((entry) {
          return [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 4),
              child: Text(
                entry.key,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF444444)),
              ),
            ),
            ...entry.value.map(
              (c) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PersonalDetailsScreen(contact: c),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      buildAvatar(avatarUrl: c.avatarUrl, radius: 22),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              c.name,
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xFF1E1E1E)),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              c.role,
                              style: const TextStyle(fontSize: 12, color: Color(0xFF7A7A7A)),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.more_horiz, color: Color(0xFF444444), size: 24),
                    ],
                  ),
                ),
              ),
            ),
          ];
        }),
      ],
    );
  }
}

// -------------------------------------------------------------
// 2. RECENT SCREEN
// -------------------------------------------------------------
class RecentScreen extends StatefulWidget {
  const RecentScreen({super.key});

  @override
  State<RecentScreen> createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {
  bool _isAllSelected = true;

  static const List<RecentCallItem> calls = [
    RecentCallItem(
      name: 'Ahmed',
      time: '15 minutes ago',
      isMissed: false,
      contactInfo: ContactItem(
        name: 'Ahmed',
        role: 'Work',
        phone: '+20 101 234 5678',
        email: 'ahmed@gmail.com',
        birthday: '14th January',
        avatarUrl: 'https://i.pravatar.cc/150?img=11',
      ),
    ),
    RecentCallItem(
      name: 'Mariam',
      time: '30 minutes ago',
      isMissed: true,
      contactInfo: ContactItem(
        name: 'Mariam',
        role: 'Friend',
        phone: '+20 109 876 5432',
        email: 'mariam@gmail.com',
        birthday: '27th October',
        avatarUrl: 'https://i.pravatar.cc/150?img=5',
      ),
    ),
    RecentCallItem(
      name: 'Omar',
      time: '1 hour ago',
      isMissed: false,
      contactInfo: ContactItem(
        name: 'Omar',
        role: 'Work',
        phone: '+971 50 123 4567',
        email: 'omar@gmail.com',
        birthday: '8th November',
        avatarUrl: 'https://i.pravatar.cc/150?img=12',
      ),
    ),
    RecentCallItem(
      name: 'Salma',
      time: '2 hours ago',
      isMissed: true,
      contactInfo: ContactItem(
        name: 'Salma',
        role: 'Friend',
        phone: '+20 115 554 3210',
        email: 'salma@gmail.com',
        birthday: '21st May',
        avatarUrl: 'https://i.pravatar.cc/150?img=9',
      ),
    ),
    RecentCallItem(
      name: 'Youssef',
      time: '4 hours ago',
      isMissed: false,
      contactInfo: ContactItem(
        name: 'Youssef',
        role: 'Work',
        phone: '+20 106 777 8888',
        email: 'youssef@gmail.com',
        birthday: '16th August',
        avatarUrl: 'https://i.pravatar.cc/150?img=13',
      ),
    ),
    RecentCallItem(
      name: 'Ali',
      time: 'Yesterday',
      isMissed: true,
      contactInfo: ContactItem(
        name: 'Ali',
        role: 'Friend',
        phone: '+966 50 123 4567',
        email: 'ali@gmail.com',
        birthday: '3rd March',
        avatarUrl: 'https://i.pravatar.cc/150?img=60',
      ),
    ),
    RecentCallItem(
      name: 'Hana',
      time: '2 days ago',
      isMissed: false,
      contactInfo: ContactItem(
        name: 'Hana',
        role: 'Friend',
        phone: '+20 108 333 6677',
        email: 'hana@gmail.com',
        birthday: '22nd October',
        avatarUrl: 'https://i.pravatar.cc/150?img=47',
      ),
    ),
    RecentCallItem(
      name: 'Karim',
      time: '3 days ago',
      isMissed: true,
      contactInfo: ContactItem(
        name: 'Karim',
        role: 'Work',
        phone: '+20 122 456 7890',
        email: 'karim@gmail.com',
        birthday: '5th August',
        avatarUrl: 'https://i.pravatar.cc/150?img=33',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final activeList = _isAllSelected
        ? calls
        : calls.where((c) => c.isMissed).toList();

    return Column(
      children: [
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (!_isAllSelected) setState(() => _isAllSelected = true);
                  },
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                      color: _isAllSelected ? const Color(0xFF00E63D) : const Color(0xFFD6D6D6),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'All',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: _isAllSelected ? Colors.white : const Color(0xFF262626),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (_isAllSelected) setState(() => _isAllSelected = false);
                  },
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                      color: !_isAllSelected ? const Color(0xFFE90052) : const Color(0xFFD6D6D6),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Missed',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: !_isAllSelected ? Colors.white : const Color(0xFF262626),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView.builder(
            key: ValueKey<bool>(_isAllSelected),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            itemCount: activeList.length,
            itemBuilder: (context, index) {
              final item = activeList[index];
              final bool highlightRed = !_isAllSelected || item.isMissed;

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PersonalDetailsScreen(contact: item.contactInfo),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      buildAvatar(avatarUrl: item.contactInfo.avatarUrl, radius: 20),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: highlightRed ? const Color(0xFFE93B4E) : const Color(0xFF1E1E1E),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item.time,
                              style: const TextStyle(fontSize: 12, color: Color(0xFF7A7A7A)),
                            ),
                          ],
                        ),
                      ),
                      _buildRoundActionButton(Icons.phone_outlined),
                      const SizedBox(width: 10),
                      _buildRoundActionButton(Icons.chat_bubble_outline),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRoundActionButton(IconData icon) {
    return Container(
      width: 32,
      height: 32,
      decoration: const BoxDecoration(
        color: Color(0xFFEFEFEF),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 16, color: const Color(0xFF333333)),
    );
  }
}

// -------------------------------------------------------------
// 3. PERSONAL DETAILS SCREEN
// -------------------------------------------------------------
class PersonalDetailsScreen extends StatelessWidget {
  final ContactItem contact;

  const PersonalDetailsScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF1F1F3),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Color(0xFF262626),
                      ),
                    ),
                  ),
                  const Text(
                    'Personal Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_outlined, size: 22, color: Color(0xFF262626)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            buildAvatar(avatarUrl: contact.avatarUrl, radius: 55),
            const SizedBox(height: 16),
            Text(
              contact.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1E1E1E),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildActionButton(Icons.phone_outlined, 'Call'),
                const SizedBox(width: 32),
                _buildActionButton(Icons.chat_bubble_outline, 'Message'),
                const SizedBox(width: 32),
                _buildActionButton(Icons.email_outlined, 'Email'),
              ],
            ),
            const SizedBox(height: 32),
            const Divider(color: Color(0xFFF1F1F3), thickness: 1, height: 1),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                children: [
                  _buildDetailTile(
                    category: 'Phone Numbers',
                    primaryValue: contact.phone,
                    label: 'Mobile',
                    icon: Icons.phone_outlined,
                  ),
                  const SizedBox(height: 22),
                  _buildDetailTile(
                    category: 'Email Address',
                    primaryValue: contact.email,
                    label: 'Personal',
                    icon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 22),
                  _buildDetailTile(
                    category: 'Important Dates',
                    primaryValue: 'Birthday',
                    label: contact.birthday,
                    icon: Icons.cake_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: const BoxDecoration(
            color: Color(0xFFE9E5FD),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 24, color: const Color(0xFF333333)),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF333333),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailTile({
    required String category,
    required String primaryValue,
    required String label,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF8E8E8E),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  primaryValue,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E1E1E),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8E8E8E),
                  ),
                ),
              ],
            ),
            Icon(icon, size: 20, color: const Color(0xFF444444)),
          ],
        ),
      ],
    );
  }
}
