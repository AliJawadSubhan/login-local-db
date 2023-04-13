import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('login'),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter name here...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter  pas here...',
                  border: OutlineInputBorder(),
                ),
              ),
              TextButton(
                onPressed: () async {
                  var sharedPref = await SharedPreferences.getInstance();
                  sharedPref.setBool("Login", true);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => HomeView()));
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
      ),
    );
  }
}
