import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_checker/src/components/bottom_bar.dart';
import 'package:ticket_checker/src/components/fc_button.dart';
import 'package:ticket_checker/src/presentation/scan/scan_camera.dart';

class ScanPage extends StatelessWidget {
  static const routeName = '/scan';
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(child: ScanCamera()),
        ],
      ),
      bottomNavigationBar: BottomBar(),
      floatingActionButton: DetectButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}

class DetectButton extends ConsumerWidget {
  const DetectButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FCButton(
      icon: Icon(Icons.qr_code),
      label: 'Detect',
      onPressed: () {
        ref
            .read(scanningStatusProvider.notifier)
            .update((state) => ScanningStatus.scanning);
      },
    );
  }
}
