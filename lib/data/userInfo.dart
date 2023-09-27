enum TransactionType { outflow, inflow }

enum ItemCategoryType { jajan, wajib, fashion, makan }

class UserInfo {
  final String name;
  final String totalBalance;
  final String inflow;
  final String outflow;
  final List<Transaction> transactions;

  const UserInfo(
      {required this.name,
      required this.totalBalance,
      required this.inflow,
      required this.outflow,
      required this.transactions});
}

class Transaction {
  final ItemCategoryType categoryType;
  final TransactionType transactionType;
  final String itemCategoryName;
  final String itemName;
  final String amount;
  final String date;

  const Transaction(this.categoryType, this.transactionType,
      this.itemCategoryName, this.itemName, this.amount, this.date);
}

const List<Transaction> transactions1 = [
  Transaction(ItemCategoryType.fashion, TransactionType.outflow, "shoes",
      "nike", "\$3,500.00", "Oct, 23"),
  Transaction(ItemCategoryType.jajan, TransactionType.outflow, "jajan",
      "dragon", "\$500.00", "Oct, 28"),
];
const List<Transaction> transactions2 = [
  Transaction(ItemCategoryType.makan, TransactionType.outflow, "makan",
      "naspad", "\$500.00", "Sept, 23"),
  Transaction(ItemCategoryType.makan, TransactionType.outflow, "makan",
      "warteg", "\$500.00", "Nov, 28"),
];

const userdata = UserInfo(
    name: "wildan",
    totalBalance: "\$4,586.00",
    inflow: "\$4,000.00",
    outflow: "\$2000.00",
    transactions: transactions1);
