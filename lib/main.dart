import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_dashboard/bloc/blocs.dart';
import 'package:admin_dashboard/api/cafeApi.dart';
import 'package:admin_dashboard/services/services.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/layouts/layouts.dart';

void main() async {
  BlocOverrides.runZoned(() async {
    runApp(const AppState());
  }, blocObserver: SimpleBlocObserver());
  await LocalStorage.configurePrefs();
  CafeApi.configureDio();
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(lazy: false, create: (_) => LoginBloc()),
          BlocProvider(lazy: false, create: (_) => RegisterBloc()),
          BlocProvider(lazy: false, create: (_) => SidemenuBloc()),
          BlocProvider(lazy: false, create: (_) => CategoriesBloc()),
          BlocProvider(lazy: false, create: (_) => UsersBloc()),
        ],
        child: Builder(builder: (context) {
          print('Ingreso');
          context.read<LoginBloc>().add(OnCheckLoginDataEvent());
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
        scaffoldMessengerKey: NotificationsService.messengerKey,
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
