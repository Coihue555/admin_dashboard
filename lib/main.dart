import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_dashboard/bloc/blocs.dart';
import 'package:admin_dashboard/services/services.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/layouts/layouts.dart';

void main() async {
  BlocOverrides.runZoned(() async {
    runApp(AppState());
  }, blocObserver: SimpleBlocObserver());
  await LocalStorage.configurePrefs();
  Flurorouter.configureRoutes();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(lazy: false, create: (_) => LoginBloc()),
          BlocProvider(create: (_) => RegisterBloc()),
        ],
        child: Builder(builder: (context) {
          
          return MyApp();
        }));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Admin Dashboard',
        initialRoute: '/',
        onGenerateRoute: Flurorouter.router.generator,
        navigatorKey: NavigationService.navigatorKey,
        builder: (_, child) {
          return BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state.authStatus == AuthStatus.checking) {
                print('Autenticando');
                return SplashLayout();
              }
              if (state.authStatus == AuthStatus.authenticated) {
                print('Dashboard');
                return DashboardLayout(child: child!);
              } else {
                print('Auth');
                return AuthLayout(child: child!);
              }
            },
          );
        },
        theme: ThemeData.light().copyWith(
            scrollbarTheme: const ScrollbarThemeData().copyWith(
                thumbColor:
                    MaterialStateProperty.all(Colors.grey.withOpacity(0.3)))));
  }
}
