import 'package:flutter/material.dart';
import 'package:sqlapp/screens/edit_screen.dart';
import 'package:sqlapp/utils/colors.dart';
import 'package:sqlapp/widgets/alert_widget.dart';
import 'package:sqlapp/widgets/elevation_button_widget.dart';

class UserWidget extends StatefulWidget {
  UserWidget(
      {super.key,
      required this.text,
      required this.emails,
      required this.phones,
      required this.id, required this.onDelete, required this.onEdit});
  final String text;
  final String emails;
  final String phones;
  final String id;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 1)],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 150,
            child: Text(widget.text),
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed:widget.onEdit,
            icon: const Icon(
              Icons.edit,
              color: kColorWidget,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed:widget.onDelete,
            icon: const Icon(
              Icons.delete,
              color: kColorWidget,
            ),
          ),
        ],
      ),
    );
  }
}
