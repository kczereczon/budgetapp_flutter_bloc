import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letbudget/core/budgets/budgets_bloc.dart';
import 'package:letbudget/core/transactions/transactions_bloc.dart';
import 'package:letbudget/models/budget.dart';
import 'package:letbudget/screens/home/home.dart';
import 'package:letbudget/screens/home/sections/budget-section/budget-section.dart';
import 'package:letbudget/screens/home/sections/income-expenses-section/income_expenses_section_bloc.dart';
import 'package:letbudget/screens/home/sections/recent-transactions-section/recent-transactions-section.dart';
import 'package:letbudget/screens/home/sections/sections.dart';
import 'package:letbudget/utils/converter.dart';

class HomePage extends StatelessWidget {

  final Converter converter = Converter.pln();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<TransactionsBloc>(create: (_) => TransactionsBloc()),
      BlocProvider<BudgetsBloc>(create: (_) => BudgetsBloc()),
      BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
      BlocProvider<BudgetSectionBloc>(create: (_) => BudgetSectionBloc(converter: converter)),
      BlocProvider<IncomeExpensesSectionBloc>(create: (_) => IncomeExpensesSectionBloc()),
      BlocProvider<RecentTransactionsSectionBloc>(create: (_) => RecentTransactionsSectionBloc()),
      BlocProvider<WalletsSectionBloc>(create: (_) => WalletsSectionBloc())
    ], child: HomeView());
  }

  HomePage({Key? key}) : super(key: key);
}
