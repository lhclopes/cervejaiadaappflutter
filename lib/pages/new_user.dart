import 'package:flutter/material.dart';

class NewUser extends StatefulWidget {
  const NewUser({super.key, required this.title});

  final String title;

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var birthdayController = TextEditingController();

  Text label(text) {
    return Text(text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
  }

  InputDecoration inputStyle({required String label, String? hint}) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.black),
      filled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 20, fontFamily: 'Raleway'),
          )),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              style: const TextStyle(color: Colors.black),
              decoration: inputStyle(label: 'User', hint: 'Place your Username here.'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.black),
              decoration: inputStyle(label: 'Email', hint: 'Place your Email here.'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: birthdayController,
              style: const TextStyle(color: Colors.black),
              decoration: inputStyle(label: 'Birthday', hint: 'Place your Birthday here.'),
              onTap: () async {
                var birthday = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000, 1, 1),
                    firstDate: DateTime(1900, 1, 1),
                    lastDate: DateTime.now());
                birthdayController.text =
                    birthday != null ? birthday.toString() : "";
              },
            ),
            TextButton(
              onPressed: () {
                print('cadastro');
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
