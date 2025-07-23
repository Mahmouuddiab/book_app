import 'package:book_app/core/widgets/custom_circular_indicator.dart';
import 'package:book_app/core/widgets/custom_failure_widget.dart';
import 'package:book_app/feature/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:book_app/feature/search/presentation/manger/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const SizedBox.expand(
            child: Center(
              child: Text(
                'Search for a book...',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          );
        } else if (state is SearchLoading) {
          return const CustomCircularIndicator();
        } else if (state is SearchSuccess) {
          if (state.books.isEmpty) {
            return const Center(
              child: Text(
                'No results found.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: state.books.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return BookListViewItem(
                imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                book: state.books[index],
              );
            },
          );
        } else if (state is SearchFailure) {
          return CustomFailureWidget(text: state.errorMessage);
        } else {
  return const CustomCircularIndicator();
        }
      },
    );
  }
}
