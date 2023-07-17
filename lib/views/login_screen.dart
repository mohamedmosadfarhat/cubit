import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_layout.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  var validateKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: validateKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Column(
                  children:
                  [
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'email address must not be empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value)
                      {
                        if(value!.length < 6)
                        {
                          return 'password must be bigger than 6 ';
                        }
                        return null;
                      },
                      obscureText: isPassword,
                      decoration:  InputDecoration(
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                          icon: Icon(
                            isPassword ?Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 40,),
                    MaterialButton(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      padding: const EdgeInsetsDirectional.all(10),
                      color: Colors.blue,
                      shape: Border.all(),
                      minWidth: double.infinity,
                      onPressed: ()
                      {
                        if(validateKey.currentState!.validate())
                        {
                          saveEmail(emailController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=> HomeScreen()),
                          );
                        }
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  saveEmail(String email)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
  }
}
