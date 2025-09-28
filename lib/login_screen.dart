import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskamro/bnb.dart';
import 'package:taskamro/db_helper_user.dart';

import 'sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool showErrorEmail = false;
bool showErrorPassword = false;
bool obscureText = true;
bool rememberMe = false;

bool isEmail({required String em}) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(p);

  return regExp.hasMatch(em);
}

bool validatePassword(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

class _LoginScreenState extends State<LoginScreen> {
  DbHelperUser dbuser = DbHelperUser();

  @override
  void initState() {
    super.initState();
    saveDataLogin();
  }

  saveDataLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isRemembered = await prefs.getBool('remember_Me') ?? false;
    if (isRemembered) {
      rememberMe = true;
      emailController.text = await prefs.getString('email') ?? "";
      passwordController.text = await prefs.getString('password') ?? "";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Amro',
              style: GoogleFonts.italianno(
                fontSize: 85,
                foreground: Paint()
                  ..shader = LinearGradient(
                    colors: [Colors.cyanAccent, Colors.blueAccent],
                  ).createShader(Rect.fromLTWH(70, 500, 200, 70)),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hint: Text("Email Address"),
                label: Text('Email'),
                suffix: Icon(Icons.email),
                errorText: showErrorEmail ? "Invalid email" : null,
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: obscureText,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hint: Text("Password"),
                label: Text('Password'),
                suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: obscureText
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
                errorText: showErrorPassword ? 'Invalid Password' : null,
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {});
                    rememberMe = value!;
                  },
                ),
                Text('RememberMe?'),
              ],
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shadowColor: Colors.grey,
                  backgroundColor: Colors.blue,
                ),
                onPressed: () async {
                  setState(() {
                    showErrorEmail = !isEmail(em: emailController.text);
                    showErrorPassword = !validatePassword(
                      passwordController.text,
                    );
                  });
                  if (!showErrorPassword && !showErrorEmail) {
                    try {
                      final user = await dbuser.login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      if (rememberMe) {
                        await prefs.setBool('remember_Me', true);
                        await prefs.setString('email', emailController.text);
                        await prefs.setString(
                          'password',
                          passwordController.text,
                        );
                      } else {
                        await prefs.remove('remember_Me');
                        await prefs.remove('email');
                        await prefs.remove('password');
                      }
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => BnbScreen()),
                        (route) => false,
                      );
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: Text('Error'),
                            content: Text(e.toString()),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                  setState(() {});
                },
                child: Text('Login', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignUpScreen()),
                    );
                  },
                  child: Text('Sign Up', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
