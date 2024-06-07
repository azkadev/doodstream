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

import 'package:doodstream/doodstream_core.dart';

/// List Extension functions manage
extension DoodstreamApiManageFilesExtension on Doodstream {
  /// List all files
  Future<Map> ManageFiles_ListFiles({
    int page = 0,
    int per_page = 200,
    String? folder_id,
    String? created,
    String? apiKey,
  }) async {
    return await getListFiles(
      page: page,
      per_page: per_page,
      folder_id: folder_id,
      created: created,
      apiKey: apiKey,
    );
  }

  /// Check status of your file

  Future<Map> ManageFiles_FileStatus({
    required String file_code,
    String? apiKey,
  }) async {
    return await getFileStatus(
      file_code: file_code,
      apiKey: apiKey,
    );
  }

  /// Get file info

  Future<Map> ManageFiles_FileInfo({
    required String file_code,
    String? apiKey,
  }) async {
    return await getFileInfo(
      file_code: file_code,
      apiKey: apiKey,
    );
  }

  /// Get file splash, single or thumbnail image

  Future<Map> ManageFiles_FileThumbnail({
    required String file_code,
    String? apiKey,
  }) async {
    return await getFileThumbnail(
      file_code: file_code,
      apiKey: apiKey,
    );
  }

  /// Rename your file

  Future<Map> ManageFiles_FileRename({
    required String file_code,
    required String title,
    String? apiKey,
  }) async {
    return await setNameFile(
      file_code: file_code,
      title: title,
      apiKey: apiKey,
    );
  }

  /// Move your file from one folder to another

  Future<Map> ManageFiles_FileMove({
    required String file_code,
    required String to_folder_id,
    String? apiKey,
  }) async {
    return await moveFile(
      file_code: file_code,
      to_folder_id: to_folder_id,
      apiKey: apiKey,
    );
  }

  /// Search your files

  Future<Map> ManageFiles_FileSearch({
    required String search_term,
    String? apiKey,
  }) async {
    return await searchFile(
      search_term: search_term,
      apiKey: apiKey,
    );
  }
}
