import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_with_mvvm_acrhiecture/utils/routes/routes_name.dart';
import 'package:flutter_with_mvvm_acrhiecture/view/homepage.dart';
import 'package:flutter_with_mvvm_acrhiecture/view/login.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.home:
        return MaterialPageRoute(
            builder: ((context) => const HomePageScreen()));
      case RoutesNames.login:
        return MaterialPageRoute(builder: ((context) => const LoginScreen()));
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No Route Define"),
            ),
          );
        });
    }
  }
}
