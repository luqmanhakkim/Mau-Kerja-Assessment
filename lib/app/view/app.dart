// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mau_kerja_assessment/app/repository/candidate_blog_repository.dart';
import 'package:mau_kerja_assessment/app/view/candidate_blog_main.dart';
import 'package:mau_kerja_assessment/counter/counter.dart';
import 'package:mau_kerja_assessment/l10n/l10n.dart';

import '../bloc/candidate_blog_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CandidateBlogBloc>(
      create: (_) => CandidateBlogBloc(
        CandidateBlogRepository(),
      ),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
        ),
        // localizationsDelegates: const [
        //   AppLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        // ],
        // supportedLocales: AppLocalizations.supportedLocales,
        home: AnimatedSplashScreen(
          nextScreen: CandidateBlogMain(),
          splash: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CandBlog ',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              Icon(
                Icons.local_fire_department_sharp,
                color: Colors.orange,
                size: 25,
              ),
            ],
          ),
          splashTransition: SplashTransition.fadeTransition,
          duration: 20,
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
