import 'package:book_app/core/utils/style/style.dart';
import 'package:book_app/feature/home/data/models/book_model/book_model.dart';
import 'package:book_app/feature/home/data/models/book_model/item.dart';
import 'package:book_app/feature/home/presentation/views/widgets/book_action_button.dart';
import 'package:book_app/feature/home/presentation/views/widgets/book_rating.dart';
import 'package:book_app/feature/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key, required this.bookModel});
final Item bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .17),
          child:  CustomBookImage(imageUrl:bookModel.volumeInfo.imageLinks?.thumbnail??"" ,),
        ),
        Text(bookModel.volumeInfo.title!,
            style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
       
        const SizedBox(
          height: 6,
        ),
        Opacity(
            opacity: .7,
            child: Text(
              bookModel.volumeInfo.authors![0],
              style: Styles.textStyle18.copyWith(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
            )),
        const SizedBox(
          height: 10,
        ),
         BookRating(
          count: bookModel.volumeInfo.ratingsCount??0,
          avgRating: bookModel.volumeInfo.averageRating??0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 40,
        ),
         BookActionButton(book:bookModel ,),
      ],
    );
  }
}
