import 'package:splitwise_clone/res/app_imports.dart';

import '../../../../ui/components/app_form_field.dart';
import 'bloc/phone_auth_bloc.dart';

class PhoneAuthScreen extends StatelessWidget {
  PhoneAuthScreen({super.key});
  final phoneAuthBloc = PhoneAuthBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /*AppFormField(
              hintText: "Phone",
              onChange: (val) {
                //phoneAuthBloc
                *//*
              BlocProvider.of<RegisterFormBloc>(context).add(
                  EmailChangeEvent(
                      email: RegisterFormBlocModel(value: val!)));*//*
              },
              validator: (val) {
                return state.email.error;
              },
            ),*/
            ElevatedButton(
                onPressed: () {
                  context.replace(RouteKeys.homeScreen);
                },
                child: const Text("Verify")
            ),
          ],
        ),
      ),
    );
  }
}
