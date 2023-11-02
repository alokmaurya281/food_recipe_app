import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/auth_pages/forgot_pass_account_verify.dart';
import 'package:food_recipe_app/pages/auth_pages/forgot_password.dart';
import 'package:food_recipe_app/pages/auth_pages/otp_page.dart';
import 'package:food_recipe_app/pages/auth_pages/reset_password_page.dart';
import 'package:food_recipe_app/pages/auth_pages/signup_page.dart';
import 'package:food_recipe_app/pages/change_theme.dart';
import 'package:food_recipe_app/pages/edit_profile_page.dart';
import 'package:food_recipe_app/pages/auth_pages/login_page.dart';
import 'package:food_recipe_app/pages/main_screen.dart';
import 'package:food_recipe_app/routes/router_constants.dart';
import 'package:food_recipe_app/services/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: RouterConstants.home,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: MainScreen(),
          );
        },
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
        name: RouterConstants.changeTheme,
        path: '/changetheme',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: ChangeTheme(),
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
