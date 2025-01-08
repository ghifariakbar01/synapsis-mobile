import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../features/on_duty/data/datasources/on_duty_datasource.dart';
import '../../features/on_duty/presentation/blocs/on_duty_bloc.dart';

@module
abstract class DiOndutyModule {
  @injectable
  OnDutyDatasource deviceManagementDataSource(Dio dio) {
    return OnDutyDatasource(dio);
  }

  @injectable
  OnDutyBloc onDutyBloc(OnDutyDatasource onDutyDatasource) {
    return OnDutyBloc(onDutyDatasource);
  }
}
