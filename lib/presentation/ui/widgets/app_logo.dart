import 'package:ecom_project_using_rest_api/presentation/ui/utlity/asset_path.dart';
import 'package:flutter/material.dart';
class AppLogo extends StatelessWidget {
  final double? width;
  final double? height;
  const AppLogo({super.key,this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetPath.logo,
      width: width??122,
      height: height??height,
    );
  }
}
