import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobigic_application/widget_utils.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _mText = TextEditingController();
  final TextEditingController _nText = TextEditingController();
  final TextEditingController _searchText = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  int m = 0;
  int n = 0;
  int x = 0;
  int y = 0;
  bool _isFind = false;
  bool _isBuild = false;
  List<List<String>> grid =
      List.generate(0, (i) => List.generate(0, (j) => ''));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text('Rohan Thakur Assignment')),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      UtilsWidgets.textFormField(
                        'Enter Rows',
                        'Eg. 1',
                        inputFormatter: [
                          FilteringTextInputFormatter.allow(RegExp('[1-9]')),
                        ],
                        textInputType: TextInputType.phone,
                        (p0) {
                          if (p0 == null || p0.isEmpty)
                            return 'Please Enter Rows';
                        },
                        onChanged: (p0) {
                          if (p0.isNotEmpty) {
                            setState(() {
                              m = int.parse(_mText.text);
                            });
                          }
                        },
                        _mText,
                      ),
                      UtilsWidgets.textFormField(
                        'Enter Columns',
                        'Eg. 1',
                        inputFormatter: [
                          FilteringTextInputFormatter.allow(RegExp('[1-9]')),
                        ],
                        textInputType: TextInputType.phone,
                        (p0) {
                          if (p0 == null || p0.isEmpty)
                            return 'Please Enter Columns';
                        },
                        _nText,
                        onChanged: (p0) {
                          if (p0.isNotEmpty) {
                            setState(() {
                              n = int.parse(_nText.text);
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UtilsWidgets.buildRoundBtn('Generate Grid', () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                grid = List.generate(
                                    m, (i) => List.generate(n, (j) => ''));
                                _isBuild = true;
                              });
                            }
                          }),
                          const SizedBox(width: 10),
                          UtilsWidgets.buildRoundBtn('Reset Grid', () {
                            resetGrid(m, n);
                          }),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  )),
              _isBuild
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          for (int i = 0; i < m; i++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int j = 0; j < n; j++)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      color: (x == i && y == j) && _isFind
                                          ? Colors.green
                                          : Colors.red,
                                      width: 50,
                                      height: 50,
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[a-z]')),
                                        ],
                                        onChanged: (text) {
                                          grid[i][j] = text;
                                        },
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                        ],
                      ),
                    )
                  : Container(),
              _isBuild
                  ? Column(
                      children: [
                        const SizedBox(height: 10),
                        UtilsWidgets.textFormField(
                          'Search',
                          'Eg. abc',
                          textInputType: TextInputType.text,
                          (p0) {
                            if (p0 == null || p0.isEmpty)
                              return 'Please Search';
                          },
                          _searchText,
                        ),
                        UtilsWidgets.buildRoundBtn('Search', () {
                          setState(() {
                            _isFind = findGrid();
                          });
                        }),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  resetGrid(int rows, int columns) {
    setState(() {
      m = rows;
      n = columns;
      _isFind = false;
      _isBuild = false;
      _searchText.clear();
      grid = List.generate(m, (i) => List.generate(n, (j) => ''));
    });
  }

  findGrid() {
    for (int i = 0; i < grid.length; i++) {
      int index = grid[i].indexOf(_searchText.text);
      if (index != -1) {
        setState(() {
          x = i;
          y = index;
        });
        return true;
      }
    }
    return false;
  }
}
