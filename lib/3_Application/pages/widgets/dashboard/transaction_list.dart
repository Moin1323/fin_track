import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List transactions;
  TransactionList({super.key, required this.transactions});

  final String currentDate = DateFormat('EEEE, d MMMM').format(DateTime.now());
  void deleteFunction(BuildContext context) {}
  void editFunction(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (transactions.length < 8)
          ? 1 * MediaQuery.of(context).size.height
          : (transactions.length / 8) * MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF1A1D3A),
            Color(0xFF302C6B),
            Color(0xFF5B2586),
          ],
          transform: GradientRotation(32),
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0, left: 12, top: 14),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          color: Theme.of(context).colorScheme.secondary,
                          child: Wrap(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.edit,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                title: Text('Edit',
                                    style: GoogleFonts.poppins(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                      fontSize: 16,
                                    )),
                                onTap: () {
                                  Navigator.pop(context);
                                  editFunction(context); // Call edit function
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.delete,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                title: Text('Delete',
                                    style: GoogleFonts.poppins(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                      fontSize: 16,
                                    )),
                                onTap: () {
                                  Navigator.pop(context);
                                  deleteFunction(
                                      context); // Call delete function
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: ListTile(
                      leading: Icon(
                        transactions[index].status == 'Earning'
                            ? Icons.check_circle
                            : Icons.remove_circle,
                        color: transactions[index].status == 'Earning'
                            ? Colors.green
                            : Colors.red,
                      ),
                      title: Text(
                        transactions[index].sourceName,
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${transactions[index].date.toLocal()}'.split(' ')[0],
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      trailing: Text(
                        '${transactions[index].status == 'Earning' ? '+' : '-'} Rs. ${transactions[index].amount}',
                        style: GoogleFonts.poppins(
                          color: transactions[index].status == 'Earning'
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              currentDate,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
