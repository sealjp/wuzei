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

class ShareView extends StatelessWidget {
  const ShareView({super.key});

  @override
  Widget build(BuildContext context) {
    final MeController m = Get.find();
    return Scaffold(
        appBar: AppBar(title: Text('me_sendMyPublicKey'.tr)),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(16.wPt),
                child: Column(
                  children: [
                    Text('me_shareDescript'.tr),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 28.0),
                      child: StadiumTextButton(
                        title: 'me_sendMyPublicKey'.tr,
                        onPressed: m.share,
                      ),
                    )
                  ],
                ))));
  }
}
