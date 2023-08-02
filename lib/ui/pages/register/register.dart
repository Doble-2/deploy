import 'package:BetSweet/ui/pages/login/login.dart';
import 'package:BetSweet/ui/pages/register/widgets/selectCountry.dart';
import 'package:BetSweet/ui/widgets/check.dart';
import 'package:flutter/material.dart';
import 'package:BetSweet/ui/widgets/constants.dart';
import 'package:BetSweet/ui/widgets/buttons/generalButtom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:BetSweet/ui/authentication_bloc.dart';
import 'package:BetSweet/ui/widgets/customSelect.dart';
import 'package:BetSweet/ui/widgets/inputs/passwordInput.dart';
import 'package:BetSweet/ui/widgets/inputs/textInput.dart';
import 'package:BetSweet/ui/widgets/templateForm.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({
    super.key,
  });

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _countryController = TextEditingController();
  final _promoCodeController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _countryController.dispose();
    _promoCodeController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final String languageCode = Localizations.localeOf(context).languageCode;

    return Scaffold(
      body: TemplateForm(
        sizedBoxChild: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .1,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GeneralButton(
                      text: 'login',
                      customSize: (Size(100, 20)),
                      color: AppColors.secondaryColor,
                      onPressed: () {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: LoginPage(),
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(width: 25),
                    GeneralButton(
                      text: 'sign up',
                      onPressed: () {},
                      //size: ButtonSize.s,
                      customSize: (Size(100, 20)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .9,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  TextInput(
                    text: 'Nombre', // Actualizar el texto del campo de texto
                    iconPath:
                        'assets/icons/face.svg', // Actualizar el ícono del campo de texto
                    size:
                        ButtonSize.l, // Actualizar el tamaño del campo de texto
                    controller:
                        _firstNameController, // Agregar controlador para el campo de texto
                  ),
                  SizedBox(height: 10),
                  TextInput(
                    text: 'Apellido', // Actualizar el texto del campo de texto
                    iconPath:
                        'assets/icons/face.svg', // Actualizar el ícono del campo de texto
                    size:
                        ButtonSize.l, // Actualizar el tamaño del campo de texto
                    controller:
                        _lastNameController, // Agregar controlador para el campo de texto
                  ),
                  SizedBox(height: 10),
                  TextInput(
                    text:
                        'Correo electrónico', // Actualizar el texto del campo de texto
                    iconPath:
                        'assets/icons/mailDark.svg', // Actualizar el ícono del campo de texto
                    size:
                        ButtonSize.l, // Actualizar el tamaño del campo de texto
                    controller:
                        _emailController, // Agregar controlador para el campo de texto
                  ),
                  SizedBox(height: 10),
                  PasswordInput(
                    text:
                        'Contraseña', // Actualizar el texto del campo de texto
                    iconPath:
                        'assets/icons/lockDark.svg', // Actualizar el ícono del campo de texto
                    size:
                        ButtonSize.l, // Actualizar el tamaño del campo de texto
                    controller:
                        _passwordController, // Agregar controlador para el campo de texto
                  ),
                  SizedBox(height: 10),
                  CustomSelect(
                    title: 'Moneda',
                    size: ButtonSize.l,
                    iconPath: 'assets/icons/sackDark.svg',
                    options: ['USD', 'EUR', 'LIB'],
                    onChanged: (value) {
                      // Aquí puedes manejar el cambio de valor del selector
                      print(value);
                    },
                  ),
                  SizedBox(height: 10),
                  SelectCountry(
                    controller: _countryController,
                  ),
                  SizedBox(height: 10),
                  TextInput(
                    text: 'Codigo Promocional (OPCIONAL)',
                    iconPath: 'assets/icons/dollarLight.svg',
                    size: ButtonSize.l,
                    // controller:
                    controller:
                        _promoCodeController, // Agregar controlador para el campo de texto
                    //     _emailController, // Agregar controlador para el campo de texto
                  ),
                  SizedBox(height: 10),
                  CustomCheckbox(
                    onChanged: (bool? newValue) {
                      // Aquí puedes manejar el cambio de valor del Checkbox
                    },
                    checkColor: AppColors.accentColor,
                    text:
                        'I confirm that I am 18 years old and I have read the terms of service',
                  ),
                  CustomCheckbox(
                    onChanged: (bool? newValue) {
                      // Aquí puedes manejar el cambio de valor del Checkbox
                    },
                    checkColor: AppColors.accentColor,
                    text: 'Receive Email Promos',
                  ),
                  SizedBox(height: 10),
                  GeneralButton(
                    text: 'REGISTRARSE',
                    onPressed: () {
                      // Validar que los campos de texto no estén vacíos
                      if (_emailController.text.isEmpty ||
                          _passwordController.text.isEmpty ||
                          _firstNameController.text.isEmpty ||
                          _lastNameController.text.isEmpty) {
                        // Mostrar mensaje de error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Por favor, complete todos los campos')),
                        );
                        return;
                      }
                      if (_countryController.text.isEmpty) {
                        // Mostrar mensaje de error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Por favor, complete el campo de pais')),
                        );
                        return;
                      }
                      // Crear un mapa con toda la información del usuario
                      final userData = {
                        'email': _emailController.text,
                        'password': _passwordController.text,
                        'firstName': _firstNameController.text,
                        'lastName': _lastNameController.text,
                        'country': _countryController.text,
                        'promoCode': _promoCodeController.text,
                        'language': languageCode,
                      };
                      // Llamar al método signUp del bloque de autenticación
                      context
                          .read<AuthenticationBloc>()
                          .add(UserSignedUp(userData: userData));
                    },
                    size: ButtonSize.l,
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
