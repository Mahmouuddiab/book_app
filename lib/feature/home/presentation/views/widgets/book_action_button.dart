import 'package:book_app/core/functions/function.dart';
import 'package:book_app/core/utils/colors/colors.dart';
import 'package:book_app/core/widgets/custom_button.dart';
import 'package:book_app/feature/home/data/models/book_model/item.dart';
import 'package:flutter/material.dart';

class BookActionButton extends StatelessWidget {
  const BookActionButton({super.key, required this.book});
final Item book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
            backgroundColor: AppColors.white,
            text: "Free",
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
          )),
          Expanded(
              child: CustomButton(
                onPressed: ()async{
                 launchCustomUrl(context, book.volumeInfo.previewLink!);
                },
            backgroundColor: AppColors.buttonColor,
            text:  getText(book),   
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          )),
        ],
      ),
    );
  }
  
 String getText(Item book) {
  if(book.volumeInfo.previewLink==null){
    return 'Not Available';
      }else{
        return 'Preview';
      }
 }
}
