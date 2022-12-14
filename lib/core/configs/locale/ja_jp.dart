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

const Map<String, String> ja_JP = {
  'common_add': '追加する',
  'common_cancel': 'キャンセル',
  'common_clear': 'クリア',
  'common_complete': '完了',
  'common_contacts': '連絡先',
  'common_delete': '削除',
  'common_display': '外観モード',
  'common_Medit': '編集',
  'common_language': '言語',
  'common_me': '自分',
  'common_name': '名前',
  'common_remind': '注意',
  'common_rsaPublicKey': 'RSA公開鍵',
  'common_save': 'セブ',
  'common_timeOfCreateKey': '鍵作成時間',
  'common_convert': '変換',
  'contacts_add': '連絡先を追加する',
  'contacts_edit': '連絡先編集',
  'contacts_deleteRemind': '削除OK？',
  'contacts_remove': '連絡先を削除する',
  'dark': 'ダーク',
  'light': 'ライト',
  'me_profile': '個人情報',
  'me_sendMyPublicKey': '私の公開鍵を送信する',
  'me_setName': '名前を設定する',
  'me_shareContent': 'これは私の公開鍵です。保存してください。 \n名前:@name, \n公開鍵:@publicKey',
  'me_shareDescript':
      '自分のRSA公開鍵を相手に送信し、相手は本アプリで原文を暗号化して自分に送信し、自分は復号しています。公開鍵を送信するチャネルは、通常の通信チャネルを使用しないでください。例えば,普段はWメッセージソフトウェアで情報を転送する場合は、メールやSMSで送信する必要があります。',
  'me_sytemMode': 'システム',
  'me_update': '更新する',
  'me_updateKeyPair': '鍵ペアの更新する',
  'me_updateKeyPairDescript':
      '更新鍵ペアは公開鍵と秘密鍵を同時に更新するものです。古い公開鍵を使用して暗号化された暗号文は復号できません。新しい公開鍵を送信者に送信して保存しなければなりません。',
  'convert_decodedText': '原文',
  'convert_encodedText': 'RSA暗号文',
  'convert_selectContact': '連絡先を選択する',
  'validator_notEmpty': '入力してください！',
  'validator_notRSA':'RSA公開鍵ではありません',
};
