import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/di_container.dart';
import '../blocs/on_duty_bloc.dart';

class MessageInteractionPage extends StatelessWidget {
  const MessageInteractionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message Interaction'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<OnDutyBloc>(
            create: (_) => diContainer<OnDutyBloc>(),
          ),
        ],
        child:
            BlocConsumer<OnDutyBloc, OnDutyState>(listener: (context, state) {
          if (state is Full) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Get message success!')),
            );
          } else if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Get message failed")),
            );
          }
        }, builder: (context, state) {
          return Column(
            children: [
              // Top Message Box
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(16.0),
                child: const Row(
                  children: [
                    Icon(Icons.warning, color: Colors.yellow),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'RAHMAT (45678)',
                            style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'Proses Blasting sedang berlangsung pastikan Anda berada pada area aman',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            '23 Nov 2024, 12:00',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                  child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  color: Colors.black,
                ),
              )),

              if (state is Full)
                Flexible(
                  flex: 0,
                  child: Container(
                    color: Colors.black,
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          spacing: 10,
                          children: [
                            ...state.messages.map(
                              (e) => ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0, vertical: 12.0),
                                ),
                                child: Text(e.defaultMessage ?? ""),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              if (state is Loading)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),

              if (state is! Full && state is! Loading)
                // Action Buttons
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Column(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: ListView(
                              padding: const EdgeInsets.all(16.0),
                              children: const [
                                SizedBox.shrink(),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[800],
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 12.0),
                              ),
                              child: const Text('Balas Nanti'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context.read<OnDutyBloc>().add(Fetch());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 12.0),
                              ),
                              child: const Text('Mengerti'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              // Bottom Buttons
              Container(
                color: Colors.black,
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12.0),
                      ),
                      child: const Text('EMERGENCY'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12.0),
                      ),
                      child: const Text('BREAKDOWN'),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
