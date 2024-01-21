import 'package:cleanapp/common/template/template.dart';
import 'package:recase/recase.dart';

class PageSample extends Template {
  final String feature;
  final String screen;

  PageSample(this.feature, this.screen)
      : super(
            'lib/features/${ReCase(feature).snakeCase}/presentation/${ReCase(screen).snakeCase}/pages/${ReCase(screen).snakeCase}_page.dart',
            overwrite: true);

  @override
  String get content => """
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/${ReCase(screen).snakeCase}_bloc.dart';

class ${ReCase(screen).pascalCase}Page extends StatelessWidget {
  const ${ReCase(screen).pascalCase}Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ${ReCase(screen).pascalCase}Bloc(),
      child: const ${ReCase(screen).pascalCase}Body(),
    );
  }
}

class ${ReCase(screen).pascalCase}Body extends StatelessWidget {
  const ${ReCase(screen).pascalCase}Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${ReCase(screen).pascalCase}'),
      ),
      body: BlocBuilder<${ReCase(screen).pascalCase}Bloc, ${ReCase(screen).pascalCase}State>(
        builder: (context, state) {
          return const Center(
            child: Text('Hello World'),
          );
        },
      ),
    );
  }
}

""";
}
