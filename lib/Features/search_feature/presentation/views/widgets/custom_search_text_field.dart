import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/search_feature/presentation/manager/cubits/cubit/search_cubit.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final myController = TextEditingController();

  String? text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      onChanged: (value) {
        text = value;
      },
      onSubmitted: (value) {
        BlocProvider.of<SearchCubit>(context)
            .fetchSearchResults(searchWord: value);
        myController.clear();
      },
      cursorColor: kMainColor,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: "Search For a movie, tv shows and actors",
        hintStyle: Styles.styleText16.copyWith(
          color: Colors.white.withOpacity(0.5),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<SearchCubit>(context)
                .fetchSearchResults(searchWord: text!);
            myController.clear();
          },
          icon: const Icon(
            Icons.search,
            color: kMainColor,
          ),
        ),
      ),
    );
  }
}
