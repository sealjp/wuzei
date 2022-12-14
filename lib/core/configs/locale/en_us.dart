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

const Map<String, String> en_US = {
  'common_add': 'Add',
  'common_cancel': 'Cancel',
  'common_clear': 'Clear',
  'common_complete': 'Complete',
  'common_contacts': 'Contacts',
  'common_delete': 'Delete',
  'common_display': 'Display',
  'common_edit': 'Edit',
  'common_language': 'Language',
  'common_me': 'Me',
  'common_name': 'Name',
  'common_mind': 'Note',
  'common_rsaPublicKey': 'RSA public key',
  'common_save': 'Save',
  'common_timeOfCreateKey': 'Key created time',
  'common_convert': 'Convert',
  'contacts_add': 'Add contact',
  'contacts_edit': 'Edit contact',
  'contacts_deleteRemind': 'Are you sure to delete?',
  'contacts_remove': 'Delete the contact',
  'dark': 'Dark',
  'light': 'Light',
  'me_profile': 'Personal information',
  'me_sendMyPublicKey': 'Send my public key',
  'me_setName': 'Set name',
  'me_shareContent':
      'This is my public key, please save it. \n Name: @name, \n Public key: @publicKey',
  'me_shareDescript':
      'Send your RSA public key to the other party, and the other party encrypts the original text with this software and sends it to you, who is decrypting it. The channel to send the public key should never use the usual communication channel. For example, if W messaging software is usually used to convert information, it should be sent by email or SMS.',
  'me_sytemMode': 'System Mode',
  'me_update': 'Update',
  'me_updateKeyPair': 'Update key pair',
  'me_updateKeyPairDescript':
      'Updating the key pair is to update both the public key and the private key. The ciphertext generated by using the old public key encryption will not be decrypted. The new public key must be sent to the sender for saving.',
  'convert_decodedText': 'Original text',
  'convert_encodedText': 'RSA ciphertext',
  'convert_selectContact': 'Select a contact',
   'validator_notEmpty': 'Must input',
  'validator_notRSA':'Not RSA public key',
};
