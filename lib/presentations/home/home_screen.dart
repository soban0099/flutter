import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendingapp/components/custom_appbar.dart';
import 'package:trendingapp/components/custom_text_component.dart';
import 'package:trendingapp/components/main_scaffold.dart';
import 'package:trendingapp/presentations/home/controller/home_controller.dart';
import 'package:trendingapp/utils/styles.dart';
import 'package:trendingapp/widgets/retry_animation.dart';
import 'package:trendingapp/widgets/shimmer_loader.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        appBar: CustomAppBar(
          title: 'Trending',
          // leading: true,
          bgColor: Styles.white,
          backButtonColor: Styles.black,
          centerTitle: true,
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_outlined,
                color: Styles.black,
              )),
        ),
        body: GetX<HomeController>(builder: (controller) {
          if (controller.isLoading.value) {
            return ShimmerLoader();
          }
          if (controller.repositories.value == null)
            return RetryAnimation(onRetry: controller.fetchRepositories);

          if (controller.repositories.value!.items == []) {
            return RetryAnimation(onRetry: controller.fetchRepositories);
          }
          return RefreshIndicator(
            onRefresh: () => controller.fetchRepositories(),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: controller.repositories.value?.items?.length ?? 0,
                  itemBuilder: (context, index) {
                    final repo = controller.repositories.value?.items?[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            foregroundImage:
                                NetworkImage(repo!.owner!.avatarUrl.toString()),
                            backgroundColor: Colors.blue,
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                text: repo.name!.toLowerCase(),
                                color: Styles.black,
                                textAlign: TextAlign.center,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              CustomTextWidget(
                                text: repo.fullName!.toString(),
                                color: Styles.black,
                                textAlign: TextAlign.start,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                            ],
                          ),
                          subtitle: CustomTextWidget(
                            text: "The remake of the ${repo.htmlUrl}",
                            color: Styles.black,
                            textAlign: TextAlign.start,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Divider(
                          color: Styles.grey,
                        ), // Divider between items
                      ],
                    );
                  },
                )),
          );
        }));
  }
}
