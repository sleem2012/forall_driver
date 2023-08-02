import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/models/global/location/countries/countries_model.dart';
import '../../../logic/global/location/location_bloc.dart';
import '../../../logic/global/location/location_state.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../drop_down.dart';

class NationalityDropDown extends StatelessWidget {
  const NationalityDropDown({super.key, required this.onChanged});
  final Function(CountriesDatum?) onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        final countryList = LocationBloc.of(context).countriesModel?.data ?? [];
        return KDropdownBtn<CountriesDatum>(
          title: state.maybeWhen(orElse: () => false, loading: () => true && LocationBloc.of(context).countriesModel == null)
              ? Tr.get.loading
              : Tr.get.select_nationality,
          btnDecoration: KHelper.of(context).filled,
          items: countryList
              .map(
                (e) => KHelper.of(context).itemView<CountriesDatum>(
                  itemText: e.nationality?.value ?? '',
                  value: e,
                  icon: e.flag != null ? SvgPicture.network(e.flag!, width: 50, height: 30, fit: BoxFit.contain) : null,
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
          validator: (values) {
            if (values == null && Platform.isAndroid) {
              return Tr.get.field_required;
            } else {
              return null;
            }
          },
          showAz: true,
        );
      },
    );
  }
}
