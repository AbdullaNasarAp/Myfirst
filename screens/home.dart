import 'package:flutter/material.dart';

import 'package:myfirstproject/screens/login.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 30.0,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100.0),
            bottomRight: Radius.circular(100.0),
          ),
        ),
        backgroundColor: Colors.orange,
        title: const Text(
          'Welcome To Vegopedia',
          style: TextStyle(color: Colors.black, fontFamily: 'Fredoka One'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              Signout(context);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SafeArea(
          child: ListView.separated(
              itemBuilder: (ctx, index) {
                if (index == 0) {
                  return Image.asset('asset/image/promo_banner.jpg');
                } else if (index % 2 == 0) {
                  return ListTile(
                    title: const Text(
                      "Tomato",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("'Order now \n 60% off\n₹99'"),
                    trailing: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                      label: const Text(
                        "Buy",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                      ),
                    ),
                    leading: (Image.asset(
                        'asset/image/[removal.ai]_tmp-62f0db5a3feac.png')),
                  );
                } else {
                  return ListTile(
                    title: const Text(
                      "Onion",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("Order now \n 60% off\n₹109"),
                    trailing: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                      label: const Text(
                        "Buy",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                      ),
                    ),
                    leading: const CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage('asset/image/ulli.png')),
                  );
                }
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: 20),
        ),
      ),
    );
  }

  Signout(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => Loginscreen()), (route) => false);
  }
}
