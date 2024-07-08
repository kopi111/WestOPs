import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:westops/modles/trafficCode.dart';


class TrafficBookPage extends StatefulWidget {
  const TrafficBookPage({super.key});

  @override
  _TrafficBookPageState createState() => _TrafficBookPageState();
}

class _TrafficBookPageState extends State<TrafficBookPage> {
  TextEditingController searchController = TextEditingController();
  section sectionInstance = section();
  point points = point();
  offence offen = offence();
  offence offenceInstance = offence();
  Fine amount = Fine();
  Code codes = Code();

  List<String> filteredCodes = [];
  List<String> filteredDescriptions = [];
  List<double> filteredFineAmount = [];
  List<int> filteredPoints = [];
  List<String> filteredSectionOfRTA = [];

  @override
  void initState() {
    super.initState();
    filteredDescriptions = offenceInstance.offenceDescription;
    filteredSectionOfRTA = sectionInstance.sectionOfRTA;
    filteredPoints = points.points;
    filteredFineAmount = Fine.fineAmount;

    filteredCodes = Code.codeList;
  }

  void filterOffences(String query) {
    filteredCodes = [];
    filteredDescriptions = [];
    filteredFineAmount = [];
    filteredPoints = [];
    filteredSectionOfRTA = [];

    for (int i = 0; i < offen.offenceDescription.length; i++) {
      if (offen.offenceDescription[i].toLowerCase().contains(query.toLowerCase())) {
        filteredCodes.add(Code.codeList[i]);
        filteredDescriptions.add(offen.offenceDescription[i]);
        filteredFineAmount.add(Fine.fineAmount[i]);
        filteredPoints.add(points.points[i]);
        filteredSectionOfRTA.add(sectionInstance.sectionOfRTA[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wording Page")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  filterOffences(value);
                });
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCodes.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(filteredCodes[index]),
                  color: Colors.blue,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OffenceDetailsPage(
                            offenceClass: OffenceClass(
                              offence: filteredDescriptions[index],
                              code: filteredCodes[index],
                              findAmount: filteredFineAmount[index],
                              points: filteredPoints[index],
                              section: filteredSectionOfRTA[index],
                            ),
                          ),
                        ),
                      );
                    },
                    leading: Text(
                      filteredCodes[index],
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    title: Text(
                      filteredDescriptions[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OffenceDetailsPage extends StatelessWidget {
  final OffenceClass offenceClass;

  const OffenceDetailsPage({super.key, required this.offenceClass});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Offence Details")),
      body: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              "Code: ${offenceClass.code}",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 10),

            Text(
              "Fine Amount: ${NumberFormat.currency(locale: 'en_US', symbol: '').format(offenceClass.findAmount)}",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          
            const SizedBox(height: 10),
            Text(
              "Points: ${offenceClass.points}",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              "Section: ${offenceClass.section}",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Offence: ${offenceClass.offence}",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}