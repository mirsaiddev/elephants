import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/elephant.dart';
import '../../view_model/elephant_view_model.dart';
import '../elephants_detail_page/elephants_detail_page.dart';

class ElephantsMainPage extends StatefulWidget {
  @override
  _ElephantsMainPageState createState() => _ElephantsMainPageState();
}

class _ElephantsMainPageState extends State<ElephantsMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildConsumer(),
    );
  }

  AppBar _buildAppBar() => AppBar(
        title: Text(
          'Elephants',
        ),
        centerTitle: true,
      );

  Consumer<ElephantViewModel> _buildConsumer() {
    return Consumer<ElephantViewModel>(builder: (context, model, child) {
      if (model.elephanState == ElephantState.INITIAL) {
        return _buildInitial();
      } else if (model.elephanState == ElephantState.LOADING) {
        return _buildLoading();
      } else {
        return _buildSuccess(model.elephantModel);
      }
    });
  }

  Center _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Center _buildInitial() {
    return Center(
      child: Text('Initial'),
    );
  }

  ListView _buildSuccess(List elephants) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        Elephant _elephant = elephants[index];
        return _buildListTile(_elephant);
      },
      itemCount: 46,
    );
  }

  ListTile _buildListTile(var _elephant) {
    return ListTile(
      title: _buildListTileTitle(_elephant),
      leading: _buildListTileCircleImage(_elephant),
      subtitle: _buildListTileSubtitle(_elephant),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ElephantsDetailPage(
            elephant: _elephant,
          ),
        ),
      ),
    );
  }

  Text _buildListTileTitle(Elephant _elephant) {
    bool _isNameNull = false;
    if (_elephant.name == null || _elephant.name == "") {
      _isNameNull = true;
    }
    if (!_isNameNull) {
      return Text(_elephant.name);
    } else {
      return Text("No Name");
    }
  }

  CircleAvatar _buildListTileCircleImage(var _elephant) {
    return CircleAvatar(
      backgroundImage: NetworkImage(_elephant.image),
    );
  }

  Row _buildListTileSubtitle(var _elephant) {
    return Row(
      children: [
        _buildDateText(_elephant),
        _buildSpace(),
        _buildSex(_elephant),
        _buildSpace(),
        _buildSpecies(_elephant),
      ],
    );
  }

  Text _buildSpace() {
    return Text("  |  ");
  }

  Text _buildDateText(var _elephant) {
    bool _isLive = false;
    if (_elephant.dod == "-" || _elephant.dod == "") {
      _isLive = true;
    }
    if (_isLive) {
      return Text("${_elephant.dob}-Alive");
    } else {
      return Text("${_elephant.dob}-${_elephant.dod}");
    }
  }

  Text _buildSex(Elephant _elephant) {
    return Text(_elephant.sex);
  }

  Text _buildSpecies(Elephant _elephant) {
    return Text(_elephant.species);
  }
}
