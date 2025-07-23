import 'package:book_app/core/utils/app_path/app_pathes.dart';
import 'package:book_app/core/widgets/custom_circular_indicator.dart';
import 'package:book_app/core/widgets/custom_failure_widget.dart';
import 'package:book_app/feature/home/presentation/manger/similarbooks/similar_books_cubit.dart';
import 'package:book_app/feature/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarListViewBooks extends StatelessWidget {
  const SimilarListViewBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppPathes.bookDetails,
                          extra: state.books[index]);
                    },
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              "",
                    ),
                  );
                }),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomFailureWidget(text: state.errorMessage);
        } else {
          return const CustomCircularIndicator();
        }
      },
    );
  }
}
