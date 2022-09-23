import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_posbank/core/services/service_locator.dart';
import 'package:task_posbank/core/utils/colors_manager.dart';
import 'package:task_posbank/core/utils/values_manager.dart';
import 'package:task_posbank/features/notes/presentation/controller/notes_cubit.dart';
import 'package:task_posbank/features/notes/presentation/screens/edit_screen.dart';
import 'package:task_posbank/features/notes/presentation/screens/options_screen.dart';
import 'package:task_posbank/features/notes/presentation/screens/user_screen.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);
  static const String routeName='notes';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        var cubit=BlocProvider.of<NotesCubit>(context);
        if(cubit.notes.length>0){
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
            appBar: AppBar(
              actions:  [
                InkWell(onTap: (){
                  Navigator.pushNamed(context, UserScreen.routeName);
                },
                    child: Icon(Icons.person_add)),
                SizedBox(
                  width: AppSize.s8,
                ),
                InkWell(onTap: (){
                  Navigator.pushNamed(context, OptionsScreen.routeName);
                },
                    child: Icon(Icons.settings)),
                SizedBox(
                  width: AppSize.s8,
                ),
                Icon(Icons.menu),
                SizedBox(
                  width: AppSize.s8,
                ),
              ],
              backgroundColor: ColorManager.primaryColor,
              title: Text(
                'Notes',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: AppSize.s14,
                ),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: Row(
                    children: const [
                      Icon(Icons.filter_list,color: ColorManager.primaryColor,),
                      SizedBox(
                        width: AppSize.s8,
                      ),
                      Icon(Icons.search,color: ColorManager.primaryColor),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(AppPadding.p20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                    cubit.notes[index].text??'',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                    Theme.of(context).textTheme.displayMedium,
                                  )),
                              SizedBox(
                                width: AppSize.s50,
                              ),
                              InkWell(onTap: (){

                                cubit.getNote(int.parse(cubit.notes[index].id));
                                Navigator.pushNamed(context, EditScreen.routeName,);
                              },
                                  child: Icon(Icons.edit))
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 1,
                          color: Colors.grey,
                        );
                      },
                      itemCount: cubit.notes.length),
                )
              ],
            ),
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }

      },
    );
  }
}
