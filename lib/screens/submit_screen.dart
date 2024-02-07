import 'package:flutter/material.dart';
import 'package:sqlapp/db/db_services.dart';
import 'package:sqlapp/screens/user_screen.dart';
import 'package:sqlapp/utils/colors.dart';
import 'package:sqlapp/widgets/elevation_button_widget.dart';
import 'package:sqlapp/widgets/textfield_widget.dart';
import 'package:uuid/uuid.dart';

class SubmitScreen extends StatelessWidget {
  SubmitScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kColorWidget,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            TextfieldWidget(text: 'Name', textController: nameController),
            TextfieldWidget(text: 'Email', textController: emailController),
            TextfieldWidget(text: 'Phone', textController: phoneController),
            SizedBox(
              height: 50,
            ),
            ElevationbuttonWidget(
                onTap: () {
                  if (nameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      phoneController.text.isNotEmpty) {
                    dbServices.adddata(
                        id: Uuid().v4(),
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text);
                  }
                  Center(child: CircularProgressIndicator());
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UserScreen(),
                    ),
                  );
                },
                text: 'Submit'),
        
          ],
        ),
      ),
    );
  }
}
