import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lalu/resources/colors.dart';

class BottomAppbar extends StatelessWidget {
  final int selectedItem;
  final void Function(int) onTap;

  const BottomAppbar(
      {super.key, required this.selectedItem, required this.onTap});

  @override
  Widget build(BuildContext context) {
    const _items = [
      CupertinoIcons.music_house,
      CupertinoIcons.music_albums,
      CupertinoIcons.person_circle,
      Icons.settings_outlined,
    ];
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white.withOpacity(0.3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: BottomNavigationBar(
            
            items: _items
                .map((e) => BottomNavigationBarItem(
                    icon: Icon(e),
                    label: '',
                    activeIcon: _BottomBarItemIndicator(icon: e)))
                .toList(),
            currentIndex: selectedItem,
            onTap: onTap,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        ),
      ),
    );
  }
}

class _BottomBarItemIndicator extends StatelessWidget {
  const _BottomBarItemIndicator({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        const SizedBox(height: 8),
        Container(
          height: 8,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [
                Color(0xFFCA6BE5),
                Color(0xFFFA62EA),
              ]
            ),
          ),
        ),
      ],
    );
  }
}
