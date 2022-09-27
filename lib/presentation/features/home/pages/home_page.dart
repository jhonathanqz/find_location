import 'package:flutter/material.dart';

import 'package:find_location/app/navigation_service.dart';
import 'package:find_location/app/routes.dart';
import 'package:find_location/presentation/features/home/widgets/home_header.dart';
import 'package:find_location/presentation/shared/global/scaffold/scaffold_primary.dart';
import 'package:find_location/presentation/shared/style/app_edge_insets.dart';
import 'package:find_location/presentation/shared/style/app_input_border.dart';
import 'package:find_location/presentation/shared/style/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPrimary(
      title: 'Home',
      child: Padding(
        padding: AppEdgeInsets.sdAll,
        child: Column(
          children: [
            Container(
              margin: AppEdgeInsets.bmd,
              padding: AppEdgeInsets.sdAll,
              width: double.infinity,
              decoration: AppInputBorder.borderRadius,
              child: const HomeHeader(),
            ),
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _card(
                    title: 'Pesquisar CEP',
                    icon: Icons.search,
                    onTap: () {
                      coolNavigate.navigateTo(Routes.search, args: 'reset');
                    },
                  ),
                  _card(
                    title: 'Histórico Pesquisas',
                    icon: Icons.file_copy,
                    onTap: () {
                      coolNavigate.navigateTo(Routes.history);
                    },
                  ),
                  _card(
                    title: 'Sobre',
                    icon: Icons.info,
                    onTap: () {
                      coolNavigate.navigateTo(Routes.about);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _card({
    required String title,
    required IconData icon,
    required Function() onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: Container(
          decoration:
              AppInputBorder.borderRadius.copyWith(color: Colors.blue.shade100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                size: 40,
              ),
              Flexible(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.title,
                ),
              ),
            ],
          ),
        ),
      );
}
