import 'package:flutter/material.dart';
import 'package:practise01/login.dart';

import 'home.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

final _formmKey = GlobalKey<FormState>();

class _SignupPageState extends State<SignupPage> {
  late TextEditingController textController;
  late TextEditingController textController1;
  late bool passwordVisibility;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    textController1 = TextEditingController();
    passwordVisibility = false;
  }

  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Form(
            key: _formmKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Sign up",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Create an account, It's free",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter e-mail address';
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Enter valid Email';
                    } else {
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
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: 'Email Id',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color(0xff000000),
                      ),
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Color(0xffC9C9C9))),
                ),
                TextFormField(
                  controller: textController,
                  obscureText: !passwordVisibility,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.black38),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: Icon(
                      Icons.vpn_key_outlined,
                      color: Colors.black,
                    ),
                    suffixIcon: InkWell(
                        onTap: () => setState(
                              () => passwordVisibility = !passwordVisibility,
                            ),
                        child: Icon(
                          passwordVisibility
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.black,
                          size: 22,
                        )),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter password';
                    } else if (value.length < 5 ||
                        int.tryParse(value) == null) {
                      return 'Enter valid password';
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.start,
                ),
                TextFormField(
                  controller: textController1,
                  obscureText: !passwordVisibility,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(color: Colors.black38),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: Icon(
                      Icons.vpn_key_outlined,
                      color: Colors.black,
                    ),
                    suffixIcon: InkWell(
                        onTap: () => setState(
                              () => passwordVisibility = !passwordVisibility,
                            ),
                        child: Icon(
                          passwordVisibility
                              ? null
                              : Icons.visibility_off_outlined,
                          color: Colors.black,
                          size: 22,
                        )),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Confirm password';
                    } else if (value.length < 4 ||
                        int.tryParse(value) == null) {
                      return 'Enter valid password';
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.start,
                ),
                Container(
                  padding: EdgeInsets.only(top: 2, left: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      )),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () async {
                      if (_formmKey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      }
                    },
                    color: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Sign up",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage()));
                      },
                      child: Text(
                        " Login",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
