
import 'package:flutter/material.dart';
import 'package:task_posbank/core/utils/colors_manager.dart';
import 'package:task_posbank/core/utils/values_manager.dart';

class OptionsScreen extends StatefulWidget {
  static const String routeName='options';

  const OptionsScreen({Key? key}) : super(key: key);

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Options'),
        backgroundColor: ColorManager.primaryColor,
        leading: InkWell(onTap: (){
          Navigator.pop(context);
        },
            child: Icon(Icons.arrow_back_outlined)),

      ),
      body: Column(
        children: [
          SizedBox(height: AppSize.s20,),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: Row(
              children: [
                Text('Use Local Database',style: Theme.of(context).textTheme.displayMedium,),
                Spacer(),
                Switch(activeColor: ColorManager.primaryColor,
                    value:isSwitched, onChanged: (value){
                  setState(() {
                    isSwitched = value;
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
