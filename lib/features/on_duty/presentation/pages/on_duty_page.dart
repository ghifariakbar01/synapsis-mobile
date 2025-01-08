import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../di/di_container.dart';
import '../../../../init/init_bloc.dart';
import '../../../../routes/router.dart';
import '../../../auth/presentation/blocs/login_bloc.dart';
import '../blocs/on_duty_bloc.dart';
import 'message_interaction_page.dart';

class OnDutyPage extends StatelessWidget {
  const OnDutyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: MultiBlocProvider(
          providers: [
            BlocProvider<OnDutyBloc>(
              create: (_) => diContainer<OnDutyBloc>()..add(Subscribe()),
            ),
            BlocProvider<LoginBloc>(
              create: (_) => diContainer<LoginBloc>(),
            ),
          ],
          child: BlocListener<InitBloc, InitState>(
            listener: (context, state) {
              print('state: ${state}');
              if (state is Unauth) {
                NavigationService.of(context)
                    .pushAndRemoveAll(Routes.registScreen);
              }
            },
            child: BlocConsumer<LoginBloc, LoginState>(listener: (_, state) {
              print('state: ${state}');
              if (state is SuccessLogout) {
                context.read<InitBloc>().add(StartAppEvent());
              }
            }, builder: (context, state) {
              return Stack(
                children: [
                  // Map Background
                  Positioned.fill(
                    child: Container(
                      color: Colors.grey.shade200, // Placeholder for the map
                      child: const Center(
                        child: Icon(Icons.navigation,
                            size: 50, color: Colors.blue),
                      ),
                    ),
                  ),
                  // Top Bar
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Text(
                                "TR-4002 SELATAN EX-4002 COALS 25%",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.battery_full,
                                  color: Colors.white),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: () async {
                                  final isLogout = await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Confirm Logout'),
                                        content: const Text(
                                            'Are you sure you want to log out?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(null);
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(true);
                                            },
                                            child: const Text('Yes'),
                                          ),
                                        ],
                                      );
                                    },
                                  );

                                  if (isLogout != null) {
                                    context.read<LoginBloc>().add(Logout());
                                  }
                                },
                                child: Text(
                                  "${DateFormat('HH:mm').format(DateTime.now())} Ghifari",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Left Panel
                  Positioned(
                    left: 16,
                    top: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoTile("Speed", "75 km/h", Colors.red),
                        _buildInfoTile("Achievement", "50%", Colors.blue),
                        _buildInfoTile("Materials", "COALS", Colors.grey),
                      ],
                    ),
                  ),
                  // DSP Panel
                  Positioned(
                    bottom: 100,
                    left: 16,
                    right: 16,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        color: Colors.black,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "DSP-2",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              "14m 42s | 1Km To Go",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Bottom Buttons
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildButton("EMERGENCY", Colors.red),
                          _buildButton("BREAKDOWN", Colors.orange),
                          IconButton(
                            icon: const Icon(
                              Icons.mail,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MessageInteractionPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Right Panel
                  Positioned(
                    right: 16,
                    top: 100,
                    child: Column(
                      children: [
                        _buildButton("End Activity", Colors.orange),
                        const SizedBox(height: 8),
                        _buildButton("Activity", Colors.blue),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: color.withAlpha(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16, color: color)),
            Text(value,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String title, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(title, style: const TextStyle(color: Colors.white)),
    );
  }
}
