import 'package:cervejaiadaappflutter/pages/main_page.dart';
import 'package:cervejaiadaappflutter/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var userController = TextEditingController();
  var passwordController = TextEditingController();

  bool isObscureText = true;

  TextStyle formTextStyle() {
    return const TextStyle(color: Colors.white);
  }

  InputDecoration formInputStyle(
      {required IconData icon,
      required String label,
      String? hint,
      suffixIcon}) {
    return InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white, size: 30),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white, fontSize: 20),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        filled: true,
        suffixIcon: suffixIcon);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: Column(children: <Widget>[
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        AppImages.logo,
                        height: 300,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: Text(
                          'Do you have you register?',
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: TextFormField(
                          controller: userController,
                          style: formTextStyle(),
                          decoration: formInputStyle(
                              icon: Icons.person,
                              label: 'User',
                              hint: 'Place your Username here.'),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: isObscureText,
                            style: formTextStyle(),
                            decoration: formInputStyle(
                                icon: Icons.key,
                                label: 'Password',
                                hint: 'Place your Password here.',
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isObscureText = !isObscureText;
                                      });
                                    },
                                    child: Icon(
                                        isObscureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.white))),
                          )),
                      Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.indigo)),
                              onPressed: () {
                                var msg =
                                    'Error, User or Password not matched!';
                                if (userController.text == 'teste' &&
                                    passwordController.text == 'teste') {
                                  msg = 'User Sucessfully Logged';
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MainPage()));
                                }

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text(msg)));
                              },
                              child: Text(
                                'Go',
                                style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          )),
                    ],
                  )),
                  Container(
                      height: 60,
                      color: const Color.fromARGB(255, 49, 49, 49),
                      child: Center(
                        child: Text(
                          "App Version 1.0",
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ))
                ]),
              ),
            )),
      ),
    );
  }
}
