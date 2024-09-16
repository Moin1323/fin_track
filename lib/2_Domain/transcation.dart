class Transaction {
  final DateTime date;
  final String sourceName;
  final String status;
  final double amount;

  Transaction({
    required this.date,
    required this.sourceName,
    required this.status,
    required this.amount,
  });
}
