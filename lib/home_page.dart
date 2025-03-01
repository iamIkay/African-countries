import 'package:african_countries/features/countries/presentation/pages/countries_list.dart';
import 'package:flutter/material.dart';

import 'features/countries/presentation/widgets/search_input.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 350.0,
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage("assets/map.png"))),
            ),
          ],
        ),
        bottomSheet: Stack(
          children: [
            const Positioned(
                top: 80.0, left: 20.0, right: 20.0, child: SearchInput()),
            DraggableScrollableSheet(
                initialChildSize: 0.6,
                minChildSize: 0.6,
                maxChildSize: 0.9,
                builder: (context, scrollController) {
                  return Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.grey[100]?.withOpacity(0.8),
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(32)),
                      ),
                      child: CountriesList(scrollController));
                }),
          ],
        ),
      ),
    );
  }
}
