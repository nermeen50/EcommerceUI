import 'package:flutter/material.dart';
import 'package:test_ecommerce/componant/defultTextField.dart';
import 'package:test_ecommerce/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController editingController = TextEditingController();
  List<String> userSearch = [];
  List<String> allUsers = [
    "nermeen",
    "samy",
    "kamal",
    "mohamed",
    "nnnndnf",
    "sdff",
    "mofkk",
    "ahmed",
    "dkkffk"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                DefultTextField(
                  colorFill: kSecondaryColor,
                  fillBool: true,
                  // funSaved: () {},
                  funcOnChange: (value) {
                    setState(() {
                      userSearch = allUsers
                          .where((element) => element
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                  inputIcon: editingController.text.isNotEmpty
                      ? TextButton(
                          child: Icon(
                            Icons.close,
                            color: mainColor,
                          ),
                          onPressed: () {
                            userSearch.clear();
                            editingController.clear();
                            setState(() {
                              editingController.text = '';
                            });
                          },
                        )
                      : null,
                  labelText: "",
                  hintText: "Search ...........",
                  textObscure: false,
                  valitateFunction: null,
                  iconPrefix: Icon(Icons.search),
                  controller: editingController,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.sort),
                      onPressed: () {
                        _settingModalBottomSheet(
                            context, 'Sort Form A To Z', 'Sort Form Z To A',
                            () {
                          setState(() {
                            Navigator.of(context).pop();
                            allUsers.sort((a, b) => a.compareTo(b));
                          });
                        }, () {
                          setState(() {
                            Navigator.of(context).pop();
                            allUsers.sort((b, a) => a.compareTo(b));
                          });
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.filter_alt_rounded),
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  height: 500,
                  width: double.infinity,
                  child: editingController.text.isNotEmpty && userSearch.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.search_off),
                              Text("NO Result"),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: editingController.text.isNotEmpty
                              ? userSearch.length
                              : allUsers.length,
                          itemBuilder: (context, index) => Card(
                            // key: ValueKey(allUsers[index]),
                            color: Colors.amberAccent,
                            elevation: 4,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              leading: Text(
                                editingController.text.isNotEmpty
                                    ? userSearch[index]
                                    : allUsers[index],
                                style: TextStyle(fontSize: 24),
                              ),
                              title: Text(editingController.text.isNotEmpty
                                  ? userSearch[index]
                                  : allUsers[index]),
                              subtitle: Text(
                                  '${editingController.text.isNotEmpty ? userSearch[index] : allUsers[index]} years old'),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _settingModalBottomSheet(
      context, String text1, text2, Function fun1, fun2) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text(text1),
                    onTap: fun1),
                new ListTile(
                  leading: new Icon(Icons.videocam),
                  title: new Text(text2),
                  onTap: fun2,
                ),
              ],
            ),
          );
        });
  }
}
