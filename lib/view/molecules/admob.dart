import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/viewmodel/admob_view_model.dart';

class AdMobPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final adMobViewModel = useProvider(adMobViewModelNotifierProvider);
    if (!adMobViewModel.loadingAnchoredBanner) {
      adMobViewModel.loadingAnchoredBanner = true;
      adMobViewModel.createAnchoredBanner(context);
    }
    if (adMobViewModel.anchoredBanner != null) {
      return Container(
        width: adMobViewModel.anchoredBanner!.size.width.toDouble(),
        height: adMobViewModel.anchoredBanner!.size.height.toDouble(),
        child: AdWidget(ad: adMobViewModel.anchoredBanner!),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
