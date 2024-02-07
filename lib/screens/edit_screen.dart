import 'package:flutter/material.dart';
import 'package:sqlapp/db/db_services.dart';
import 'package:sqlapp/screens/user_screen.dart';
import 'package:sqlapp/utils/colors.dart';
import 'package:sqlapp/widgets/elevation_button_widget.dart';
import 'package:sqlapp/widgets/textfield_widget.dart';

class EditScreen extends StatefulWidget {
  EditScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.phone,
      required this.ids});
  final String name;
  final String email;
  final String phone;
  final String ids;
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final nameEditControll = TextEditingController();

  final emailEditControll = TextEditingController();

  final phoneEditControll = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameEditControll.text = widget.name;
    emailEditControll.text = widget.email;
    phoneEditControll.text = widget.phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWidget,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            TextfieldWidget(text: '', textController: nameEditControll),
            TextfieldWidget(text: '', textController: emailEditControll),
            TextfieldWidget(text: 'text', textController: phoneEditControll),
            SizedBox(
              height: 60,
            ),
            ElevationbuttonWidget(
                onTap: () {
                  dbServices.editdatabase(
                      id: widget.ids,
                      name: nameEditControll.text,
                      email: emailEditControll.text,
                      phone: phoneEditControll.text);

                  Navigator.of(context).pop();
                },
                text: 'Save')
          ],
        ),
      ),
    );
  }
}
