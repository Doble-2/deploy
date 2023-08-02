import 'package:flutter/material.dart';
import 'package:BetSweet/ui/widgets/constants.dart';
import 'package:BetSweet/ui/widgets/buttons/generalButtom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:BetSweet/ui/authentication_bloc.dart';
import 'package:BetSweet/ui/widgets/inputs/passwordInput.dart';
import 'package:BetSweet/ui/widgets/inputs/textInput.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  // Controladores para los campos de texto
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  final _passwordController = TextEditingController();

  // Variables para controlar el estado de la página
  bool _isCodeSent = false;
  bool _isCodeVerified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Reset Password')),
        body: SingleChildScrollView(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            if (!_isCodeSent)
                              TextInput(
                                text: 'Correo electrónico',
                                iconPath: 'assets/icons/mailDark.svg',
                                size: ButtonSize.l,
                                controller:
                                    _emailController, // pasar el controlador como parámetro opcional
                              ),
                            if (_isCodeSent) ...[
                              if (!_isCodeVerified)
                                TextInput(
                                  text: 'Codigo de verificacion',
                                  //  iconPath: 'assets/icons/mailDark.svg',
                                  size: ButtonSize.l,
                                  controller:
                                      _codeController, // pasar el controlador como parámetro opcional
                                ),
                              if (_isCodeVerified)
                                PasswordInput(
                                  text: 'Contraseña',
                                  iconPath: 'assets/icons/lockDark.svg',
                                  size: ButtonSize.l,
                                  controller:
                                      _passwordController, // pasar el controlador como parámetro opcional
                                ),
                            ],
                            SizedBox(height: 16),
                            if (!_isCodeSent)
                              GeneralButton(
                                text: 'Send Verification Code',
                                onPressed: () async {
                                  final authenticationBloc =
                                      BlocProvider.of<AuthenticationBloc>(
                                          context);
                                  await authenticationBloc
                                      .sendPasswordResetEmail(
                                          _emailController.text);
                                  setState(() => _isCodeSent = true);
                                },
                                size: ButtonSize.l,
                              ),
                            if (_isCodeSent) ...[
                              SizedBox(height: 8),
                              if (!_isCodeVerified)
                                GeneralButton(
                                  text: 'Verify Code',
                                  onPressed: () async {
                                    final authenticationBloc =
                                        BlocProvider.of<AuthenticationBloc>(
                                            context);
                                    final isCodeValid = await authenticationBloc
                                        .verifyPasswordResetCode(
                                            _emailController.text,
                                            _codeController.text);
                                    if (isCodeValid) {
                                      setState(() => _isCodeVerified = true);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content:
                                            Text('Invalid verification code'),
                                      ));
                                    }
                                  },
                                  size: ButtonSize.l,
                                ),
                              if (_isCodeVerified) ...[
                                SizedBox(height: 8),
                                GeneralButton(
                                  text: 'Reset Password',
                                  onPressed: () async {
                                    final authenticationBloc =
                                        BlocProvider.of<AuthenticationBloc>(
                                            context);
                                    await authenticationBloc.resetPassword(
                                        _emailController.text,
                                        _passwordController.text);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content:
                                          Text('Your password has been reset'),
                                    ));
                                    Navigator.pop(context);
                                  },
                                  size: ButtonSize.l,
                                ),
                              ],
                            ],
                          ],
                        ),
                      ),
                    ]))));
  }
}
