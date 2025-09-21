import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mr_potato.dart';
import 'sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
TextEditingController emailController=TextEditingController();
TextEditingController passwordController=TextEditingController();
bool showErrorEmail=false;
bool showErrorPassword=false;
bool obscureText = true;
bool isEmail({required String em}) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp =  RegExp(p);

    return regExp.hasMatch(em);
  }bool validatePassword(String value){
  String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp =  RegExp(pattern);
  return regExp.hasMatch(value);
}
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Login',style: TextStyle(fontWeight: FontWeight.w400),) ,backgroundColor: Colors.blue,),
      body:
      Padding(padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Amro',style: GoogleFonts.italianno(fontSize: 85,foreground: Paint()
        ..shader = LinearGradient(
          colors: [
            Colors.cyanAccent,
            Colors.blueAccent,
          ],
        ).createShader(Rect.fromLTWH(70, 500, 200, 70)),
      ),),
          SizedBox(height: 10,),
          TextField(
            controller:emailController ,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8)
              ),
              hint: Text("Email Address"),
              label: Text('Email'),
              suffix: Icon(Icons.email),
              errorText: showErrorEmail ? "Invalid email" : null,
            ),
          ),
          SizedBox(height: 11
            ,),
          TextField(
            controller:passwordController ,
            keyboardType: TextInputType.visiblePassword,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              hint: Text("Password"),
              label: Text('Password'),
              suffix: IconButton(
                  onPressed: (){
                setState(() {obscureText=!obscureText;});
              }, icon:obscureText?Icon(Icons.visibility):Icon(Icons.visibility_off) ),
              errorText:showErrorPassword? 'Invalid Password':null,
            ),
          ),
          SizedBox(height: 10,),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 3,shadowColor: Colors.grey,backgroundColor: Colors.blue),
                onPressed: (){
              setState(() {showErrorEmail= !isEmail(em: emailController.text);
                showErrorPassword=!validatePassword(passwordController.text);             });
              if(!showErrorPassword&& !showErrorEmail){
                Navigator.push(context,
                    MaterialPageRoute(builder: (_)=>
                        MrPotato()
                    )
                );
              }
             }, child: Text('Login',style: TextStyle(color: Colors.white),)),
          ),
          SizedBox(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account?'),
                    TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                          splashFactory: NoSplash.splashFactory,
                        ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpScreen()));
                    },
                    child: Text('Sign Up',style: TextStyle(color: Colors.blue))),
            ],
          )
        ],
      ),
      ),
    );
  }
}