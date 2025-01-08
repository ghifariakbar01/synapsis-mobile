import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/di_container.dart';
import '../../../../init/init_bloc.dart';
import '../../../../routes/router.dart';
import '../../../device_management/presentation/cubits/register_cubit.dart';
import '../../../unit_management/presentation/cubits/unit_management_cubit.dart';
import '../../domain/entities/login_tablet.dart';
import '../blocs/login_bloc.dart';
import '../cubit/login_cubit.dart';
import '../widgets/login_heading_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (_) => diContainer<LoginBloc>(),
          ),
          BlocProvider<LoginCubit>(
            create: (_) => diContainer<LoginCubit>(),
          ),
          BlocProvider<RegisterCubit>(
            create: (_) => diContainer<RegisterCubit>(),
          ),
          BlocProvider<UnitManagementCubit>(
            create: (_) => diContainer<UnitManagementCubit>(),
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
              child: BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is SuccessLogin) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login success!')),
                    );

                    NavigationService.of(context)
                        .pushAndRemoveAll(Routes.onDutyScreen);
                  } else if (state is ErrorLogin) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Login failed")),
                    );
                  }
                },
                builder: (context, state) {
                  final loginCubit = context.watch<LoginCubit>();
                  final unitCubit = context.watch<UnitManagementCubit>();
                  final registerCubit = context.watch<RegisterCubit>();

                  return Column(
                    spacing: 16.0,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const LoginHeadingWidget(),
                      Text('Unit Id : ${unitCubit.state.deviceId} '),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextFormField(
                          initialValue: loginCubit.state,
                          onChanged: (value) {
                            context.read<LoginCubit>().update(value);
                          },
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text('Serial Number : ${registerCubit.state}'),
                      if (state is LoadingLogin)
                        const CircularProgressIndicator()
                      else if (state is InitialLogin || state is ErrorLogin)
                        ElevatedButton(
                          onPressed: () {
                            if (loginCubit.state.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please insert nik!')),
                              );
                            }

                            context.read<InitBloc>().add(StartAppEvent());

                            context.read<LoginBloc>().add(
                                  Login(
                                    item: LoginTablet.data(
                                      nik: loginCubit.state,
                                    ),
                                  ),
                                );
                          },
                          child: const Text('Login'),
                        ),
                      // if (state is Success)
                      // const Text('Successfully logged in',
                      //     style: TextStyle(
                      //       fontSize: 14,
                      //       color: Colors.green,
                      //     )),
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
