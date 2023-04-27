import 'package:coronaapi/screen/model/coronamodel.dart';
import 'package:coronaapi/screen/provider/coronaProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoronaScreen extends StatefulWidget {
  const CoronaScreen({Key? key}) : super(key: key);

  @override
  State<CoronaScreen> createState() => _CoronaScreenState();
}

class _CoronaScreenState extends State<CoronaScreen> {
  CoronaProvider? coronaProviderT;
  CoronaProvider? coronaProviderF;

  @override
  Widget build(BuildContext context) {
    coronaProviderT = Provider.of<CoronaProvider>(context, listen: true);
    coronaProviderF = Provider.of<CoronaProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Corona",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: coronaProviderF!.getCoronaData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  CoronaModel? c1 = snapshot.data;

                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: double.infinity,
                          child: Container(
                            height: 200,
                            width: double.infinity,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade300,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${c1.countriesStat[index].countryName}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                      "TotalCases - ${c1.countriesStat[index].cases}",
                                      style: TextStyle(color: Colors.black87)),
                                  Text(
                                      "ActiveCases - ${c1.countriesStat[index].activeCases}",
                                      style: TextStyle(color: Colors.black87)),
                                  Text(
                                      "Death - ${c1.countriesStat[index].deaths}",
                                      style: TextStyle(color: Colors.black87)),
                                  Text(
                                      "NewDeaths - ${c1.countriesStat[index].newDeaths}",
                                      style: TextStyle(color: Colors.black87)),
                                  Text(
                                      "DeathsPer1MP - ${c1.countriesStat[index].deathsPer1MPopulation}",
                                      style: TextStyle(color: Colors.black87)),
                                  Text(
                                      "TotalRecoverd - ${c1.countriesStat[index].totalRecovered}",
                                      style: TextStyle(color: Colors.black87)),
                                  Text(
                                      "TotalTests - ${c1.countriesStat[index].totalTests}",
                                      style: TextStyle(color: Colors.black87)),
                                  Text(
                                      "TotalCasesPer1MP - ${c1.countriesStat[index].totalCasesPer1MPopulation}",
                                      style: TextStyle(color: Colors.black87)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: c1!.countriesStat.length,
                  );
                }
                return Container(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    ));
  }
}
