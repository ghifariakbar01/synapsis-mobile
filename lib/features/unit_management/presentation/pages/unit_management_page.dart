/*
   Discarded - Use postman instead
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/di_container.dart';
import '../../../../routes/router.dart';
import '../blocs/unit_management_bloc.dart';
import '../cubits/unit_management_cubit.dart';
import '../widgets/heading_widget.dart';

class UnitManagementPage extends StatelessWidget {
  const UnitManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MultiBlocProvider(
        providers: [
          BlocProvider<UnitManagementBloc>(
            create: (_) => diContainer<UnitManagementBloc>(),
          ),
          BlocProvider<UnitManagementCubit>(
            create: (_) => UnitManagementCubit(),
          ),
        ],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
                    blurRadius: 10.0,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: BlocConsumer<UnitManagementBloc, UnitManagementState>(
                listener: (context, state) {
                  if (state is Success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Device registered successfully!')),
                    );
                  } else if (state is Error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  final cubit = context.watch<UnitManagementCubit>();

                  return Column(
                    spacing: 16.0,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const HeadingWidget(),
                      const Text(
                        'Your Unit',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          cubit.state.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      if (state is Loading)
                        ElevatedButton(
                            onPressed: () {},
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ))
                      else
                        ElevatedButton(
                          onPressed: () async {
                            NavigationService.of(context)
                                .navigateTo(Routes.loginScreen);
                          },
                          child: const Text('Continue'),
                        ),
                      const SizedBox(height: 32),
                      const Text(
                        'Version 1.0.0',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
