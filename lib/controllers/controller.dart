import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/constants.dart';
import 'package:portfolio/models/boos_info.dart';
import 'package:portfolio/models/work_model.dart';

class PortfolioController extends GetxController {
  late Image logo;
  var hovers = List.generate(10, (index) => false).obs;
  var animation = 0.0.obs;
  var index = 0.obs;
  late ScrollController scrollController;
  RxDouble backgroundOpacity = 0.0.obs;
  Rx<BossInfo> bossInfo = BossInfo().obs;
  RxList<WorkModel> works = <WorkModel>[].obs;

  RxBool isLoading = false.obs;

  void activateHover(int index) {
    for (int i = 0; i < hovers.length; i++) {
      hovers[i] = !(index == i);
    }
    hovers.refresh();
  }

  void disableHover() {
    for (int i = 0; i < hovers.length; i++) {
      hovers[i] = false;
    }
    hovers.refresh();
  }

  Future<void> fetchWorks() async {
    http.Response response = await http.get(
      Uri.parse(
        '$baseApiUrl/works?populate=mainPicture,pictures',
      ),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      works.value = WorkModel.listFromJson(
        json['data'],
      );
      works.refresh();
    }
  }

  Future<void> fetchBossInfo() async {
    http.Response response = await http.get(
      Uri.parse(
        '$baseApiUrl/about?populate=resume',
      ),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      bossInfo.value = BossInfo.fromJson(
        json['data']['attributes'],
      );
      bossInfo.refresh();
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    hovers.value = List.generate(works.length, (index) => false);
    scrollController = ScrollController();
    await fetchWorks();
    await fetchBossInfo();
  }
}
