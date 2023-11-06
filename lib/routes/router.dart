import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/auth_pages/forgot_pass_account_verify.dart';
import 'package:food_recipe_app/pages/auth_pages/forgot_password.dart';
import 'package:food_recipe_app/pages/auth_pages/otp_page.dart';
import 'package:food_recipe_app/pages/auth_pages/reset_password_page.dart';
import 'package:food_recipe_app/pages/auth_pages/signup_page.dart';
import 'package:food_recipe_app/pages/change_theme.dart';
import 'package:food_recipe_app/pages/edit_profile_page.dart';
import 'package:food_recipe_app/pages/auth_pages/login_page.dart';
import 'package:food_recipe_app/pages/help_support.dart';
import 'package:food_recipe_app/pages/main_screen.dart';
import 'package:food_recipe_app/pages/notifications_page.dart';
import 'package:food_recipe_app/pages/privacy.dart';
import 'package:food_recipe_app/pages/profile_page.dart';
import 'package:food_recipe_app/pages/recipe_information_page.dart';
import 'package:food_recipe_app/pages/report_problem.dart';
import 'package:food_recipe_app/pages/settings_page.dart';
import 'package:food_recipe_app/pages/suggest_feature.dart';
import 'package:food_recipe_app/routes/router_constants.dart';
import 'package:food_recipe_app/services/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRouter {
  Future<String?> _redirect(BuildContext context, GoRouterState state) async {
    await context.read<AuthProvider>().getToken();
    final token = context.read<AuthProvider>().accessToken;
    final bool isLoggedIn = context.read<AuthProvider>().isLoggedIn;

    bool isAuthenticated = isLoggedIn && token.isNotEmpty ? true : false;
    if (!isAuthenticated) {
      return '/login';
    }
    return null;
  }

  GoRouter router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) async {
      await context.read<AuthProvider>().getToken();
      final token = context.read<AuthProvider>().accessToken;
      final bool isLoggedIn = context.read<AuthProvider>().isLoggedIn;

      bool isAuthenticated = isLoggedIn && token.isNotEmpty ? true : false;
      if (!isAuthenticated) {
        return '/login';
      }
      return null;
    },
    routes: [
      GoRoute(
        name: RouterConstants.home,
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: MainScreen(
              index: 0,
            ),
          );
        },
      ),
      GoRoute(
        name: RouterConstants.login,
        path: '/login',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: LoginPage(),
          );
        },
      ),
      GoRoute(
        name: RouterConstants.recipeInfo,
        path: '/recipe-info/:id',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: RecipeInformationPage(
              id: state.pathParameters['id'].toString(),
            ),
          );
        },
      ),
      GoRoute(
        name: RouterConstants.forgotPass,
        path: '/forgotPass',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: ForgotPasswordPage(),
          );
        },
      ),
      GoRoute(
        name: RouterConstants.otp,
        path: '/otppage/:email',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: OtpPage(
              email: state.pathParameters['email'],
            ),
          );
        },
      ),
      GoRoute(
        name: RouterConstants.forgotPassAccountVerify,
        path: '/account-verify/:email',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: ForgotPassAccountVerify(
              email: state.pathParameters['email'],
            ),
          );
        },
      ),
      GoRoute(
        name: RouterConstants.searchPage,
        path: '/search',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: MainScreen(index: 1),
          );
        },
      ),
      GoRoute(
        name: RouterConstants.resetPass,
        path: '/resetpass/:email',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: ResetPasswordPage(
              email: state.pathParameters['email'],
            ),
          );
        },
      ),
      GoRoute(
        name: RouterConstants.settings,
        path: '/settings',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SettingsPage(),
          );
        },
      ),
      GoRoute(
        name: RouterConstants.changeTheme,
        path: '/changetheme',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: ChangeTheme(),
          );
        },
      ),
      GoRoute(
        name: RouterConstants.suggestFeature,
        path: '/suggestfeature',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SuggestFeature(),
          );
        },
      ),
      GoRoute(
        name: RouterConstants.help,
        path: '/help',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: HelpAndSupport(),
          );
        },
      ),
      GoRoute(
        name: RouterConstants.reportProblem,
        path: '/report',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: ReportProblem(),
          );
        },
      ),
      GoRoute(
        name: RouterConstants.privacy,
        path: '/privacy',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: Privacy(),
          );
        },
      ),
      GoRoute(
        name: RouterConstants.editProfile,
        path: '/edit-profile/:userData',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: EditProfilePage(userData: state.pathParameters),
          );
        },
      ),
      GoRoute(
        name: RouterConstants.userProfile,
        path: '/profile',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: ProfilePage(),
          );
        },
      ),
      GoRoute(
        name: RouterConstants.notifications,
        path: '/notifications',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: NotificationPage(),
          );
        },
      ),
      GoRoute(
        name: RouterConstants.signup,
        path: '/signup',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SignupPage(),
          );
        },
      ),
    ],
  );
}
