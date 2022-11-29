import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject2/src/constant/app_colors.dart';
import 'package:providerproject2/src/provider/home_provider.dart';
import 'package:providerproject2/src/widgets/button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    provider.blueControllerl =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    provider.pinkController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    provider.randomColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.8375,
            color: AppColors.gray,
            child: ListView.separated(
              reverse: true,
              separatorBuilder: (_, __) => const SizedBox(
                height: 5,
              ),
              itemCount: provider.boxs.length,
              itemBuilder: (_, index) {
                Map<String, dynamic> data = provider.boxs[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!data['status'])
                      Container(
                        decoration: BoxDecoration(
                            color: data['color'] == 'purple'
                                ? AppColors.purple
                                : data['color'] == 'pink'
                                    ? AppColors.pink
                                    : AppColors.blue,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        width: size.width * 0.3,
                        height: size.height * 0.1,
                      ),
                  ],
                );
              },
            ),
          ),
          Container(
            height: size.height * 0.1625,
            color: AppColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                  colorIsPink: 'pink',
                  controller: provider.pinkController,
                ),
                Button(
                  colorIsPink: 'blue',
                  controller: provider.blueControllerl,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
