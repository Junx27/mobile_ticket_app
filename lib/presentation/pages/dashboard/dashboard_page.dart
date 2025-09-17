import 'package:flutter/material.dart';
import 'package:mobile_ticket_app/presentation/pages/follower/follower.dart';
import 'package:mobile_ticket_app/presentation/pages/history/history_page.dart';
import 'package:mobile_ticket_app/presentation/pages/home/home_page.dart';
import 'package:mobile_ticket_app/presentation/pages/payment/menu_payment.dart';
import 'package:mobile_ticket_app/presentation/pages/reward/reward_receive.dart';
import 'package:mobile_ticket_app/presentation/pages/setting/setting_page.dart';
import 'package:mobile_ticket_app/presentation/pages/shop/shop_page.dart';
import 'package:mobile_ticket_app/presentation/pages/survey/menu_survey.dart';
import 'package:mobile_ticket_app/presentation/pages/survey/survey_page.dart';
import 'package:mobile_ticket_app/presentation/pages/user/user_page.dart';
import 'package:mobile_ticket_app/presentation/widget/navbar.dart';

// buat global key untuk akses state dari luar
final GlobalKey<DashboardPageState> dashboardKey =
    GlobalKey<DashboardPageState>();

class DashboardPage extends StatefulWidget {
  final int initialIndex;

  const DashboardPage({super.key, this.initialIndex = 0});

  @override
  State<DashboardPage> createState() => DashboardPageState();
}

// state harus public biar bisa diakses global key
class DashboardPageState extends State<DashboardPage> {
  late int _selectedIndex;

  // semua halaman (bisa lebih dari 5)
  final List<Widget> _allPages = const [
    HomePage(), // index 0
    SurveyPage(), // index 1
    ShopPage(), // index 2
    HistoryPage(), // index 3
    SettingPage(), // index 4
    UserPage(), // index 5 (contoh tambahan)
    Follower(),
    MenuSurvey(),
    MenuPayment(),
    RewardReceive(),
  ];

  // index yang muncul di navbar (bisa diubah dinamis)
  List<int> _navIndexes = [
    0,
    1,
    2,
    3,
    4,
  ]; // default: Home, Survey, Shop, History, Setting

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int navIndex) {
    setState(() {
      _selectedIndex = _navIndexes[navIndex]; // map ke index asli
    });
  }

  /// Fungsi untuk mengganti item navbar (misal Home → UserPage)
  void replaceNavItem(int navBarPos, int newPageIndex) {
    setState(() {
      if (navBarPos >= 0 && navBarPos < _navIndexes.length) {
        _navIndexes[navBarPos] = newPageIndex;
        _selectedIndex = newPageIndex;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // bikin items sesuai urutan _navIndexes
    final navItems = _navIndexes.map((index) {
      switch (index) {
        case 0:
          return const BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            activeIcon: Icon(Icons.article_rounded),
            label: "Beranda",
          );
        case 1:
          return const BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            activeIcon: Icon(Icons.assignment),
            label: "Survey",
          );
        case 2:
          return const BottomNavigationBarItem(
            icon: Icon(Icons.shop_2_outlined),
            activeIcon: Icon(Icons.shop_2_rounded),
            label: "Toko",
          );
        case 3:
          return const BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            activeIcon: Icon(Icons.history_rounded),
            label: "Riwayat",
          );
        case 4:
          return const BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: "Pengaturan",
          );
        case 5:
          return const BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            activeIcon: Icon(Icons.article_rounded),
            label: "Beranda",
          );
        default:
          return const BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            activeIcon: Icon(Icons.article_rounded),
            label: "Beranda",
          );
      }
    }).toList();

    return Scaffold(
      key: dashboardKey, // pasang key di sini
      body: _allPages[_selectedIndex],
      bottomNavigationBar: NavBar(
        currentIndex: _navIndexes.contains(_selectedIndex)
            ? _navIndexes.indexOf(_selectedIndex)
            : 0,
        onTap: _onItemTapped,
        items: navItems,
      ),
    );
  }
}
