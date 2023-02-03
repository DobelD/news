import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/app/routes/app_pages.dart';

import '../../../data/news_model.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final control = Get.put(HomeController());
    var kategori = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            '${kategori}',
            style: GoogleFonts.montserrat(
                fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
                child: Column(
              children: [
                GetBuilder<HomeController>(builder: (context) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: control.listNews.length,
                      itemBuilder: (context, index) {
                        News news = control.listNews[index];
                        if (control.listNews[index].category == kategori) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8, top: 16),
                            child: GestureDetector(
                              onTap: () =>
                                  Get.toNamed(Routes.NEWS, arguments: news.url),
                              child: SizedBox(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${news.name}',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    '${news.description}',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 32),
                                  Divider(
                                    color: Colors.grey.shade300,
                                    height: 0,
                                    thickness: 1.1,
                                  )
                                ],
                              )),
                            ),
                          );
                        } else {
                          return SizedBox();
                        }
                      });
                })
              ],
            ))));
  }
}
