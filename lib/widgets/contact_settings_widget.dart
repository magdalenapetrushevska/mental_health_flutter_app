import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/screens/home_screen.dart';
import '../constants.dart';
import '../db_connection/db_connect.dart';
import '../models/emergency_contact_model.dart';

class ContactSettingsBox extends StatelessWidget {
    ContactSettingsBox({
    Key? key,
    required this.contactId,
    required this.phone,
    required this.email,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String contactId;
  final String phone;
  final String email;
   var db = DBconnect();

final _phoneTextController = TextEditingController();
final _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      resizeToAvoidBottomInset: false,
    body:Column(
      children: [
        const SizedBox(height: 50.0,),
        AlertDialog(
          
          backgroundColor: background,
          content: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Contact settings\n',style: TextStyle(color: Color.fromARGB(255, 5, 33, 82), fontSize: 25.0,  fontWeight: FontWeight.bold ),),
                const Text(
                  'Current emergency phone contact:',
                  style: TextStyle(color: neutral, fontSize: 15.0, ),
                ),
                Text(
                  phone,
                  style: const TextStyle(color: neutral, fontSize: 15.0, fontWeight: FontWeight.bold ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                
                 TextField(
                  controller:_phoneTextController,
                  decoration: const InputDecoration(
                    hintText: 'Enter new phone',
                    border: OutlineInputBorder(),
                  ),
                ),
                 const SizedBox(
                  height: 20.0,
                ),

                const Text(
                  'Current psychotherapist email contact:',
                  style: TextStyle(color: neutral, fontSize: 15.0, ),
                ),
                Text(
                  email,
                  style: const TextStyle(color: neutral, fontSize: 15.0, fontWeight: FontWeight.bold ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                 TextField(
                  controller:_emailTextController,
                  decoration: const InputDecoration(
                    hintText: 'Enter new email',
                    border: OutlineInputBorder(),
                  ),
                ),
                 const SizedBox(
                  height: 20.0,
                ),

                
                GestureDetector(
                  onTap: (){
                    db.updateContactSettings(contactId, 
                    _phoneTextController.text !='' ? _phoneTextController.text : phone,
                    _emailTextController.text !='' ? _emailTextController.text : email,);
                     Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const HomeScreen()));
                  },
                  child: const Text(
                    'SAVE',
                    style: TextStyle(color: Colors.blue, fontSize: 25.0,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    );
  }
}
