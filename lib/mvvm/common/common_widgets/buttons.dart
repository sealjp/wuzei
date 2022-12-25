/*
 * This file is part of the Wuzei (https://github.com/sealjp/wuzei.git or 
 * git@github.com:sealjp/wuzei.git).
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

class StadiumTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  final String title;
  final Style style;
  final double width;
  const StadiumTextButton(
      {Key? key,
      this.onPressed,
      this.icon,
      required this.title,
      this.style = Style.primary,
      this.width = 358})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int styleIndex = style.index;
    if (onPressed == null) styleIndex = 2;
    final Color primaryBgColor = Theme.of(context).colorScheme.primary;
    final Color secondaryBgColor = Theme.of(context).colorScheme.onPrimary;
    const Color disableBgColor = Color(0x1f1A1C1E); //12%

    final Color primaryFgColor = secondaryBgColor;
    final Color secondaryFgColor = primaryBgColor;
    const Color disableFgColor = Color(0x611A1C1E); //38%

    final List<Color> bgColors = [
      primaryBgColor,
      secondaryBgColor,
      disableBgColor
    ];
    final List<Color> borderColors = [
      primaryBgColor,
      primaryBgColor,
      disableBgColor
    ];
    final List<Color> foregroundColors = [
      primaryFgColor,
      secondaryFgColor,
      disableFgColor
    ];

    final Color bgColor = bgColors[styleIndex];
    final Color borderColor = borderColors[styleIndex];
    final Color foregroundColor = foregroundColors[styleIndex];

    return SizedBox(
      width: width.wPt,
      height: 44.hPt,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(bgColor),
            foregroundColor: MaterialStateProperty.all(foregroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    side: BorderSide(color: borderColor)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon),
            Text(title,
                style: TextStyle(
                    fontSize: width > 280.wPt ? 16 : 14,
                    fontWeight: FontWeight.w500))
          ],
        ),
        // ),
      ),
    );
  }
}
