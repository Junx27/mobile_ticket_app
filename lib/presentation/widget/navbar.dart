import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: const TextStyle(fontSize: 10),
      unselectedLabelStyle: const TextStyle(fontSize: 10),
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(
          index: 0,
          currentIndex: currentIndex,
          icon: Icons.article_outlined,
          activeIcon: Icons.article_rounded,
          label: "Beranda",
        ),
        _buildItem(
          index: 1,
          currentIndex: currentIndex,
          icon: Icons.assignment_outlined,
          activeIcon: Icons.assignment,
          label: "Survey",
        ),
        _buildItem(
          index: 2,
          currentIndex: currentIndex,
          icon: Icons.shop_2_outlined,
          activeIcon: Icons.shop_2_rounded,
          label: "Toko",
        ),
        _buildItem(
          index: 3,
          currentIndex: currentIndex,
          icon: Icons.history_outlined,
          activeIcon: Icons.history_rounded,
          label: "Riwayat",
        ),
        _buildItem(
          index: 4,
          currentIndex: currentIndex,
          icon: Icons.settings_outlined,
          activeIcon: Icons.settings,
          label: "Pengaturan",
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildItem({
    required int index,
    required int currentIndex,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final isActive = index == currentIndex;

    return BottomNavigationBarItem(
      icon: isActive
          ? TweenAnimationBuilder<Offset>(
              tween: Tween(begin: const Offset(0, 0.5), end: Offset.zero),
              duration: const Duration(milliseconds: 300),
              builder: (context, offset, child) {
                return Transform.translate(
                  offset: offset * 20,
                  child: Icon(activeIcon),
                );
              },
            )
          : Icon(icon),
      label: label,
    );
  }
}
