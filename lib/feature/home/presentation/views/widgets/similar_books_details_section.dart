import 'package:book_app/core/utils/style/style.dart';
import 'package:book_app/feature/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBooksDetailsSection extends StatelessWidget {
  const SimilarBooksDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You can also like ",
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        const SimilarListViewBooks(),
      ],
    );
  }
}
