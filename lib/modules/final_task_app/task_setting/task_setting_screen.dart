import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristapp/layout/final_task_app/cubit/cubit.dart';
import 'package:fristapp/layout/final_task_app/cubit/states.dart';
import 'package:fristapp/modules/final_task_app/task_login/social_login_screen.dart';
import 'package:fristapp/shared/component/component.dart';

class TaskSettingScreen extends StatelessWidget {
  const TaskSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FinalTaskCubit, TaskStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
            child: Container(
              child: TextButton(
                onPressed: () {
                  NavidetAndFinish(context, TaskLoginScreen());
                },
                child: Text(
                  'LOGOUT',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
