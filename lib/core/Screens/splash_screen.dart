import 'package:cleanarchtdd/features/countries/data/repositories/country_repository.dart';
import 'package:cleanarchtdd/features/countries/presentation/bloc/country_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

import '../../features/countries/presentation/screens/country_screen.dart';
import '../services/app_service.dart';
import '../utils/theme_helper_util.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _splashScreenCounter();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.blue.shade100],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
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
    AppService.instance.navigatePushReplecementTo(CountryScreen(countryBloc: CountryBloc(CountryRepository())), animated: true);
  }
}
