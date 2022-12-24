/*
 * This file is part of the Wuzei (https://github.com/sealjp/Wuzei.git or 
 * git@github.com:sealjp/Wuzei.git).
 * 
 * Copyright (C) 2022 Zhang Xi (sealnippon@gmail.com)
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import '../../../lib.dart';
import 'package:share_plus/share_plus.dart';

extension ShareAction on MeController {
  void share() {
    final String message = 'me_shareContent'
        .trParams({'name': me.value.nameStr, 'publicKey': me.value.publicKey!});
    debugPrint(message);
    Share.share(
      message,
      sharePositionOrigin: Rect.fromCenter(
          center: const Offset(100, 100), width: 100, height: 100),
    );
  }
}
