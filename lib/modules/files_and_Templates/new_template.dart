import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_group_list/custom_radio_group_list.dart';

const List<String> list = <String>[
  'Text',
  'Date',
  'Unique Option',
  'Multiple Options'
];

class NewTemplate extends StatefulWidget {
  const NewTemplate({Key? key}) : super(key: key);

  @override
  State<NewTemplate> createState() => _NewTemplateState();
}

class _NewTemplateState extends State<NewTemplate> {
  bool showView = false;
  String dropdownValue = list.first;
  int selectedLang = 0;
  bool isSelectedLang = false;

  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Required';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Not Required';
      });
      print('Switch Button is OFF');
    }
  }

  void toggleLanguage(bool value) {
    if (isSelectedLang == false) {
      setState(() {
        isSelectedLang = true;
        selectedLang = 0;
      });
    } else {
      setState(() {
        isSelectedLang = false;
        selectedLang = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Files and Templates"),
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 10, end: 10),
            badgeContent: const Text("1"),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_alert_outlined),
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[Colors.purple, Colors.blue]),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/photos/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Basic information"),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "Template Title",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Template Title",
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    RadioGroup(
                      radioList: const ['English', 'العربية'],
                      selectedItem: selectedLang,
                      onChanged: (value) {
                        setState(() {
                          toggleLanguage;
                        });
                      },
                    ),
                  ],
                ),
                TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Template description",
                      labelText: "Template description",
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text('Questions'),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      showView = !showView;
                    });
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("New Question"),
                ),
                Visibility(
                  visible: showView,
                  child: Column(
                    children: [
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              TextFormField(
                                maxLines: 1,
                                decoration: InputDecoration(
                                  labelText: "Question title",
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  hintText: "Template Title",
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Switch(
                                    onChanged: toggleSwitch,
                                    value: isSwitched,
                                    activeColor: Colors.purple,
                                    activeTrackColor: Colors.red,
                                    inactiveThumbColor: Colors.redAccent,
                                    inactiveTrackColor: Colors.blueAccent,
                                  ),
                                  Text(
                                    textValue,
                                    style: const TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  TextButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        showView = !showView;
                                      });
                                    },
                                    label: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.purple),
                                    ),
                                    icon: const Icon(
                                      Icons.cancel,
                                      color: Colors.purple,
                                    ),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {},
                                    label: const Text(
                                      'Save',
                                      style: TextStyle(color: Colors.purple),
                                    ),
                                    icon: const Icon(
                                      Icons.save_alt,
                                      color: Colors.purple,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('Save'),
                  icon: const Icon(Icons.save),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
