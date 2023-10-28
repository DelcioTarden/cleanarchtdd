import 'package:flutter/material.dart';

import '../../../../core/utils/text_util.dart';
import '../../../../core/widgets/progress_indicator_widget.dart';
import '../../../../core/widgets/text_widget.dart';
import '../bloc/country_bloc.dart';

class GetCountriesButtonWidget extends StatelessWidget {
  final CountryBloc countryBloc;
  final BuildContext context;
  const GetCountriesButtonWidget(this.countryBloc, this.context, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<bool>(
            stream: countryBloc.streamProcessing,
            builder: (context, snapProcessing) {
              final bool processing = snapProcessing.data ?? false;
              return ElevatedButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(const Color.fromRGBO(27, 27, 244, 0.2)),
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  elevation: MaterialStateProperty.all(8),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () { _getCountries(context); },
                child: processing ? const ProgressIndicatorWidget(radius: 10, color: Colors.white,) : 
                  TextWidget(text: TextUtil.countriesText, textSize: 16, fontWeight: FontWeight.bold),
              );
            }
          ),
    );
  }

  void _getCountries(BuildContext context) async {
    await countryBloc.getCountries();
  }
  
}