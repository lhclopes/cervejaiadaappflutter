import 'package:cervejaiadaappflutter/repositories/experience_level_repository.dart';
import 'package:cervejaiadaappflutter/repositories/languages_repository%20copy.dart';
import 'package:flutter/material.dart';

class NewUser extends StatefulWidget {
  const NewUser({super.key, required this.title});

  final String title;

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  var userController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var birthdayController = TextEditingController();
  DateTime? birthday;

  var experienceLevelRepository = ExperienceLevelRepository();
  var languagesRepository = LanguagesRepository();

  var experienceLevelList = [];
  var languageList = [];
  var selectedExperienceLevel;
  var selectedLanguages = [];
  var selectedSalary = 0.0;
  var experienceTime = 0;

  var saving = false;

  List<DropdownMenuItem> returnItens(int max) {
    var itens = <DropdownMenuItem>[];
    for (var i = 0; i <= max; i++) {
      itens.add(DropdownMenuItem(value: i, child: Text(i.toString())));
    }
    return itens;
  }

  @override
  void initState() {
    experienceLevelList = experienceLevelRepository.returnExperienceLevels();
    languageList = languagesRepository.returnLanguages();
    super.initState();
  }

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
        child: saving
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  TextFormField(
                    controller: userController,
                    style: const TextStyle(color: Colors.black),
                    decoration: inputStyle(
                        label: 'User', hint: 'Place your Username here.'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.black),
                    decoration: inputStyle(
                        label: 'Email', hint: 'Place your Email here.'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: birthdayController,
                    style: const TextStyle(color: Colors.black),
                    decoration: inputStyle(
                        label: 'Birthday', hint: 'Place your Birthday here.'),
                    onTap: () async {
                      var date = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000, 1, 1),
                          firstDate: DateTime(1900, 1, 1),
                          lastDate: DateTime.now());
                      if (date != null) {
                        birthdayController.text = date.toString();
                        birthday = date;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Experience Level '),
                  Column(
                    children: experienceLevelList
                        .map(
                          (experienceLevel) => RadioListTile(
                            title: Text(experienceLevel),
                            selected:
                                selectedExperienceLevel == experienceLevel,
                            value: experienceLevel,
                            groupValue: selectedExperienceLevel,
                            onChanged: (value) {
                              setState(() {
                                selectedExperienceLevel = value.toString();
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
                  const Text('Prefered Languages'),
                  Column(
                    children: languageList
                        .map((language) => CheckboxListTile(
                            dense: true,
                            title: Text(language),
                            value: selectedLanguages.contains(language),
                            onChanged: (bool? value) {
                              if (value!) {
                                setState(() {
                                  selectedLanguages.add(language);
                                });
                              } else {
                                setState(() {
                                  selectedLanguages.remove(language);
                                });
                              }
                            }))
                        .toList(),
                  ),
                  const Text('Experience Time'),
                  DropdownButton(
                      value: experienceTime,
                      isExpanded: true,
                      items: returnItens(50),
                      onChanged: (value) {
                        setState(() {
                          experienceTime = int.parse(value.toString());
                        });
                      }),
                  Text('Salary > R\$ ${selectedSalary.round().toString()}'),
                  Slider(
                      min: 0,
                      max: 10000,
                      value: selectedSalary,
                      onChanged: (double value) {
                        setState(() {
                          selectedSalary = value;
                        });
                      }),
                  TextButton(
                    onPressed: () {
                      print(userController.text);
                      print(emailController.text);
                      print(birthdayController.text);
                      print(selectedExperienceLevel);
                      print(selectedLanguages);
                      print(experienceTime);
                      print(selectedSalary);

                      setState(() {
                        saving = true;
                      });
                      Future.delayed(const Duration(seconds: 2), () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Saved Sucessfully'))
                        );
                        setState(() {
                          saving = false;
                        });
                        Navigator.pop(context);
                      });
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
      ),
    );
  }
}
