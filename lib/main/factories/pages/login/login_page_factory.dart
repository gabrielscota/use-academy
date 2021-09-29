import 'package:flutter/material.dart';

import '../../../../ui/pages/pages.dart';
import '../pages.dart';

Widget makeLoginPage() => LoginPage(presenter: makeGetxLoginPresenter());
