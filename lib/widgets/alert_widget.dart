import 'package:flutter/material.dart';
import 'package:sqlapp/db/db_services.dart';
import 'package:sqlapp/utils/colors.dart';

class AlertWidget extends StatefulWidget {
  AlertWidget({super.key, required this.id});
  final String id;

  @override
  State<AlertWidget> createState() => _AlertWidgetState();
}

class _AlertWidgetState extends State<AlertWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Alert!',
        style: TextStyle(color: Colors.red),
      ),
      content: const Text('Do you want to delete!'),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: const Text('Confirm'),
          onPressed: () {
            dbServices.delete(id: widget.id);
            Navigator.of(context).pop(
              true
            );
            setState(() {});
          },
        ),
      ],
    );
  }
}
