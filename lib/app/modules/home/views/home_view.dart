import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:news/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text('Categories'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<HomeController>(builder: (ctx) {
                  return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                          childAspectRatio: 9 / 7),
                      itemCount: ctx.listCategori.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => Get.toNamed(Routes.ARTICLE,
                                  arguments: ctx.listCategori[index]),
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${controller.images[index]}'),
                                        fit: BoxFit.cover,
                                        opacity: 0.5),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                  '${ctx.listCategori[index]}',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ));
                      });
                }),
              )
            ],
          ),
        )));
  }
}
