import 'package:flutter/material.dart';

class DialogService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  // Renamed to avoid conflict
  Future<void> showCustomDialog({
    required String title,
    required String description,
  }) async {
    return showDialog(
      context: _navigationKey.currentContext!,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void callDialogService(String? title, String? description) {
    showCustomDialog(
      title: title ?? 'Notice',
      description: description ?? 'No details provided.',
    );
  }
}