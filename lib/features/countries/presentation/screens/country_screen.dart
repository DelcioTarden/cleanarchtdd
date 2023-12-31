import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/text_util.dart';
import '../../../../core/widgets/body_msg_widget.dart';
import '../../../../core/widgets/progress_indicator_widget.dart';
import '../../data/models/country_list_model.dart';
import '../bloc/country_bloc.dart';
import '../widgets/country_list_tile_widget.dart';
import '../widgets/get_countries_button_widget.dart';

class CountryScreen extends StatefulWidget {
  final CountryBloc countryBloc;
  const CountryScreen({required this.countryBloc, super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(),
      body: Provider<CountryBloc>(
        create:(_){
          return widget.countryBloc;
        },
        dispose:(_, value){
          value.dispose();
        },
        child: Consumer<CountryBloc>(
          builder: (_,countryBloc, __){
            return _buildBody();
          }
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      title: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        width: 200,
        child: Image.asset('assets/self-azul-sem-fundo.png'),
      ) ,
    );
  }

  Widget _buildBody() {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (_, __) {
              return <Widget>[
                _buildSliverAppBar(),
              ];
            },
            body: _buildListViewCountries(),
          ),
        );
      }
    );
  }

  Widget _buildSliverAppBar(){
    return SliverAppBar(
      backgroundColor: Colors.white,
      leading: const SizedBox.shrink(),
      expandedHeight: kToolbarHeight * 1.5,
      actions: const <Widget>[
        SizedBox.shrink(),
      ],
      floating: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: GetCountriesButtonWidget(widget.countryBloc, context),
      ),
    );
  }

  Widget _buildListViewCountries() {
    return StreamBuilder<bool>(
      stream: widget.countryBloc.streamProcessing,
      builder: (context, snapProcessing) {
        final bool processing = snapProcessing.data ?? false;
        return !processing ? StreamBuilder<List<CountryListModel>>(
          stream: widget.countryBloc.streamCountryList,
          builder: (context, snapCountrieList) {
            var countryList = snapCountrieList.data ?? [];
            if(countryList.isNotEmpty) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 8),
                itemCount: countryList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: CountryListTileWidget(countryList.elementAt(index)),
                  );
                },
              );
            }
            return BodyMsgWidget(msg: TextUtil.searchResoutsWillShowHereText);
          }
        ) 
        : const Center(child: ProgressIndicatorWidget());
      },
    );
  }

}

  