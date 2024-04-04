import 'package:splitwise_clone/res/app_imports.dart';
import 'package:splitwise_clone/screens/authenticate/register/domain/entities/register_form_bloc_model.dart';
import 'package:splitwise_clone/screens/authenticate/register/presentation/bloc/register_form_bloc.dart';
import 'package:splitwise_clone/ui/components/app_form_field.dart';

/// Register user screen with basic methods and bloc for state management.
class RegisterScreen extends StatelessWidget {
  final registerBloc = RegisterFormBloc()..add(InitEvent());

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => registerBloc,
          child: const MyForm(),
        ),
      ),
    );
  }
}

class MyForm extends StatelessWidget {
  const MyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterFormBloc, RegisterFormState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: state.formKey,
            child: Container(
              constraints: (kIsWeb)
                  ? const BoxConstraints(maxWidth: 500)
                  : const BoxConstraints(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  AppFormField(
                    hintText: AppStrings.nameStr,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r"[a-zA-Z]+|\s")),
                    ],
                    onChange: (val) {
                      BlocProvider.of<RegisterFormBloc>(context).add(
                          NameChangeEvent(
                              name: RegisterFormBlocModel(value: val!)));
                    },
                    validator: (val) {
                      return state.name.error;
                    },
                  ),
                  AppFormField(
                    hintText: "Email",
                    onChange: (val) {
                      BlocProvider.of<RegisterFormBloc>(context).add(
                          EmailChangeEvent(
                              email: RegisterFormBlocModel(value: val!)));
                    },
                    validator: (val) {
                      return state.email.error;
                    },
                  ),
                  AppFormField(
                    hintText: "Password",
                    onChange: (val) {
                      BlocProvider.of<RegisterFormBloc>(context).add(
                          PasswordChangeEvent(
                              password: RegisterFormBlocModel(value: val!)));
                    },
                    validator: (val) {
                      return state.password.error;
                    },
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<RegisterFormBloc>(context)
                                .add(FormSubmitEvent());
                          },
                          child: const Text(AppStrings.submitStr)),
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<RegisterFormBloc>(context)
                                .add(FormResetEvent());
                          },
                          child: const Text(AppStrings.clearStr)),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.replace(RouteKeys.phoneAuthScreen);
                      },
                      child: const Text("Nav to phone auth")),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
