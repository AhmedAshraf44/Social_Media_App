import 'package:go_router/go_router.dart';

import '../../feature/login/presentation/view/login_view.dart';
import '../../feature/register/presentation/view/register_view.dart';

abstract class AppRouter {
  static const kRegisterView = '/RegisterView';
//  static const kHomeLayoutView = '/HomeLayoutView';

  static GoRouter router =
      //({required String initialRoute}) {

      //return
      // initialLocation: initialRoute,
      GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: kRegisterView,
      builder: (context, state) => const RegisterView(),
    ),
    // GoRoute(
    //   path: kHomeLayoutView,
    //   builder: (context, state) => const AppLayoutView(),
    // ),
  ]);
}
