import 'package:BetSweet/ui/pages/register/register.dart';
import 'package:BetSweet/ui/widgets/appBar.dart';
import 'package:BetSweet/ui/widgets/carouselGradientButtons.dart';
import 'package:BetSweet/ui/widgets/buttons/generalButtom.dart';
import 'package:flutter/material.dart';
import 'package:BetSweet/ui/widgets/constants.dart';
import 'package:BetSweet/ui/widgets/buttons/gradientButtom.dart';
import 'package:BetSweet/data/repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> getChatMessages() async {
    final Repository repository = Repository();
    final List<Map<String, dynamic>> messages = await repository.getMessages();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SweetAppBar(),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * .7,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/redBear.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                  height: 100,
                                  width: 300,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Regístrese y Obtenga Hasta ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '1 BTC',
                                          style: TextStyle(
                                            color: AppColors.accentColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              GeneralButton(
                                text: 'Registrese al instante',
                                customSize: Size(280, 60),
                                onPressed: () {
                                  var context;
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        child: RegistroPage(),
                                      );
                                    },
                                  );
                                },
                                //   color: AppColors.secondaryColor,
                                size: ButtonSize.l,
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            //  Text('data'),
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
          ],
        )),
      ), //*/
      //  WidgetsCollection(),
    );
  }
}
