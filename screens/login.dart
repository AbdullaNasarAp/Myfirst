import 'package:flutter/material.dart';
import 'package:myfirstproject/main.dart';
import 'package:myfirstproject/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatefulWidget {
  Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _UsernameController = TextEditingController();

  final _PasswordController = TextEditingController();

  bool _isDataMatched = true;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/image/image (1).png',
                  height: 100,
                  width: 100,
                ),

                const Text(
                  'Login',
                  style: TextStyle(fontSize: 30, fontFamily: 'Fredoka One'),
                ),
                const SizedBox(
                  height: 40,
                ),
                // Username

                TextFormField(
                  controller: _UsernameController,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    hintText: 'Username',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "value is empty";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                // password
                TextFormField(
                  controller: _PasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "value is empty";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !_isDataMatched,
                      child: const Text(
                        "Username Password Doesn't Match !!!",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          checklogin(context);
                        } else {
                          print("Data is Empty");
                        }

                        //  checklogin(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 20,
                        primary: Colors.black,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30.0,
                          ),
                        ),
                      ),
                      icon: const Icon(
                        Icons.check,
                        color: Colors.orange,
                      ),
                      label: const Text(
                        'login',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checklogin(BuildContext ctx) async {
    final _username = _UsernameController.text;
    final _password = _PasswordController.text;

    if (_username == 'vegopedia' && _password == '12345') {
      //  go to home

      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_NAME, true);

      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const Homescreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(20),
          content: Text("Username Password Does'nt Match"),
        ),
      );
    }
  }
}
