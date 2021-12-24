import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristapp/layout/final_task_app/cubit/cubit.dart';
import 'package:fristapp/layout/final_task_app/cubit/states.dart';
import 'package:fristapp/model/final_task/Task_user_model.dart';
import 'package:fristapp/modules/final_task_app/task_edite/task_edite_screen.dart';
import 'package:fristapp/shared/component/component.dart';
import 'package:fristapp/shared/component/constants.dart';
import 'package:fristapp/shared/styles/icon_broken.dart';

class TaskHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FinalTaskCubit, TaskStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
              condition: state is TaskGetAllUserLoadingState,
              builder: (context) => CircularProgressIndicator(),
              fallback: (context) {
                return UsersBiulder();
              });
        });
  }
}

Widget buildUserItem(context, index) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onLongPress: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.red[400],
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Delete User',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              content: const Text('Are u sure u wanna delete this user'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    // FirebaseFirestore.instance
                    //     .collection(Users)
                    //     .doc(
                    //         '${FinalTaskCubit.get(context).UsersList[index]['id']}')
                    //     .delete();
                    // FinalTaskCubit.get(context)
                    //     .UsersList
                    //     .remove(FinalTaskCubit.get(context).UsersList[index]);
                    FinalTaskCubit.get(context).deleteUser(
                        FinalTaskCubit.get(context).UsersList[index],
                        '${FinalTaskCubit.get(context).UsersList[index]['id']}',
                        context);
                    Navigator.pop(context, 'OK');
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(
                "https://icon-library.com/images/user-icon-png/user-icon-png-18.jpg",
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Text(
                '${FinalTaskCubit.get(context).UsersList[index]['name']}',
                //'${FinalTaskCubit.get(context).UsersList[index]['name']}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            IconButton(
                onPressed: () {
                  NavigetTo(context, TaskEditeUserScraan(index: index));
                  // AppCubit().get(context).UpdateData(
                  //   status: "done",
                  //   id: model['id'],
                  //   );
                },
                icon: Icon(
                  IconBroken.Arrow___Right_2,
                  color: defultColor,
                )),
            // IconButton(
            //   onPressed: (){
            //     AppCubit().get(context).UpdateData(
            //       status: "arcived",
            //       id: model['id'],
            //       );
            //       print('${model}');
            //   },
            //   icon: Icon(
            //     Icons.archive,
            //     color: Colors.black45,
            //   )),
          ],
        ),
      ),
    );

Widget UsersBiulder() {
  return ConditionalBuilder(
    condition: true,
    builder: (context) => ListView.separated(
      itemBuilder: (context, index) => buildUserItem(context, index),
      separatorBuilder: (context, index) => MyDivider(),
      itemCount: FinalTaskCubit.get(context).UsersList.length,
    ),
    fallback: (context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
          ),
          Text(
            'No Taskes Yet, Please Enter taskes',
          ),
        ],
      ),
    ),
  );
}
