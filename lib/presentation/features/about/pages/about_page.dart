import 'package:flutter/material.dart';

import 'package:find_location/presentation/shared/global/scaffold/scaffold_light.dart';
import 'package:find_location/presentation/shared/style/app_colors.dart';
import 'package:find_location/presentation/shared/style/app_size.dart';
import 'package:find_location/presentation/shared/style/app_text_styles.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return ScaffoldLight(
      child: SizedBox(
        height: _size.height,
        width: _size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: AppColors.primaryColor,
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.info,
                      size: AppSize.size45,
                      color: AppColors.white,
                    ),
                    Text(
                      'Sobre',
                      style: AppTextStyles.headingBold.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '''
        ***Feito por: Jhonathan Queiroz
         Projeto básico para realizar pesquisas de CEP e poder ter um controle de qual ou quais CEPS já foram pesquisados.
         ''',
                  style: AppTextStyles.title,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
