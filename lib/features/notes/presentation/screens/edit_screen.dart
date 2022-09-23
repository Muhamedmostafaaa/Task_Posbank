import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_posbank/core/utils/colors_manager.dart';
import 'package:task_posbank/core/utils/values_manager.dart';
import 'package:task_posbank/core/widgets/textform_widget.dart';
import 'package:task_posbank/features/notes/presentation/controller/notes_cubit.dart';

class EditScreen extends StatefulWidget {
  EditScreen({Key? key}) : super(key: key);
  static const String routeName='edit';

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController noteController = TextEditingController();


  TextEditingController userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,NotesState>(
      builder: (context,state){
       var  cubit=BlocProvider.of<NotesCubit>(context);
       noteController.text=cubit.singleNote?.text??'eh';

         if(cubit.singleNote!=null){
          return Scaffold(
            appBar: AppBar(title: Text('Edit Note'),
              backgroundColor: ColorManager.primaryColor,
              leading: InkWell(onTap: (){
                Navigator.pop(context);
              },
                  child: Icon(Icons.arrow_back_outlined)),
              actions:const [Padding(
                padding:  EdgeInsets.all(AppPadding.p12),
                child: Icon(Icons.filter_1_outlined),
              )],
            ),
            body:
            Padding(
              padding: const EdgeInsets.all(AppPadding.p25),
              child: Column(
                children: [
                  TextFormWidget(controller: noteController, labelText: 'Note', maxLines: 7),
                  SizedBox(height:AppSize.s25,),
                  TextFormWidget(controller: userController, labelText: 'Assign To User', maxLines: 1,suffixIcon: Icon(Icons.arrow_drop_down_sharp,color: Colors.grey,),)
                ],
              ),
            ),
          );
       }else{
           return Center(child: CircularProgressIndicator());
         }

      },

    );
  }
}
