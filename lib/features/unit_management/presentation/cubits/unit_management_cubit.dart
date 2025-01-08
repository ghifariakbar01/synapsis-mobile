/*
   Discarded - Use postman instead
*/

import 'package:bloc/bloc.dart';

import '../../../../utils/string_utils.dart';
import '../../domain/entities/create_unit.dart';

class UnitManagementCubit extends Cubit<CreateUnit> {
  UnitManagementCubit()
      : super(CreateUnit.data(
          code: ''.generateRandomString,
          deviceId: 'RiPjLIcgsmZHgpu',
          serialNumber: ''.generateRandomString,
          engineNo: ''.generateRandomString,
          engineModel: ''.generateRandomString,
          purchasedDate: DateTime.now(),
        ));
}
