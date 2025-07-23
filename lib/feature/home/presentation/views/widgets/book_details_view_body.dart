import 'package:book_app/feature/home/data/models/book_model/item.dart';
import 'package:book_app/feature/home/presentation/views/widgets/books_details_section.dart';
import 'package:book_app/feature/home/presentation/views/widgets/custom_book_details-appbar.dart';
import 'package:book_app/feature/home/presentation/views/widgets/similar_books_details_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
final Item bookModel;
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding:const  EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
             const    CustomBookDetailsAppBar(),
                BooksDetailsSection(bookModel: bookModel,),
                const Expanded(
                  child: SizedBox(
                    height: 60,
                  ),
                ),
              const   SimilarBooksDetailsSection(),
              const  SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
