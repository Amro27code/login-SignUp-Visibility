import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskamro/db_helper_user.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rPasswordController = TextEditingController();
  bool obsecureText = true;
  bool robsecureText = true;
  bool showErrorEmail = false;
  bool showErrorage = false;
  bool showErrorlName = false;
  bool showErrorfName = false;
  bool showErrorRPassword = false;
  bool showErrorPassword = false;

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  DbHelperUser dbuser = DbHelperUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up'), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
              SizedBox(height: 12),
              TextField(
                controller: fnameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hint: Text('First name'),
                  label: Text('First Name'),
                  errorText: showErrorfName ? "This Field required" : null,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: lnameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hint: Text('Last name'),
                  label: Text('Last Name'),
                  errorText: showErrorlName ? "This Field required" : null,
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hint: Text('Email'),
                  label: Text('Email Address'),
                  errorText: showErrorEmail ? 'Invalid Email' : null,
                  suffix: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                obscureText: obsecureText,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hint: Text('Password'),
                  label: Text('Password'),
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        obsecureText = !obsecureText;
                      });
                    },
                    icon: obsecureText
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  ),
                  errorText: showErrorPassword ? "Invalid Password" : null,
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: rPasswordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: robsecureText,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hint: Text('Reset Password'),
                  label: Text('Reset Password'),
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        robsecureText = !robsecureText;
                      });
                    },
                    icon: robsecureText
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  ),
                ),
              ),
              SizedBox(height: 8),
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
                      showErrorfName = fnameController.text.isEmpty
                          ? true
                          : false;
                      showErrorlName = lnameController.text.isEmpty
                          ? true
                          : false;
                      showErrorPassword =
                          (!validatePassword(passwordController.text) ||
                              passwordController.text !=
                                  rPasswordController.text)
                          ? true
                          : false;
                    });
                    if (fnameController.text.isNotEmpty &&
                        lnameController.text.isNotEmpty &&
                        !showErrorEmail &&
                        !showErrorPassword)
                    {
                      final id = await dbuser.signUp(
                        firstname: fnameController.text,
                        lastname: lnameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      if (id > 0) {
                        Navigator.pop(context);

                      } else {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: Text('Error'),
                              content: Text('Error'),
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
                     // Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                      splashFactory: NoSplash.splashFactory,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Login', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
