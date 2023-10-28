import '../../../../core/utils/text_util.dart';
import '../../data/models/country_list_model.dart';
import 'package:flutter/material.dart';

class CountryListTileWidget extends StatelessWidget {
  final CountryListModel countryListModel;
  const CountryListTileWidget(this.countryListModel, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child:_buildMainColumn(),
    );
  }

  Widget _buildMainColumn() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInsideRow(TextUtil.countrieText, countryListModel.name, TextUtil.iso2Text, countryListModel.iso2),
          const SizedBox(height: 8,),
          _buildInsideRow(TextUtil.capitalText, countryListModel.capital, TextUtil.iso3Text, countryListModel.iso3),
        
        ],
      ),
    );
  }

  Widget _buildInsideRow(String leftLabel, String leftValue, String rightLabel, String rightValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInsideColumn(leftLabel, leftValue),
        _buildInsideColumn(rightLabel, rightValue),
      ],
    );
  }

  Widget _buildInsideColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildText(label, textSize: 12, fontWeight: FontWeight.w400),
        _buildText(value),
      ],
    );
  }

  Widget _buildText(String? text, {double? textSize = 16, FontWeight? fontWeight = FontWeight.w500}) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: textSize,
        fontWeight: fontWeight,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

}