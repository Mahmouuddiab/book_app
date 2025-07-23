import 'package:book_app/core/utils/colors/colors.dart';
import 'package:book_app/core/utils/router/app_router.dart';
import 'package:book_app/feature/search/presentation/manger/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value){
      context.read<SearchCubit>().searchResult(value);
      },
      decoration: InputDecoration(
          hintText: 'search',
          enabledBorder: builtOutLineBorder(),
          focusedBorder: builtOutLineBorder(),
          suffixIcon: const Opacity(
              opacity: .8, child: Icon(FontAwesomeIcons.magnifyingGlass))),
    );
  }
}

OutlineInputBorder builtOutLineBorder() => OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.white),
    borderRadius: BorderRadius.circular(16));
