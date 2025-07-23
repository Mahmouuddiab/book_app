import 'package:book_app/constant.dart';
import 'package:book_app/core/utils/app_path/app_pathes.dart';
import 'package:book_app/core/utils/style/style.dart';
import 'package:book_app/feature/home/data/models/book_model/item.dart';
import 'package:book_app/feature/home/presentation/views/widgets/book_rating.dart';
import 'package:book_app/feature/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key, required this.imageUrl,required this.book, 
  });
final String imageUrl;
final Item book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppPathes.bookDetails,extra: book);
        },
        child: Row(
          children: [
            SizedBox(
              height: 100,
              child: CustomBookImage(imageUrl: imageUrl),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        "${book.volumeInfo.title??'No Title'} ",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: KGTSectraFine),
                      )),
                  const SizedBox(
                    height: 3,
                  ),
                   Text(
                    book.volumeInfo.authors?[0]??"No Author",
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Free",
                            style: Styles.textStyle14
                                .copyWith(fontWeight: FontWeight.bold)),
                         BookRating(avgRating: book.volumeInfo.averageRating?.round()??0,count: book.volumeInfo.ratingsCount?.toInt()??0),
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
