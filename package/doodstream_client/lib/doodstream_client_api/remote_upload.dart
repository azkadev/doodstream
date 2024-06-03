/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: non_constant_identifier_names

import 'package:doodstream_client/doodstream_client_core.dart';

extension DoodstreamApiRemoteUploadExtension on DoodstreamClient {
  /// Upload files using direct links
  Future<Map> RemoteUpload_AddLink({
    required String url,
    String? folder_id,
    String? new_title,
    String? apiKey,
  }) async {
    return await uploadFileFromRemote(
      url: url,
      folder_id: folder_id,
      new_title: new_title,
      apiKey: apiKey,
    );
  }

  /// Remote Upload List & Status
  Future<Map> RemoteUpload_UploadList({
    String? apiKey,
  }) async {
    return await getRemoteUploads(
      apiKey: apiKey,
    );
  }

  /// Remote Upload Status

  Future<Map> RemoteUpload_UploadStatus({
    required String file_code,
    String? apiKey,
  }) async {
    return await getRemoteUploadStatus(
      file_code: file_code,
      apiKey: apiKey,
    );
  }

  /// Get total & used remote upload slots

  Future<Map> RemoteUpload_UploadSlots({
    String? apiKey,
  }) async {
    return await getRemoteUploadSlots(
      apiKey: apiKey,
    );
  }

  /// Perform various actions on remote upload
  Future<Map> RemoteUpload_UploadActions({
    dynamic restart_errors,
    dynamic clear_errors,
    dynamic clear_all,
    dynamic delete_code,
    String? apiKey,
  }) async {
    return await sendRemoteUploadActions(
      restart_errors: restart_errors,
      clear_errors: clear_errors,
      clear_all: clear_all,
      delete_code: delete_code,
      apiKey: apiKey,
    );
  }
}
