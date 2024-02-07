import 'package:flutter/material.dart';
import 'package:sqlapp/db/db_services.dart';
import 'package:sqlapp/screens/edit_screen.dart';
import 'package:sqlapp/screens/submit_screen.dart';
import 'package:sqlapp/utils/colors.dart';
import 'package:sqlapp/widgets/alert_widget.dart';
import 'package:sqlapp/widgets/elevation_button_widget.dart';
import 'package:sqlapp/widgets/user_widget.dart';
import 'package:uuid/uuid.dart';

class UserScreen extends StatefulWidget {
  UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWidget,
      body: Column(
        children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: FutureBuilder(
                    future: dbServices.viewdatabase(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => UserWidget(
                            text: snapshot.data![index]['name'],
                            emails: snapshot.data![index]['email'],
                            phones: snapshot.data![index]['phone'],
                            id: snapshot.data![index]['id'],
                            onDelete: () async {
                              bool a = await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertWidget(
                                    id: snapshot.data![index]['id'],
                                  );
                                },
                              );
                              if (a == true) {
                                setState(() {});
                              }
                            },
                            onEdit: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EditScreen(
                                    name: snapshot.data![index]['name'],
                                    email: snapshot.data![index]['email'],
                                    phone: snapshot.data![index]['phone'],
                                    ids: snapshot.data![index]['id'],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Its error');
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })),
          ),
          SizedBox(
            height: 30,
          ),
          ElevationbuttonWidget(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SubmitScreen(),
                ));
              },
              text: 'Add Student')
        ],
      ),
    );
  }
}
