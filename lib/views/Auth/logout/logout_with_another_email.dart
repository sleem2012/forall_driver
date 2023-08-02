




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app.dart';
import '../../../logic/auth/logout/logout_bloc.dart';
import '../../../logic/auth/logout/logout_state.dart';
import '../../../shared/localization/trans.dart';

class LogoutWithAnotherEmail extends StatelessWidget {
  const LogoutWithAnotherEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutBloc, LogoutState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Wrapper()));
          },
        );
      },
      builder: (context, state) {
        return TextButton(
          onPressed: LogoutBloc.of(context).logout,
          child: Text(
            state.maybeWhen(
              orElse: () => Tr.get.login_with_another_email,
              loading: () => Tr.get.loading,
            ),
          ),
        );
      },
    );
  }
}
