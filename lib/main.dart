import 'dart:io';

import 'package:dummymvvmapp/repository/PwsRepository.dart';
import 'package:dummymvvmapp/repository/SibRepository.dart';
import 'package:dummymvvmapp/sharedpreference/PreferenceUtils.dart';
import 'package:dummymvvmapp/view/SplashScreen.dart';
import 'package:dummymvvmapp/viewmodal/LoginViewModel.dart';
import 'package:dummymvvmapp/viewmodal/PwsViewModal.dart';
import 'package:dummymvvmapp/viewmodal/SibApproveViewModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/network/ConnectivityService.dart';
import 'repository/LoginRepository.dart';

void main()  async{

  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await PreferenceUtils.init();

  final LoginRepository loginRepository = LoginRepository();
  final PwsRepository pwslistrepository = PwsRepository();
  final SibRepository sibRepo = SibRepository();

  runApp(   MultiProvider(
    providers: [
      ChangeNotifierProvider<LoginViewModel>(create: (context) => LoginViewModel(loginrepo:loginRepository),),
      ChangeNotifierProvider<PwsListViewmodal>(create: (context) => PwsListViewmodal(pwsRepository: pwslistrepository)),
      ChangeNotifierProvider<SibApproveViewModal>(create: (context) => SibApproveViewModal(sibRepository: sibRepo,  connectivityService: ConnectivityService(),)),
     // ChangeNotifierProvider<SuperheroViewModel>(create: (context) => SuperheroViewModel(repository: superheroRepository),),



    ],
    child: MyApp(),
  ),);
  await PreferenceUtils.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,

      home: const SplashScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}