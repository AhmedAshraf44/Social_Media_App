import 'package:go_router/go_router.dart';

import '../../feature/login/presentation/view/login_view.dart';
import '../../feature/new_post/presentation/view/new_post_view.dart';
import '../../feature/register/presentation/view/register_view.dart';
import '../../feature/layout/presentation/view/social_layout.dart';

abstract class AppRouter {
  static const kRegisterView = '/RegisterView';
  static const kSocialLayoutView = '/SocialLayoutView';
  static const kNewPostView = '/NewPostView';

  static GoRouter router({required String initialRoute}) {
    return GoRouter(initialLocation: initialRoute, routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kSocialLayoutView,
        builder: (context, state) => const SocialLayoutView(),
      ),
      GoRoute(
        path: kNewPostView,
        builder: (context, state) => const NewPostView(),
      ),
    ]);
  }
}
