import 'package:cleanapp/common/template/template.dart';
import 'package:recase/recase.dart';

class PageSample extends Template {
  final String feature;

  PageSample(this.feature)
      : super(
            'lib/features/${ReCase(feature).snakeCase}/presentation/${ReCase(feature).snakeCase}/pages/${ReCase(feature).snakeCase}_page.dart',
            overwrite: true);

  @override
  String get content => """
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/${ReCase(feature).snakeCase}_bloc.dart';

class ${ReCase(feature).pascalCase}Page extends StatelessWidget {
  const ${ReCase(feature).pascalCase}Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ${ReCase(feature).pascalCase}Bloc(),
      child: const ${ReCase(feature).pascalCase}Body(),
    );
  }
}

class ${ReCase(feature).pascalCase}Body extends StatelessWidget {
  const ${ReCase(feature).pascalCase}Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${ReCase(feature).pascalCase}'),
      ),
      body: BlocBuilder<${ReCase(feature).pascalCase}Bloc, ${ReCase(feature).pascalCase}State>(
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
