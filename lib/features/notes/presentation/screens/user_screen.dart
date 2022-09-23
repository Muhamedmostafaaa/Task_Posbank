import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_posbank/core/utils/colors_manager.dart';
import 'package:task_posbank/core/utils/values_manager.dart';
import 'package:task_posbank/core/widgets/textform_widget.dart';
import 'package:task_posbank/features/notes/data/models/user_model.dart';
import 'package:task_posbank/features/notes/presentation/controller/notes_cubit.dart';

class UserScreen extends StatelessWidget {
  static const String routeName = 'user';
  UserScreen({Key? key}) : super(key: key);
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController intrestController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<NotesCubit>(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('Add User'),
            backgroundColor: ColorManager.primaryColor,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_outlined)),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Column(
                children: [
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: AppSize.s50,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s12,
                  ),
                  Text(
                    'Select Image',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppSize.s30,
                        ),
                        TextFormWidget(
                          controller: userNameController,
                          labelText: 'User Name',
                          maxLines: 1,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter User Name';
                            }
                          },
                        ),
                        SizedBox(
                          height: AppSize.s30,
                        ),
                        TextFormWidget(
                          controller: passwordController,
                          labelText: 'Password',
                          maxLines: 1,
                          suffixIcon: Icon(Icons.visibility),
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Password';
                            }
                          },
                        ),
                        SizedBox(
                          height: AppSize.s30,
                        ),
                        TextFormWidget(
                          controller: emailController,
                          labelText: 'Email',
                          maxLines: 1,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Email';
                            }
                          },
                        ),
                        SizedBox(
                          height: AppSize.s30,
                        ),
                        TextFormWidget(
                          controller: intrestController,
                          labelText: 'Interest',
                          maxLines: 1,
                          suffixIcon: Icon(Icons.arrow_drop_down_outlined),
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Interest';
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s50,
                  ),
                  Container(
                      width: double.infinity,
                      height: 45,
                      color: Colors.amber,
                      child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.insertUser(UserModel(
                                  userName: userNameController.text,
                                  password: passwordController.text,
                                  email: emailController.text,
                                  intersetId: intrestController.text,
                                  id: ''));
                            }
                          },
                          child: Text(
                            'SAVE',
                            style: Theme.of(context).textTheme.displaySmall,
                          )))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
