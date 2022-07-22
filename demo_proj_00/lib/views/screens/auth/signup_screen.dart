import 'dart:typed_data';

import 'package:demo_proj_00/controllers/auth_controller.dart';
import 'package:demo_proj_00/views/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../const.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullName_Controller = TextEditingController();
  final TextEditingController _userName_Controller = TextEditingController();
  final TextEditingController _email_Controller = TextEditingController();
  final TextEditingController _password_Controller = TextEditingController();

  Uint8List? _image;
  bool _isLoading = false;
  selectImage() async {
    Uint8List im = await AuthController().pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthController().signUpUsers(
        _fullName_Controller.text,
        _userName_Controller.text,
        _email_Controller.text,
        _password_Controller.text,
        _image);

    setState(() {
      _isLoading = false;
    });

    if (res != 'success') {
      return showSnackBar(res, context);
    } else {
      return showSnackBar(
          'Congradulations Account created Successfully', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'SignUp Screen',
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 65,
                          backgroundColor: Colors.blue,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : CircleAvatar(
                          radius: 65,
                          backgroundColor: Colors.blue,
                          backgroundImage: NetworkImage(
                            "https://www.kindpng.com/picc/m/21-214439_free-high-quality-person-icon-default-profile-picture.png",
                          ),
                        ),
                  Positioned(
                    child: InkWell(
                      onTap: selectImage,
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.black,
                      ),
                    ),
                    right: 5,
                    bottom: 20,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _fullName_Controller,
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    labelText: 'Name',
                    hintText: 'Enter your name'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _userName_Controller,
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    labelText: 'Username',
                    hintText: 'Enter Username in small char'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _email_Controller,
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    labelText: 'Email',
                    hintText: 'Enter your Email address'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _password_Controller,
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    labelText: 'Password',
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                decoration: BoxDecoration(
                  color: buttonColor,
                ),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      signUpUser();
                      _fullName_Controller.clear();
                      _userName_Controller.clear();
                      _email_Controller.clear();
                      _password_Controller.clear();
                    },
                    child: _isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Register',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        (MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        )),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
