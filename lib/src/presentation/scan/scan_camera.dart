// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:ticket_checker/src/providers/check.dart';

class ScanCamera extends ConsumerWidget {
  const ScanCamera({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(scanningStatusProvider);

    switch (status) {
      case ScanningStatus.idle:
        return const Center(
          child: Text('Click detect button to start check.'),
        );

      case ScanningStatus.scanning:
        return const Camera();
    }
  }
}

class Camera extends ConsumerStatefulWidget {
  const Camera({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CameraState();
}

class _CameraState extends ConsumerState<Camera> {
  final controller = MobileScannerController(
    autoStart: true,
  );

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      onDetect: (capture) {
        ref
            .read(scanningStatusProvider.notifier)
            .update((state) => ScanningStatus.idle);

        final id = capture.barcodes.first.rawValue;

        if (id == null || int.tryParse(id) == null) return;

        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return Dialog(
              child: SizedBox(
                height: 300,
                width: 300,
                child: Center(
                  child: CheckDialog(
                    id: id,
                  ),
                ),
              ),
            );
          },
        );
      },
      controller: controller,
    );
  }
}

class CheckDialog extends ConsumerWidget {
  final String id;
  const CheckDialog({
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(checkProvider(id));

    return status.when(
      data: (data) => switch (data) {
        Success() => Text('ok'),
        Failure() => Text('failed'),
        NetworkException() => Text('No network'),
        UnknownCode(:final code) => Text('unknown code: $code'),
        UnknownError(:final error) => Text(error.toString()),
      },
      error: (_, __) => Text(''),
      loading: () => CircularProgressIndicator(),
    );
  }
}

final idProvider = StateProvider((ref) => '');

enum ScanningStatus {
  idle,
  scanning,
}

final scanningStatusProvider = StateProvider((ref) => ScanningStatus.idle);
