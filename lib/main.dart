import "package:firebase_auth/firebase_auth.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:organizer_rodzinny/screens/auth/auth_screen.dart';
import 'package:organizer_rodzinny/screens/auth/splash_screen.dart';
import 'package:organizer_rodzinny/screens/main_screen.dart';
import 'package:organizer_rodzinny/services/app_router.dart';
import "package:organizer_rodzinny/theme_config.dart";
import 'package:path_provider/path_provider.dart';

import "blocs/bloc_exports.dart";
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ShoppingListBloc()),
        BlocProvider(create: (context) => RecipesBloc()),
        BlocProvider(create: (context) => AppStateBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData.from(
          colorScheme: schemeLight,
        ).copyWith(
          textTheme: themeConfig["textTheme"],
          appBarTheme: themeConfig["appBarTheme"],
        ),
        darkTheme: ThemeData.from(
          colorScheme: schemeDark,
        ).copyWith(
          textTheme: themeConfig["textTheme"],
          appBarTheme: themeConfig["appBarTheme"],
        ),
        // home: const MainScreen(),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            }

            if (snapshot.hasData) {
              context
                  .read<AppStateBloc>()
                  .add(SetUserId(id: snapshot.data!.uid));
              GetStorage().write('uid', snapshot.data!.uid);
              return const MainScreen();
            }

            return const AuthScreen();
          },
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
