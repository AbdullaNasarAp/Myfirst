import 'package:flutter/material.dart';
import 'package:myfirstproject/main.dart';
import 'package:myfirstproject/screens/home.dart';
import 'package:myfirstproject/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    checkedUserLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Image.asset(
                'asset/image/image (1).png',
                height: 200,
              ),
            ),
            const CircularProgressIndicator(
              color: Colors.orange,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotologin() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => Loginscreen(),
      ),
    );
  }

  Future<void> checkedUserLoggedIn() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _UserLoggedIn = _sharedPrefs.getBool(SAVE_NAME);
    if (_UserLoggedIn == null || _UserLoggedIn == false) {
      gotologin();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => Homescreen()));
    }
  }
}
