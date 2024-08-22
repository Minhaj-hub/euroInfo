import 'package:dio/dio.dart';
import 'package:euroinfo/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../data/api_services/api_services.dart';
import '../../data/model/country.dart';
import '../../utils/style.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  List<Country> countries = [];
  String sortBy = 'Name';
  final dio = Dio();

  void fetchContries() async {
    ApiService apiService = ApiService(dio);
    final fetchedContries = await apiService.getEuropeanCountries();

    setState(() {
      countries = fetchedContries;
      sortCountries(sortBy);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchContries();
  }

  void sortCountries(String sortBy) {
    // Sorting logic based on the selected criteria
    if (sortBy == 'Name') {
      countries.sort((a, b) => a.commonName.compareTo(b.commonName));
    } else if (sortBy == 'Population') {
      countries.sort((a, b) => a.population.compareTo(b.population));
    } else if (sortBy == 'Capital') {
      countries.sort((a, b) => a.capital[0].compareTo(b.capital[0]));
    }
  }

  Widget appTitle() {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'European Countries',
          style: TextStyle(fontSize: 20, color: whiteClr),
        ),
        Container(
          decoration: BoxDecoration(
            color: whiteClr,
            borderRadius: BorderRadius.circular(8.0),
          ),
          width: screenWidth / 3,
          child: DropdownButtonFormField<String>(
            dropdownColor: whiteClr,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 7.5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: greyClr, // Set the border color
                  width: 1.5, // Set the border width
                ),
              ),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            value: sortBy,
            items: ['Name', 'Population', 'Capital'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                sortBy = value!;
                sortCountries(sortBy);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget body() {
    if (countries.isNotEmpty) {
      return SafeArea(
        child: ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, index) {
            final country = countries[index];

            return Card(
              color: cardBgClr,
              elevation: 3,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ExpansionTile(
                leading:
                    Image.network(country.flags.png, width: 50, height: 30),
                title: Text(country.commonName),
                subtitle: Text(
                    country.capital.isNotEmpty ? country.capital[0] : 'N/A'),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Region: ',
                              style: headerStyle,
                            ),
                            Text(
                              'Official Name: ',
                              style: headerStyle,
                            ),
                            Text(
                              'Capital: ',
                              style: headerStyle,
                            ),
                            Text(
                              'Population: ',
                              style: headerStyle,
                            ),
                            Text(
                              'Languages: ',
                              style: headerStyle,
                            )
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                country.region,
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                              Text(
                                country.officialName,
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                              Text(
                                country.capital.join(", "),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                              Text(
                                '${country.population}',
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                              Text(
                                country.languages.values.join(", "),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: appBarClr, title: appTitle()),
        body: body());
  }
}
