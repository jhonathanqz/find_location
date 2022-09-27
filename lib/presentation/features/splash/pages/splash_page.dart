import 'package:flutter/material.dart';

import 'package:find_location/app/injection_container.dart';
import 'package:find_location/presentation/features/splash/mobx/splash.store.dart';
import 'package:find_location/presentation/shared/global/cache_image/cache_image_widget.dart';
import 'package:find_location/presentation/shared/style/app_colors.dart';
import 'package:find_location/utils/layout.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _opacity = 0.0;
  Future<void> showLogo() async {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
    setState(() => _opacity = 1.0);
  }

  @override
  void initState() {
    _init();
    sl<SplashStore>().dismissSplashScreen(context);
    super.initState();
  }

  void _init() async {
    await showLogo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Layout.getSize(context).height,
      width: Layout.getSize(context).width,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width / 2.5,
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 1),
              child: const CacheImageWidget(
                imageUrl:
                    'https://assets.stickpng.com/thumbs/5888920ebc2fc2ef3a1860a9.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
