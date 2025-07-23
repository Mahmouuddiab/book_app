import 'package:book_app/core/utils/style/style.dart';
import 'package:book_app/feature/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:book_app/feature/home/presentation/views/widgets/newset_books_listview.dart';
import 'package:book_app/feature/home/presentation/views/widgets/custom_book_list_view.dart';
import 'package:flutter/material.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
      SliverToBoxAdapter(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomAppBar(),
          ),
          CustomBooksListView(),
          SizedBox(
            height: 40,
          ),
          Text(
            "Newest Books",
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
      SliverFillRemaining(
        child: NewsetBooksListView(),
      )
    ]);
  }
}
