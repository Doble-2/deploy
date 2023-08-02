import 'package:flutter/material.dart';
import '../pages/Register/register.dart';
import '../pages/login/login.dart';
import 'buttons/generalButtom.dart';
import 'constants.dart';

class SweetAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _SweetAppBarState createState() => _SweetAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _SweetAppBarState extends State<SweetAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.thirtyColor, // --color_background-100
      leading: Row(
        //crossAxisSize: crossAxisSize.max,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white, // --color_white
            onPressed: () {
              // Open menu
            },
          ),
          Image.asset(
            'assets/logo.png',
            // height: 10,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: GeneralButton(
            text: 'Iniciar sesión',
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: LoginPage(),
                  );
                },
              );
            },
            size: ButtonSize.m,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: GeneralButton(
            text: 'Registro',
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: RegistroPage(),
                  );
                },
              );
            },
            color: AppColors.secondaryColor,
            size: ButtonSize.m,
          ),
        ),
        IconButton(
          icon: Icon(Icons.chat),
          color: Colors.white, // --color_white
          onPressed: () {
            // Open chat
          },
        ),
      ],
    );
  }
}
