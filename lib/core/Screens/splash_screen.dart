import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../features/countries/presentation/screens/country_screen.dart';
import '../services/app_service.dart';
import '../utils/theme_helper_util.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          _buildBackground(context),
        ],
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    _splashScreenCounter();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          alignment: const Alignment(-1.0, 0),
          colorFilter: ColorFilter.mode(Colors.white.withOpacity(1), BlendMode.dstOver),
          image: const AssetImage("assets/self-brancal-sem-fundo.png"),
        )
      ),
      child: _buildLogo(context),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 200,
        width: MediaQuery.of(context).size.width * .65,
        child: Shimmer.fromColors(
          baseColor: Colors.blue,
          highlightColor: ThemeHelper.instance.colorBackgroundGrey,
          loop: 1,
          period: const Duration(milliseconds: 2500),
          child: Image.asset(
            "assets/self-azul-sem-fundo.png",
            fit: BoxFit.fitHeight,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }

  void _splashScreenCounter() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    AppService.instance.navigateFromLogin(const CountryScreen());
  }
}
