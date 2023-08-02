import 'package:BetSweet/ui/pages/register/register.dart';
import 'package:BetSweet/ui/widgets/appBar.dart';
import 'package:BetSweet/ui/widgets/carouselGradientButtons.dart';
import 'package:BetSweet/ui/widgets/buttons/generalButtom.dart';
import 'package:flutter/material.dart';
import 'package:BetSweet/ui/widgets/constants.dart';
import 'package:BetSweet/ui/widgets/buttons/gradientButtom.dart';
import 'package:BetSweet/ui/widgets/buttons/iconButtom.dart';
import 'package:BetSweet/ui/widgets/inputs/textInput.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:BetSweet/ui/pages/login/login.dart';
import 'package:BetSweet/ui/widgets/chatGroup.dart';
import 'package:BetSweet/ui/widgets/message.dart';
import 'package:BetSweet/data/repository.dart';
import 'package:BetSweet/ui/widgets/appBar.dart';
import 'package:BetSweet/ui/authentication_bloc.dart';

class WidgetsCollection extends StatefulWidget {
  const WidgetsCollection({
    super.key,
  });

  @override
  State<WidgetsCollection> createState() => _WidgetsCollectionState();
}

class _WidgetsCollectionState extends State<WidgetsCollection> {
  late List<ChatMessage> chatMessages;
  bool _isAuthenticated = false;
  @override
  void initState() {
    super.initState();
    chatMessages = [];
    getChatMessages();
  }

  Future<void> getChatMessages() async {
    final Repository repository = Repository();
    final List<Map<String, dynamic>> messages = await repository.getMessages();
    setState(() {
      chatMessages = messages
          .map((message) => ChatMessage(
                name: message['name'],
                text: message['text'],
                avatar: message['avatar'],
              ))
          .toList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: SweetAppBar(),
        body: SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'General Button',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Center(
                child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GeneralButton(
                    text: 'Iniciar sesión',
                    onPressed: () {
                      if (_isAuthenticated) {
                        // Do something when authenticated
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: LoginPage(),
                            );
                          },
                        );
                      }
                    },
                    color: AppColors.green,
                    size: ButtonSize.m,
                  ),
                  SizedBox(width: 20),
                  GeneralButton(
                    text: 'Iniciar sesión',
                    onPressed: () {
                      context.read<AuthenticationBloc>().add(UserLoggedOut());
                    },
                    color: AppColors.accentColor,
                    size: ButtonSize.m,
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                GeneralButton(
                  text: 'Registrarse',
                  onPressed: () {},
                  size: ButtonSize.l,
                  color: AppColors.primaryColor,
                ),
                SizedBox(width: 20),
                GeneralButton(
                  text: 've',
                  onPressed: () {},
                  size: ButtonSize.s,
                  color: AppColors.yellow,
                )
              ]),
              GeneralButton(
                text: 'Registrarse',
                onPressed: () {},
                customSize: Size(320, 75),
                color: AppColors.secondaryColor,
              ),
            ])),
            Text('Gradient Button',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            GradientButtonCarousel(
              buttons: [
                GradientButtom(
                  text: 'RAKE BACK',
                  onPressed: () {},
                  color: AppColors.green,
                  size: ButtonSize.s,
                  iconPath: 'assets/icons/3d/bag.png',
                ),
                GradientButtom(
                  text: 'BONOS',
                  onPressed: () {},
                  color: AppColors.blue,
                  size: ButtonSize.s,
                  iconPath: 'assets/icons/3d/trophy.png',
                ),
                GradientButtom(
                  text: 'GIRAR RULETA',
                  onPressed: () {},
                  color: AppColors.purple,
                  size: ButtonSize.s,
                  iconPath: 'assets/icons/3d/roulette.png',
                ),
                GradientButtom(
                  text: 'CASH BACK',
                  onPressed: () {},
                  color: AppColors.yellow,
                  size: ButtonSize.s,
                  iconPath: 'assets/icons/3d/magnet.png',
                ),
              ],
            ),
            SizedBox(height: 10),
            GradientButtonCarousel(
              buttons: [
                GradientButtom(
                  text: 'RAKE BACK',
                  onPressed: () {},
                  color: AppColors.green,
                  size: ButtonSize.m,
                  iconPath: 'assets/icons/3d/bag.png',
                ),
                GradientButtom(
                  text: 'BONOS',
                  onPressed: () {},
                  color: AppColors.blue,
                  size: ButtonSize.m,
                  iconPath: 'assets/icons/3d/trophy.png',
                ),
                GradientButtom(
                  text: 'GIRAR RULETA',
                  onPressed: () {},
                  color: AppColors.purple,
                  size: ButtonSize.m,
                  iconPath: 'assets/icons/3d/roulette.png',
                ),
                GradientButtom(
                  text: 'CASH BACK',
                  onPressed: () {},
                  color: AppColors.yellow,
                  size: ButtonSize.m,
                  iconPath: 'assets/icons/3d/magnet.png',
                ),
              ],
            ),
            SizedBox(height: 10),
            GradientButtonCarousel(
              buttons: [
                GradientButtom(
                  text: 'RAKE BACK',
                  onPressed: () {},
                  color: AppColors.green,
                  size: ButtonSize.l,
                  iconPath: 'assets/icons/3d/bag.png',
                ),
                GradientButtom(
                  text: 'BONOS',
                  onPressed: () {},
                  color: AppColors.blue,
                  size: ButtonSize.l,
                  iconPath: 'assets/icons/3d/trophy.png',
                ),
                GradientButtom(
                  text: 'GIRAR RULETA',
                  onPressed: () {},
                  color: AppColors.purple,
                  size: ButtonSize.l,
                  iconPath: 'assets/icons/3d/roulette.png',
                ),
                GradientButtom(
                  text: 'CASH BACK',
                  onPressed: () {},
                  color: AppColors.yellow,
                  size: ButtonSize.l,
                  iconPath: 'assets/icons/3d/magnet.png',
                ),
              ],
            ),
            SizedBox(height: 10),
            Center(
                child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                GradientButtom(
                  text: 'RAKE BACK',
                  onPressed: () {},
                  color: AppColors.green,
                  size: ButtonSize.s,
                  iconPath: 'assets/icons/3d/bag.png',
                ),
                GradientButtom(
                  text: 'BONOS',
                  onPressed: () {},
                  color: AppColors.blue,
                  size: ButtonSize.s,
                  iconPath: 'assets/icons/3d/trophy.png',
                ),
              ]),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                GradientButtom(
                  text: 'GIRAR RULETA',
                  onPressed: () {},
                  color: AppColors.purple,
                  size: ButtonSize.m,
                  iconPath: 'assets/icons/3d/roulette.png',
                ),
                GradientButtom(
                  text: 'RAKE BACK',
                  onPressed: () {},
                  color: AppColors.green,
                  size: ButtonSize.m,
                  iconPath: 'assets/icons/3d/bag.png',
                ),
              ]),
              SizedBox(height: 10),
              GradientButtom(
                text: 'CASH BACK',
                onPressed: () {},
                color: AppColors.yellow,
                size: ButtonSize.l,
                iconPath: 'assets/icons/3d/magnet.png',
              ),
            ])),
            Text('Icon Button',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            Center(
                child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButtom(
                  text: 'Batallas',
                  onPressed: () {},
                  iconPath: 'assets/icons/energyLight.svg',
                  size: ButtonSize.m,
                  color: AppColors.primaryColor,
                ),
                SizedBox(width: 20),
                IconButtom(
                  text: '',
                  onPressed: () {},
                  iconPath: 'assets/icons/ballLight.svg',
                  size: ButtonSize.s,
                  color: AppColors.primaryColor,
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButtom(
                  text: 'Seleccion de juegos',
                  onPressed: () {},
                  iconPath: 'assets/icons/dicesLight.svg',
                  size: ButtonSize.l,
                  color: AppColors.primaryColor,
                ),
              ])
            ])),
            Text('Text Input',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            Center(child: Column(children: [])),
            InkWell(
              onTap: () {
                // Acción al hacer clic en el elemento
              },
              child: SizedBox(
                width: 200,
                height: 250,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/games/greatRhyno.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Agregar otros elementos aquí
                  ],
                ),
              ),
            ),
            Column(
              children: [
                // Otros widgets aquí
                SizedBox(
                    width: 400,
                    height: 250,
                    child: ChatGroup(messages: chatMessages)),
              ],
            ),
          ]),
    ));
  }
}
