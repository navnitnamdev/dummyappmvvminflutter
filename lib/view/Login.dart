import 'dart:convert';
import 'dart:io';
import 'dart:math';


import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/AppColor.dart';
import '../constants/StylleFile.dart';
import '../constants/TextFile.dart';
import '../customcomponants/CustomAppBar.dart';
import '../customcomponants/CustomElevationButton.dart';
import '../customcomponants/CustomTextField.dart';
import '../viewmodal/LoginViewModel.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();
  TextEditingController controllercaptcha = TextEditingController();
  var hashedPassword;
  var HASHpassword;
  var RandomNumber = 0;
  var RandomNumber1 = 0;
  var addcaptcha = 0;
  var random = 0;
  var RandomNumbersalt = 0;
  var random1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});

    random = generateRandomString(6);
  }

  void _checkPasswordStrength(String password) {
    setState(() {
    });
  }



  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        showBackButton: false,
        title: 'Login dummy app(Network Api)',
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                TextFile.login,
                style: StyleFile.TextColorWhiteSize25,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  TextFile.loginid,
                  style: StyleFile.TextColorWhiteSize16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: controlleremail,
                hintText: "Enter login id",
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  // Handle username changes
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  TextFile.password,
                  style: StyleFile.TextColorWhiteSize16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: controllercaptcha,
                hintText: "Enter password",
                keyboardType: TextInputType.text,
                onChanged: (password) {
                  _checkPasswordStrength(password);
                  var bytes = utf8.encode(password);
                  var digest = sha512.convert(bytes);
                  hashedPassword = digest.toString().toUpperCase();
                  HASHpassword = hashedPassword + RandomNumbersalt.toString();
                  print("SHA-512 Hash: $HASHpassword");
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 90,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 5),
                      margin: const EdgeInsets.only(left: 0, right: 50),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4)),
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Center(
                          child: Text(
                            '$RandomNumber'
                                " + "
                                '$RandomNumber1 =  ?',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.transparent,
                        child: IconButton(
                            color: Colors.black,
                            onPressed: () {
                              setState(() {
                                random = generateRandomString(6);
                              });
                            },
                            icon: Center(child: Icon(Icons.refresh))),
                      )),
                ],
              ),
              CustomTextField(
                controller: controllerpassword,
                hintText: TextFile.enterpassword,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  // Handle username changes
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomElevationButton(
                backgroundColor: AppColor.blue,
                textcolor: AppColor.elevationbuttontextcolor,
                onPressed: () async {
                  try {
                    final result = await InternetAddress.lookup('example.com');
                    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {

                      var data= {

                        "LoginId": controlleremail.text.toString(),
                        "Password": HASHpassword.toString(),
                        "txtSaltedHash": RandomNumbersalt.toString()

                      };

                      viewModel.loginApi(data, context);
                      //viewModel.login(context, controlleremail.text, HASHpassword, RandomNumbersalt.toString());

                      print('connected');
                      print('connected_email' +controlleremail.text.toString() );
                      print('connected_pass' +HASHpassword.toString() );
                      print('connected_rand' +RandomNumbersalt.toString() );
                    }
                  } on SocketException catch (_) {
                    print('not connected');
                  }
                },
                child: viewModel.isLoading == true
                    ? const CircularProgressIndicator(
                  color: Colors.white,
                )
                    : Text(TextFile.submit),
              )
            ],
          ),
        ),
      ),
    );
  }

  int generateRandomString(int len) {
    int max = 15;
    RandomNumber = Random().nextInt(max);
    RandomNumber1 = Random().nextInt(max);
    addcaptcha = RandomNumber + RandomNumber1;
    RandomNumbersalt = Random().nextInt(max);
    print("randomnumber$RandomNumbersalt");
    print("ramndomnumber$addcaptcha");

    return addcaptcha.toInt();
  }
}
