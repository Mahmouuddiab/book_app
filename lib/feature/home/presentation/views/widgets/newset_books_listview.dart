import 'package:book_app/core/widgets/custom_circular_indicator.dart';
import 'package:book_app/core/widgets/custom_failure_widget.dart';
import 'package:book_app/feature/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_app/feature/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsetBooksListView extends StatelessWidget {
  const NewsetBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
  return ListView.builder(
    itemCount: state.books.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return  BookListViewItem(imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail??" ",book: state.books[index],);
      });
}else if(state is NewsetBooksFailure){
  return CustomFailureWidget(text: state.errorMessage);
}else{
  return const  CustomCircularIndicator();
}
      },
    );
  }
}
