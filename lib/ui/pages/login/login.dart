import 'package:flutter/material.dart';
import 'package:BetSweet/ui/widgets/constants.dart';
import 'package:BetSweet/ui/widgets/buttons/generalButtom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:BetSweet/ui/authentication_bloc.dart';
import 'package:BetSweet/ui/widgets/inputs/passwordInput.dart';
import 'package:BetSweet/ui/widgets/inputs/textInput.dart';
import 'package:BetSweet/ui/pages/Register/register.dart';
import 'package:BetSweet/ui/pages/recoverPassword/recoverPassword.dart';
import 'package:BetSweet/ui/widgets/templateForm.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: TemplateForm(
            sizedBoxChild: Column(children: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .4,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GeneralButton(
                  text: 'login',
                  onPressed: () {},
                  customSize: (Size(100, 20)),
                ),
                SizedBox(width: 25),
                GeneralButton(
                  text: 'sign up',
                  color: AppColors.secondaryColor,
                  onPressed: () {
                    // Cerrar el primer Dialog
                    Navigator.pop(context);

                    // Mostrar el segundo Dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: RegistroPage(),
                        );
                      },
                    );
                  },
                  customSize: (Size(100, 20)),
                ),
              ],
            )),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * .6,
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextInput(
                text: 'Correo electrónico',
                iconPath: 'assets/icons/mailDark.svg',
                size: ButtonSize.l,
                controller:
                    _emailController, // pasar el controlador como parámetro opcional
              ),
              SizedBox(height: 10),
              PasswordInput(
                text: 'Contraseña',
                iconPath: 'assets/icons/lockDark.svg',
                size: ButtonSize.l,
                controller:
                    _passwordController, // pasar el controlador como parámetro opcional
              ),
              SizedBox(height: 10),
              GestureDetector(
                child: Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.lightBlue,
                      color: Colors.lightBlue),
                ),
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: ResetPasswordPage(),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 10),
              GeneralButton(
                text: 'INICIAR SESION',
                onPressed: () {
                  final email = _emailController.text.trim();
                  final password = _passwordController.text.trim();
                  if (email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Ingrese correo electrónico y contraseña válidos'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    context.read<AuthenticationBloc>().add(UserLoggedIn(
                          email: email,
                          password: password,
                        ));
                  }
                },
                size: ButtonSize.l,
              ),
              SizedBox(height: 10),
              Text(
                'al acceder a este sitio, aceptas nuestros términos y condiciones y nuestra política de privacidad',
                style: TextStyle(fontSize: 13.5),
                textAlign: TextAlign.center,
              )
            ]),
      ),
    ])));
  }
}
