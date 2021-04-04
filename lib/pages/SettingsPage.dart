import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<String> languages = ['EN', 'UA', 'RU'];
  String currentLanguage;

  @override
  void initState() {
    super.initState();
    currentLanguage = languages[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.pink, Colors.white])),
        ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.language),
                title: Text('Language'),
                trailing: DropdownButton<String>(
                  value: currentLanguage,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String newValue) {
                    setState(() {
                      currentLanguage = newValue;
                    });
                  },
                  underline: Container(),
                  items:
                      languages.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed(Routes.TIME);
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(
                        hour: DateTime.now().hour,
                        minute: DateTime.now().minute),
                  );
                },
                child: Card(
                  child: ListTile(
                      leading: Icon(Icons.access_time),
                      title: Text('Time'),
                      trailing: Icon(Icons.arrow_right)),
                ),
                style:
                TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                )),
            TextButton(
              onPressed: () {
                // Navigator.of(context).pushNamed(Routes.TIME);
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      contentPadding: const EdgeInsets.all(16.0),
                      content: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter device",
                        ),
                      ),
                      actions: <Widget>[
                        new TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        new TextButton(
                            child: const Text('Connect'), onPressed: () {})
                      ],
                    );
                  },
                );
              },
              child: Card(
                child: ListTile(
                    leading: Icon(Icons.wifi),
                    title: Text('Connect device'),
                    trailing: Icon(Icons.arrow_right),),
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
