import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news/app/data/news_model.dart';

class HomeController extends GetxController {
  List<String> listCategori = [];
  List<News> listNews = [];
  List<Map<String, String>> sources = [];

  getCategory() async {
    String apiKey = '42f20b17a8e74a508b59b7c819f05110';
    var respons = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines/sources?apiKey=$apiKey'));

    try {
      if (respons.statusCode == 200) {
        var data = json.decode(respons.body);
        List<String> categories = [];
        for (var item in data['sources']) {
          categories.add(item['category']);
        }

        listCategori = categories.toSet().toList();
        List<dynamic> list = (json.decode(respons.body)['sources']);
        listNews = list.map((e) => News.fromJson(e)).toList();

        update();
        // ignore: avoid_print
        print(sources);
      } else {
        // ignore: avoid_print
        print('gagal');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  List<String> images = [
    "https://images.unsplash.com/photo-1464692805480-a69dfaafdb0d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    "https://images.unsplash.com/photo-1665686308827-eb62e4f6604d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    "https://images.unsplash.com/photo-1496171367470-9ed9a91ea931?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    "https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1738&q=80",
    "https://images.unsplash.com/photo-1603190287605-e6ade32fa852?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    "https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2532&q=80",
    "https://images.unsplash.com/photo-1532094349884-543bc11b234d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80"
  ];

  @override
  void onInit() {
    super.onInit();
    getCategory();
  }
}
