import 'package:flutter/material.dart' hide SearchBar;
import 'package:lottie/lottie.dart';
import 'package:nav_app_4_host/providers/map_provider.dart';
import 'package:nav_app_4_host/providers/user_provider.dart';
import 'package:nav_app_4_host/ui/app_sizes.dart';
import 'package:nav_app_4_host/ui/general_widgets/custom_widgets/custom_container.dart';
import 'package:nav_app_4_host/utils/genral_utils.dart';
import 'package:provider/provider.dart';

import '../../../../app_const/resurces.dart';
import '../../../../models/favorit_location.dart';
import '../../../general_widgets/custom_widgets/custom_text.dart';
import '../../../general_widgets/search_bar.dart';

class AddFavoritSheet extends StatelessWidget {
  const AddFavoritSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> query = ValueNotifier<String>('');
    return GestureDetector(
      onTap: () => dismissKeyboard(context),
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        height: Sizes.screenHeigth(context) * .6,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            topBar(context, query),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Divider()),
            Expanded(
                child: UserProvider().user.favoritLocations.isEmpty
                    ? emptyList()
                    : favoritesList(context, query))
          ],
        ),
      ),
    );
  }

  Widget topBar(BuildContext context, ValueNotifier<String> query) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: SearchBar(query: query)),
          const SizedBox(width: 10),
          Expanded(child: addFromMapButton(context)),
        ],
      ),
    );
  }

  Widget addFromMapButton(BuildContext context) {
    return CustomContainer(
      userRegulatBorder: true,
      raduis: 5,
      onTap: () {
        context.read<MapProvider>().startEditMode();
        Navigator.pop(context);
      },
      alignment: Alignment.center,
      child: CustomText(
        "Add from map",
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  Widget emptyList() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Expanded(child: Lottie.asset(emptyAnimation)),
          const CustomText(
            "There are no favorite locations yet",
            align: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget favoritesList(BuildContext context, ValueNotifier<String> query) {
    List<FavoritLocation> favorites =
        context.watch<UserProvider>().user.favoritLocations.values.toList();
    return ValueListenableBuilder(
      valueListenable: query,
      builder: (context, currentQuery, child) {
        List<FavoritLocation> filteredList = favorites
            .where((element) => element.name.contains(currentQuery))
            .toList();
        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 10),
          itemCount: filteredList.length,
          itemBuilder: (context, index) {
            return singleFavoritItem(context, filteredList[index].name);
          },
        );
      },
    );
  }

  Widget singleFavoritItem(BuildContext context, String text) {
    return CustomContainer(
      raduis: 8,
      width: Sizes.screenWidth(context),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: CustomText(text),
    );
  }
}
