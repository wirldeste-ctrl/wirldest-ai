import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const WalletApp());
}

class WalletApp extends StatelessWidget {
  const WalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallet',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6558F5),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F7FB),
      ),
      home: const WalletHomePage(),
    );
  }
}

class WalletHomePage extends StatefulWidget {
  const WalletHomePage({super.key});

  @override
  State<WalletHomePage> createState() => _WalletHomePageState();
}

class _WalletHomePageState extends State<WalletHomePage> {
  final int _selectedTab = 0;

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildBalanceCard(),
              const SizedBox(height: 24),
              _buildQuickActions(),
              const SizedBox(height: 28),
              _buildSectionHeader('My cards', 'See all'),
              const SizedBox(height: 14),
              _buildBankCard(),
              const SizedBox(height: 28),
              _buildSectionHeader('Recent transactions', 'See all'),
              const SizedBox(height: 8),
              _buildTransaction(
                icon: Icons.shopping_bag_outlined,
                color: const Color(0xFFFFEEE5),
                iconColor: const Color(0xFFF28B53),
                title: 'Grocery Store',
                subtitle: 'Today, 10:42 AM',
                amount: '-\$54.20',
              ),
              _buildTransaction(
                icon: Icons.arrow_downward_rounded,
                color: const Color(0xFFE7F8F0),
                iconColor: const Color(0xFF35A978),
                title: 'Salary',
                subtitle: 'Yesterday, 9:15 AM',
                amount: '+\$2,450.00',
                isCredit: true,
              ),
              _buildTransaction(
                icon: Icons.local_cafe_outlined,
                color: const Color(0xFFFFF4D9),
                iconColor: const Color(0xFFE2A92E),
                title: 'Coffee House',
                subtitle: 'Oct 28, 8:30 AM',
                amount: '-\$6.80',
              ),
            ],
          ),
        ),
        
      ),
   bottomNavigationBar: CurvedNavigationBar(
    animationDuration: Duration(milliseconds: 300),
    backgroundColor: Colors.white,
    color: Colors.black,
    
    items: [
    CurvedNavigationBarItem(child: Icon(Icons.home,color: Colors.white,)),
    CurvedNavigationBarItem(child: Icon(Icons.shopping_bag,color:Colors.white)),
    CurvedNavigationBarItem(child: Icon(Icons.person,color: Colors.white,)),
    


   ]),
     
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundColor: Color(0xFFEAE8FF),
          child: Icon(Icons.person, color: Color(0xFF6558F5)),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning,',
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),
              SizedBox(height: 2),
              Text(
                'Abdou Hamza',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => _showMessage('No new notifications'),
          icon: const Icon(Icons.notifications_none_rounded),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF25243A),
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF7567FF), Color(0xFF5144D8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6558F5).withValues(alpha: 0.25),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Total balance',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
              IconButton(
                onPressed: () => _showMessage('Balance details'),
                icon: const Icon(Icons.more_horiz, color: Colors.white),
              ),
            ],
          ),
          const Text(
            '\$100 Billion',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _balanceDetail(
                icon: Icons.trending_up_rounded,
                label: 'Income',
                amount: '\$4M',
              ),
              const SizedBox(width: 28),
              _balanceDetail(
                icon: Icons.trending_down_rounded,
                label: 'Expense',
                amount: '\$1M',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _balanceDetail({
    required IconData icon,
    required String label,
    required String amount,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 18),
        const SizedBox(width: 7),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 11),
            ),
            Text(
              amount,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _quickAction(Icons.arrow_upward_rounded, 'Send'),
        _quickAction(Icons.arrow_downward_rounded, 'Request'),
        _quickAction(Icons.add_rounded, 'Top up'),
        _quickAction(Icons.grid_view_rounded, 'More'),
      ],
    );
  }

  Widget _quickAction(IconData icon, String label) {
    return InkWell(
      onTap: () => _showMessage('$label selected'),
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 72,
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(icon, color: const Color(0xFF6558F5)),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        TextButton(
          onPressed: () => _showMessage('$action transactions'),
          child: Text(
            action,
            style: const TextStyle(color: Color(0xFF6558F5)),
          ),
        ),
      ],
    );
  }

  Widget _buildBankCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF222238),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.circle, color: Color(0xFF8A7FFF), size: 20),
              const SizedBox(width: 6),
              const Icon(Icons.circle, color: Color(0xFFFFB45E), size: 20),
              const Spacer(),
              Text(
                'VISA',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          const Text(
            '••••  ••••  ••••  4829',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Abdou Hamza',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              Text(
                '08/28',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransaction({
    required IconData icon,
    required Color color,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String amount,
    bool isCredit = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: isCredit ? const Color(0xFF35A978) : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}