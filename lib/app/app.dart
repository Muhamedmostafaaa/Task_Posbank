import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_posbank/core/services/service_locator.dart';
import 'package:task_posbank/core/utils/colors_manager.dart';
import 'package:task_posbank/core/utils/theme_manager.dart';
import 'package:task_posbank/features/notes/presentation/controller/notes_cubit.dart';
import 'package:task_posbank/features/notes/presentation/screens/edit_screen.dart';
import 'package:task_posbank/features/notes/presentation/screens/notes_screen.dart';
import 'package:task_posbank/features/notes/presentation/screens/options_screen.dart';
import 'package:task_posbank/features/notes/presentation/screens/user_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor:ColorManager.statusBarColor ,
        statusBarIconBrightness: Brightness.light
      ),
    );
    return BlocProvider(
      create: (context) => sl<NotesCubit>()..getAllNotes()..getAllUsers()..getAllIntrests(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          routes: {
          UserScreen.routeName:(context)=>UserScreen(),
          EditScreen.routeName:(context)=>EditScreen(),
          OptionsScreen.routeName:(context)=>OptionsScreen(),
          NotesScreen.routeName:(context)=>NotesScreen(),
          },
        initialRoute: NotesScreen.routeName,
        theme: getApplicationTheme(),

      ),
    );
  }
}
