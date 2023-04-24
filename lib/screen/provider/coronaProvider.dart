import 'package:coronaapi/screen/model/coronamodel.dart';
import 'package:coronaapi/utils/corona_helper.dart';
import 'package:flutter/widgets.dart';


class CoronaProvider extends ChangeNotifier {
  Future<CoronaModel> getCoronaData() async {
    CoronaHelper coronaHelper = CoronaHelper();
    CoronaModel c1 = await coronaHelper.getCoronaApi();
    return c1;
  }
}