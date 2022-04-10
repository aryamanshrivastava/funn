import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:requests/requests.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final _formKey = GlobalKey<FormState>();

class _HomePageState extends State<HomePage> {
  late String u;
  String r = "Send";
  void getdata(String value) async {
    var r = await Requests.get('https://api.isevenapi.xyz/api/iseven/$value/');
    r.raiseForStatus();
    String body = r.content();
    var jsdata = jsonDecode(body);
    print(jsdata['iseven']);
  }

  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: nameController,
                style: TextStyle(fontSize: 20, color: Colors.black),
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter input';
                  } else {
                    u = value;
                    return null;
                  }
                },
                decoration: InputDecoration(
                    fillColor: Color(0xffffffff),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                    ),
                    hintText: 'Input',
                    prefixIcon: Icon(
                      Icons.input_outlined,
                      color: Color(0xff000000),
                    ),
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color(0xffC9C9C9))),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      getdata(u);
                    });
                  }
                },
                child: Text(
                  '$r',
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  elevation: 10,
                  primary: Color(0xff9B4BFF),
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.2,
                      vertical: MediaQuery.of(context).size.height * 0.015),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
