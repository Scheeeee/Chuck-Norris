import 'package:chuck_norris_app/01_presentation/generator/widgets/custom_button.dart';
import 'package:chuck_norris_app/01_presentation/generator/widgets/error_message.dart';
import 'package:chuck_norris_app/01_presentation/generator/widgets/fact_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../02_application/fact/fact_bloc.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final factBloc = FactBloc();
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chuck Norris Fact Generator",
          style: themeData.textTheme.headline1,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: BlocBuilder<FactBloc, FactState>(
                    bloc: factBloc,
                    builder: (context, factState) {
                      if (factState is FactInitial) {
                        return Text(
                          "The next Chuck Norris Fact is waiting for you!",
                          textAlign: TextAlign.center,
                          style: themeData.textTheme.headline1,
                        );
                      } else if (factState is FactStateLoading) {
                        return CircularProgressIndicator(
                            color: themeData.colorScheme.secondary);
                      } else if (factState is FactStateLoaded) {
                        return FactField(
                          fact: factState.fact,
                        );
                      } else if (factState is FactStateError) {
                        return ErrorMessage(
                          message: factState.message,
                        );
                      }
                      return const Placeholder();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: Center(
                  child: CustomButton(
                    onPressed: () {
                      factBloc.add(FactRequestedEvent());
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
