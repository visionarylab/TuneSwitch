import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

import './providers/auth.dart';
import './pages/homePage.dart';
import './pages/login_page.dart';
import './pages/registrationPage.dart';

Future<void> main() async {
  await DotEnv().load('.env');
  await SpotifySdk.connectToSpotifyRemote(
      clientId: DotEnv().env['CLIENT_ID'],
      redirectUrl: DotEnv().env['REDIRECT_URL']);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => User(),
        child: Consumer<User>(
            builder: (ctx, auth, _) => MaterialApp(
                  title: 'TuneSwitch',
                  theme: ThemeData(
                      primarySwatch: Colors.indigo,
                      accentColor: Colors.deepPurpleAccent,
                      fontFamily: 'Minecraft'),
                  home: FutureBuilder(
                      future: auth.isloggedin(),
                      builder: (_, snapshot) =>
                          (snapshot.data != null && snapshot.data)
                              ? HomePage()
                              : LoginScreen()),
                  routes: {
                    LoginScreen.routeName: (ctx) => LoginScreen(),
                    HomePage.routeName: (ctx) => HomePage(),
                    RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
                  },
                )));
  }
}
