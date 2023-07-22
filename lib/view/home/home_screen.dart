import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_a/data/response/status.dart';
import 'package:get_a/resources/app_colors/app_colors.dart';
import 'package:get_a/resources/components/internet_exception.dart';
import 'package:get_a/resources/routes/route_name/routes_name.dart';
import 'package:get_a/view_model/user_preferences/user_preference.dart';

import '../../view_model/controller/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());
  final userPreferences = UserPreference();

  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pinkColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Home Screen'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: InkWell(
                onTap: () {
                  userPreferences.removeUser().then((value) {
                    Get.toNamed(RouteNames.loginScreen);
                  });
                },
                child: const Icon(Icons.logout)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Obx(() {
          switch (controller.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.green,
              ));
            case Status.ERROR:
              if (controller.error.value == 'no internet') {
                return InternetException(onPressed: () {
                  loading = true;
                  controller.userListApi();
                });
              } else {
                return InternetException(onPressed: () {
                  loading = true;

                  controller.userListApi();
                });
              }
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: controller.userList.value.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(controller
                            .userList.value.data![index].firstName
                            .toString()),
                        subtitle: Text(controller
                            .userList.value.data![index].email
                            .toString()),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(controller
                              .userList.value.data![index].avatar
                              .toString()),
                        ),
                        trailing: CircleAvatar(
                          child: Text(controller.userList.value.data![index].id
                              .toString()),
                        ),
                      ),
                    );
                  });
          }
        }),
      ),
    );
  }
}
