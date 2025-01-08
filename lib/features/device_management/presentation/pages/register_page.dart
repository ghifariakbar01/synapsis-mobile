import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/di_container.dart';
import '../../../../routes/router.dart';
import '../blocs/crud/crud_bloc.dart';
import '../cubits/register_cubit.dart';
import 'widgets/heading_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MultiBlocProvider(
        providers: [
          BlocProvider<CrudBloc>(
            create: (_) => diContainer<CrudBloc>(),
          ),
          BlocProvider<RegisterCubit>(
            create: (_) => RegisterCubit(),
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
              child: BlocConsumer<CrudBloc, CrudState>(
                listener: (context, state) {
                  if (state is SuccessRegister) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Device registered successfully!')),
                    );
                  } else if (state is SuccessActivate) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Success activate. Redirecting to new page now...')),
                    );
                  } else if (state is Error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  final registerCubit = context.watch<RegisterCubit>();
                  print('registerCubit: ${registerCubit.state}');

                  return Column(
                    spacing: 16.0,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const HeadingWidget(),
                      const Text(
                        'Your serial number',
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
                          registerCubit.state,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          NavigationService.of(context)
                              .navigateTo(Routes.processScreen);
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
