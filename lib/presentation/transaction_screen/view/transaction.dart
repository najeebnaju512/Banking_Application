import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/global_text_style.dart';
import '../../../global_widget/global_appbar.dart';
import '../../../repository/api/transaction_screen/model/transaction_screen_model.dart';
import '../../bottom_navigation_screen/controller/bottom_nav_controller.dart';
import '../controller/transaction_controller.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  void initState() {
    fetchData(context);
    super.initState();
  }

  void fetchData(BuildContext context) async {
    await Provider.of<TransactionController>(context, listen: false)
        .fetchTransactionData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GLAppBar(
        title: "TRANSACTIONS",
        centerTitle: true,
        titleTextStyle: GLTextStyles.titleStyle,
        leading: Consumer<BottomNavigationController>(
          builder: (context, bControl, child) {
            return IconButton(
              onPressed: () {
                bControl.currentIndex = 0;
              },
              icon: const Icon(Icons.arrow_back),
            );
          },
        ),
      ),
      body: Consumer<TransactionController>(
        builder: (context, tControl, child) {
          return tControl.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemCount: tControl.transactionHistory!.length,
                  itemBuilder: (context, index) {
                    TransactionModel transaction =
                        tControl.transactionHistory!.reversed.toList()[index];
                    String formattedDate = DateFormat('dd-MM-yy')
                        .format(transaction.dateOfTransaction!);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          color: ColorTheme.grey.withOpacity(0.5),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            // Date in order
                            formattedDate,
                            style: GLTextStyles.labeltxtBlk12,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    TransactionModel transaction =
                        tControl.transactionHistory!.reversed.toList()[index];
                    return ListTile(
                      title: Text(
                        // Check whether it is payment received or payment done and mention that or if payment done for any bill payment
                        transaction.userBillPayments != null
                            ? 'Bill Payment: ${transaction.userBillPayments}'
                            : 'Transaction',
                        style: GLTextStyles.labeltxtBlk16,
                      ),
                      subtitle: Text(
                        // Mention if received where it's received from if sent where to
                        transaction.receivingAccountHolderNameUsername != null
                            ? 'To: ${transaction.receivingAccountHolderNameUsername ?? ""}'
                            : 'From: ${transaction.senderUserUsername}',
                        style: GLTextStyles.subtitleGrey,
                      ),
                      trailing: Text(
                        // Amount
                        "${transaction.amount}",
                        style: GLTextStyles.labeltxtBlk16,
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
