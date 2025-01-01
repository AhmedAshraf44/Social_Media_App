import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/bloc_observer.dart';
import 'package:social_app/core/utils/app_router.dart';
import 'package:social_app/core/utils/cache_helper.dart';
import 'core/functions/app_theme_data.dart';
import 'feature/layout/presentation/manger/social_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var uId = CacheHelper.getData(key: 'uId');
  // print(uId);
  late String initialRoute;

  if (uId == null) {
    initialRoute = '/';
  } else {
    initialRoute = AppRouter.kSocialLayoutView;
  }
  runApp(SocialApp(
    initialRoute: initialRoute,
  ));
}

class SocialApp extends StatelessWidget {
  const SocialApp({super.key, required this.initialRoute});
  final String initialRoute;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialCubit()..getUser(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router(initialRoute: initialRoute),
        themeMode: ThemeMode.light,
        theme: appThemeData(),
        darkTheme: appdarkThemeData(),
      ),
    );
  }
}
