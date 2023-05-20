import 'package:flutter/material.dart';
import 'package:ticket_checker/src/components/fc_button.dart';
import 'package:ticket_checker/src/presentation/scan/scan_page.dart';
import 'package:ticket_checker/src/routing/router.dart';

class SettingPage extends StatelessWidget {
  static const routeName = '/settings';
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Tile(
            title: 'Advanced',
            leading: const Icon(Icons.more_horiz_sharp),
            trailing: const Icon(Icons.navigate_next),
            onTap: () => router
                .push('${SettingPage.routeName}/${AdvancedTab.routeName}'),
          )
        ],
      ),
      floatingActionButton: FCButton(
        icon: const Icon(Icons.home_filled),
        label: 'Home',
        onPressed: () => router.replace(ScanPage.routeName),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  const Tile(
      {super.key,
      required this.title,
      this.leading,
      this.trailing,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        leading: leading,
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}

class AdvancedTab extends StatelessWidget {
  static const routeName = 'advance';
  const AdvancedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Tile(
              title: 'Url',
              trailing: IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
