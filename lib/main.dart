import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_number/widgets/call_code_button.dart';
import 'package:phone_number/widgets/next_button.dart';
import 'package:phone_number/widgets/number_input.dart';

import 'bloc/bloc.dart';
import 'util/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryBloc>(
          create: ((context) => CountryBloc()..add(LoadCountry())),
        ),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.background,
      body: BlocBuilder<CountryBloc, CountryState>(builder: (context, state) {
        if (state.countries.isNotEmpty) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 80.0,
                    left: 20,
                  ),
                  child: const Text(
                    "Get started",
                    style: ThemeText.header,
                  ),
                ),
                Row(
                  children: [
                    callCodeButton(context),
                    numberInput(context),
                  ],
                ),
                nextButton(context),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: ThemeColor.textColor,
            ),
          );
        }
      }),
    );
  }
}
