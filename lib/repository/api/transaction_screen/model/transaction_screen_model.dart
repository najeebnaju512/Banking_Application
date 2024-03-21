// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

List<TransactionModel> transactionModelFromJson(String str) => List<TransactionModel>.from(json.decode(str).map((x) => TransactionModel.fromJson(x)));

String transactionModelToJson(List<TransactionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionModel {
    String? senderUserUsername;
    String? receivingAccountHolderNameUsername;
    String? userBillPayments;
    String? transactionId;
    String? ifsc;
    int? accountNumber;
    int? amount;
    DateTime? dateOfTransaction;

    TransactionModel({
        this.senderUserUsername,
        this.receivingAccountHolderNameUsername,
        this.userBillPayments,
        this.transactionId,
        this.ifsc,
        this.accountNumber,
        this.amount,
        this.dateOfTransaction,
    });

    factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        senderUserUsername: json["sender_user_username"],
        receivingAccountHolderNameUsername: json["receiving_account_holder_name_username"],
        userBillPayments: json["user_bill_payments"],
        transactionId: json["transaction_id"],
        ifsc: json["ifsc"],
        accountNumber: json["account_number"],
        amount: json["amount"],
        dateOfTransaction: json["date_of_transaction"] == null ? null : DateTime.parse(json["date_of_transaction"]),
    );

    Map<String, dynamic> toJson() => {
        "sender_user_username": senderUserUsername,
        "receiving_account_holder_name_username": receivingAccountHolderNameUsername,
        "user_bill_payments": userBillPayments,
        "transaction_id": transactionId,
        "ifsc": ifsc,
        "account_number": accountNumber,
        "amount": amount,
        "date_of_transaction": dateOfTransaction?.toIso8601String(),
    };
}
