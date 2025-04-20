import 'package:flutter/material.dart';
import 'package:imetys_muistio/types/milk.dart';
import 'package:imetys_muistio/widgets/custom_app_bar.dart';

class MilkPage extends StatefulWidget {
  const MilkPage({super.key});

  @override
  State<MilkPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MilkPage> {
  MilkType type = MilkType.breast;
  final TextEditingController commentController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Lisää maito'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Valitse maitotyyppi'),
                Spacer(),
                DropdownButton<MilkType>(
                  value: type,
                  items:
                      MilkType.values.map((MilkType item) {
                        return DropdownMenuItem<MilkType>(
                          value: item,
                          child: Text(getMilkType(item)),
                        );
                      }).toList(),
                  onChanged: (MilkType? newValue) {
                    setState(() {
                      type = newValue!;
                    });
                  },
                  hint: Text('Valitse maitotyyppi'),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Paljonko meni (${type == MilkType.breast ? "min" : "ml"})?',
                ),
                Spacer(),
                Flexible(
                  child: TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Paljonko',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Flexible(
                child: TextField(
                  controller: commentController,
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: 'Kommentti?',
                    hintText: 'Kirjoita kommentti tähän...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Spacer(),
            TextButton(onPressed: () => saveMilk(), child: Text("Tallenna")),
          ],
        ),
      ),
    );
  }

  String getMilkType(MilkType type) {
    switch (type) {
      case MilkType.breast:
        return 'Rinta';
      case MilkType.pumped:
        return 'Pumpattu';
      case MilkType.substitute:
        return 'Korvike';
    }
  }

  void saveMilk() {
    Milk newMilk = Milk(
      type,
      amountController.text as int,
      comment: commentController.text,
    );
    commentController.dispose();
    amountController.dispose();
    super.dispose();
  }
}
