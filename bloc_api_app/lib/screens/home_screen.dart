import 'package:bloc_api/blocs/user_bloc.dart';
import 'package:bloc_api/models/user_model.dart';
import 'package:bloc_api/repositories/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (context) => UserBloc(
          RepositoryProvider.of<ApiRepository>(context),
        )..add(ButtonPressedEvent()),
        child: _buildListWidget(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildListWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is UserFailureState) {
              return const Text('server error');
            }
            if (state is UserSuccessState) {
              List<UserModel> userList = state.users;
              print(userList[0].firstName);
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    // return Text('${userList[index].firstName}');
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        leading: const Icon(Icons.verified_user),
                        title: Text('${userList[index].firstName}'),
                        subtitle: Text('${userList[index].email}'),
                      ),
                    );
                  },
                  itemCount: userList.length);
            }
            return const Text('Something went wrong');
          },
        ),
      ],
    );
  }
}
