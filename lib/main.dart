import 'package:firebase_core/firebase_core.dart';
import 'package:splitwise_clone/res/app_imports.dart';
import 'package:splitwise_clone/core/di_services/injections.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyB6zwaktmTZxjY37x73W4mohT5lnkC0IAQ',
          appId: '1:297647669570:android:8f4db1749347c79c2288db',
          messagingSenderId: '',
          projectId: 'splitwiseclone-6597f'
      )
  );

  await initDependencies();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, orientation){
      return OrientationBuilder(builder: (context, orientation){
        return MaterialApp.router(
          title: AppStrings.appName,
          routerConfig: appRoutes,
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a blue toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
        );
      });
    });
  }
}

