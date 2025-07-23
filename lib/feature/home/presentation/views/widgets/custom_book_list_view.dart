import 'package:book_app/core/utils/app_path/app_pathes.dart';
import 'package:book_app/core/widgets/custom_circular_indicator.dart';
import 'package:book_app/core/widgets/custom_failure_widget.dart';
import 'package:book_app/feature/home/presentation/manger/feautre_books_cubit/featured_books_cubit.dart';
import 'package:book_app/feature/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomBooksListView extends StatelessWidget {
  const CustomBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return  GestureDetector(
                  onTap: (){
                                        GoRouter.of(context).push(AppPathes.bookDetails,extra:state.books[index] );

                  },
                  child: CustomBookImage(imageUrl:state.books[index].volumeInfo.imageLinks?.thumbnail??"",));
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomFailureWidget(
            text: state.errorMessage,
          );
        } else {
          return const CustomCircularIndicator();
        }
      },
    );
  }
}
