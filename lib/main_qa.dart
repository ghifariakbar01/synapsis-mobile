import 'package:dio/dio.dart';
import 'app_runner.dart';
import 'config/build_type.dart';
import 'config/environment.dart';
import 'constants/urls.dart';

//^
//^ Edit router.dart for Initial route
//^

void main(List<String> args) {
  Environment.init(
      buildType: BuildType.qa,
      config: Dio(
        BaseOptions(baseUrl: BaseUrl.qa),
      ));

  run();
}
