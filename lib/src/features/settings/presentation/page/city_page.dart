import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seerah/src/core/utils/S.dart';
import 'package:seerah/src/features/settings/domain/entities/city.dart';
import 'package:seerah/src/features/settings/presentation/bloc/cities_cubit/cities_bloc.dart';
import 'package:seerah/src/features/settings/presentation/bloc/cities_cubit/cities_event.dart';
import 'package:seerah/src/features/settings/presentation/bloc/cities_cubit/cities_state.dart';

class CityPage extends StatelessWidget {
  const CityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesBloc, CitiesState>(builder: (context, state) {
      List<City> cities = [];
      City currentCity = const City(name: "Астана", timezone: "6", slug: "Almaty");

      BlocProvider.of<CitiesBloc>(context, listen: false)
          .add(LoadCitiesEvent());

      if (state is CitiesLoaded) {
        cities = state.personsList;
        currentCity = state.currentCity;
        print(currentCity);
      } else if (state is CitiesError) {
        return Center(
          child: Text(
            state.message,
            style: const TextStyle(fontSize: 25),
          ),
        );
      }

      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Image.asset(
                "assets/images/settings/arrow-left.png",
                color: Colors.green,
                width: 30,
                height: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              S.of(context).city,
              style: const TextStyle(fontSize: 25),
            ),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                    },
                    title: Text(
                      cities[index].name,
                      style: const TextStyle(fontSize: 20),
                    ),
                    trailing: cities[index].name == currentCity.name
                        ? Image.asset(
                      "assets/images/settings/check.png",
                      color: Colors.green,
                      width: 25,
                      height: 25,
                    )
                        : null,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Divider(),
                  ), //                           <-- Divider
                ],
              );
            },
          ));
    });
  }
}
