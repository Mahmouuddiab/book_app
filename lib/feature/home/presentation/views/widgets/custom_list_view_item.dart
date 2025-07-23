import 'package:book_app/core/utils/colors/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 2.7 / 4,
          child: CachedNetworkImage(
            errorWidget: (context, url, error) =>const  Icon(Icons.error),
            placeholder:  (context, url) => const Center(child:SpinKitSpinningLines (size: 30,color:AppColors.blue )),
            imageUrl:imageUrl,fit: BoxFit.fill,)
        ),
      ),
    );
  }
}
