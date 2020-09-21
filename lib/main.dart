import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:ned_template/core/application.dart';
import 'package:ned_template/core/repositories/auth_repository.dart';
import 'package:ned_template/core/routes.dart';
import 'package:ned_template/features/auth/bloc/auth_bloc.dart';
import 'package:ned_template/features/auth/bloc/auth_state.dart';
import 'package:ned_template/utils/locale/app_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final app = Application();
  await app.setup();
  await app.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthBloc>.value(value: app.authBloc),
    ],
    child: MyApp(app: app),
  ));
}

class MyApp extends StatefulWidget {
  final Application app;

  MyApp({Key key, this.app}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _naviKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepository>.value(
              value: widget.app.authRepository),
        ],
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return GetMaterialApp(
              locale: const Locale('vi'),
              navigatorKey: _naviKey,
              color: Colors.blue,
              theme: ThemeData(
                inputDecorationTheme: InputDecorationTheme(),
                // fontFamily:
              ),
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [Locale('vi'), Locale('en')],
              debugShowCheckedModeBanner: false,
              onGenerateRoute: routes(application: widget.app),
            );
          },
        ),
      ),
    );
  }
}
