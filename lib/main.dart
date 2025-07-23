import 'package:book_app/core/utils/colors/colors.dart';
import 'package:book_app/core/utils/router/app_router.dart';
import 'package:book_app/core/utils/service_locator/service_locator.dart';
import 'package:book_app/feature/home/data/repos/home_repo_impl.dart';
import 'package:book_app/feature/home/presentation/manger/feautre_books_cubit/featured_books_cubit.dart';
import 'package:book_app/feature/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {

  setUpServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context
            )=>FeaturedBooksCubit(getIt.get<HomeRepoImplementation>())..fetchFeaturedBooks()

        ),
        BlocProvider(create: (context
            )=>NewestBooksCubit(getIt.get<HomeRepoImplementation>())..fetchNewsetBooks())
      ],
      child: MaterialApp.router(
        routerConfig: AppRoute.router,
        debugShowCheckedModeBanner: false,
        //
        theme: ThemeData.dark().copyWith(
            textTheme:
            GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
            scaffoldBackgroundColor: AppColors.kPrimaryColor),
      ),
    );
  }
}
