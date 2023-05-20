import 'package:flutter/material.dart';
import 'package:ticket_checker/src/presentation/setting/setting_page.dart';
import 'package:ticket_checker/src/routing/router.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.flash_on),
          ),
          IconButton(
            onPressed: () {
              router.replace(SettingPage.routeName);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
