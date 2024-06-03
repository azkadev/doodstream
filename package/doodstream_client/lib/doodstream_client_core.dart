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
// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, empty_catches

import "dart:async";
import "dart:convert";
import "dart:io";
import "package:doodstream_client/utils/utils.dart";
import "package:general_lib/general_lib.dart";

import "package:http/http.dart";

/// DoodstreamClient
///
/// OFFICIAL DOCS: https://doodstream.com/api-docs
///
/// GET API KEY DOODSTREAM: https://doodstream.com/settings
///
class DoodstreamClient {
  Client http_client = Client();
  String api_key;

  /// DoodstreamClient
  ///
  /// OFFICIAL DOCS: https://doodstream.com/api-docs
  ///
  /// GET API KEY DOODSTREAM: https://doodstream.com/settings
  ///
  ///
  DoodstreamClient({
    required this.api_key,
    Client? httpClient,
  }) {
    if (httpClient != null) {
      http_client = httpClient;
    }
  }

  /// Api Url: https://doodapi.com
  Uri get api_url {
    return Uri.parse("https://doodapi.com");
  }

  /// Invoke_raw
  FutureOr<Map> _invokeRaw({
    required Map? parameters,
    required String uriPath,
    String? apiKey,
    required Map<String, dynamic>? uriQueryParameters,
    required Map? headersParameters,
    required List<int>? statusCodes,
    required String? keyResultList,
    required String method_request,
    required String specialTypeName,
  }) async {
    statusCodes ??= [];
    keyResultList ??= "${specialTypeName}s";
    headersParameters ??= {};
    apiKey ??= api_key;

    uriQueryParameters ??= {};
    uriQueryParameters.addAll({"key": apiKey});
    uriQueryParameters.removeWhere(
        (key, value) => (value == null || (value is String && value.isEmpty)));
    Uri uri = api_url.replace(
      path: "/api/${uriPath}",
      queryParameters: uriQueryParameters,
    );
    Map<String, String> headers = {
      "Accept": "application/json",
    };

    headersParameters.forEach((key, value) {
      if (key is String && value is String) {
        headers[key] = value;
      }
    });

    Response response = await Future(() async {
      if (method_request == "post") {
        return await http_client.post(uri,
            headers: headers, body: json.encode(parameters));
      }
      if (method_request == "delete") {
        return await http_client.delete(uri,
            headers: headers, body: json.encode(parameters));
      }
      if (method_request == "put") {
        return await http_client.put(uri,
            headers: headers, body: json.encode(parameters));
      }
      if (method_request == "patch") {
        return await http_client.patch(uri,
            headers: headers, body: json.encode(parameters));
      }
      return await http_client.get(
        uri,
        headers: headers,
      );
    });

    Map jsonData = {};

    dynamic jsonResultRaw_raw = () {
      try {
        return json.decode(response.body);
      } catch (e) {}
      return {};
    }();
    int status_code = () {
      if (jsonResultRaw_raw["status"] is int) {
        return jsonResultRaw_raw["status"];
      }

      return response.statusCode;
    }();
    dynamic jsonResultRaw = () {
      return jsonResultRaw_raw["result"];
    }();
    if (statusCodes.contains(status_code)) {
      if (jsonResultRaw is List) {
        jsonData["@type"] = "${specialTypeName}s";
      } else {
        jsonData["@type"] = specialTypeName;
      }
    } else {
      jsonData["@type"] = "error";
    }
    jsonData["@status_code"] = response.statusCode;

    if (jsonResultRaw is Map) {
      jsonData.addAll(jsonResultRaw);
    } else if (jsonResultRaw is List) {
      jsonData["total_count"] = jsonResultRaw.length;
      jsonData[keyResultList.snakeCaseClass()] =
          (jsonResultRaw.whereType<Map>().map((e) {
        Map json_data = {};
        json_data["@type"] = specialTypeName;
        json_data.addAll(e);
        json_data.removeWhere((key, value) => value == null);
        return json_data;
      })).toList();
    }
    jsonData.removeWhere((key, value) => value == null);
    return jsonData;
  }

  /// call api with latest features
  /// DOCS: https://doodstream.com/api-docs#
  FutureOr<Map> invoke({
    required String uriPath,
    Map<String, dynamic>? uriQueryParameters,
    Map? parameters,
    Map? headersParameters,
    String? apiKey,
    List<int>? statusCodes,
    String? keyResultList,
    String method_request = "get",
    String specialTypeName = "ok",
  }) async {
    int try_count = 0;
    while (true) {
      await Future.delayed(Duration(microseconds: 1));

      try {
        return await _invokeRaw(
          uriPath: uriPath,
          uriQueryParameters: uriQueryParameters,
          parameters: parameters,
          headersParameters: headersParameters,
          apiKey: apiKey,
          statusCodes: statusCodes,
          method_request: method_request,
          specialTypeName: specialTypeName,
          keyResultList: keyResultList,
        );
      } catch (e) {
        if (try_count >= 3) {
          rethrow;
        }
        try_count++;
        if (e is ClientException) {
          continue;
        } else {
          rethrow;
        }
      }
    }
  }

  // https://doodstream.com/api-docs#account

  /// get currrent accounts: https://doodstream.com/api-docs#account
  Future<Map> getMe({
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "account/info",
      apiKey: apiKey,
      statusCodes: [200],
      specialTypeName: "account",
    );
    return result;
  }

  /// get currrent accounts: https://doodstream.com/api-docs#account-reports
  Future<Map> getAccountReports({
    String? last,
    String? from_date,
    String? to_date,
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "account/stats",
      apiKey: apiKey,
      uriQueryParameters: {
        "last": last,
        "from_date": from_date,
        "to_date": to_date,
      },
      statusCodes: [200],
      specialTypeName: "accountStats",
    );

    return result;
  }

  /// get currrent accounts: https://doodstream.com/api-docs#account-dmca
  Future<Map> getDmcaList({
    String? page,
    String? per_page,
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "dmca/list",
      apiKey: apiKey,
      uriQueryParameters: {
        "page": page,
        "per_page": per_page,
      },
      statusCodes: [200],
      specialTypeName: "dmca",
    );

    return result;
  }
// https://doodstream.com/api-docs#account
//
//

  // upload api

  /// get currrent accounts: https://doodstream.com/api-docs#files-copy
  Future<Map> uploadFileFromLocal({
    required File file,
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "upload/server",
      apiKey: apiKey,
      statusCodes: [200],
      specialTypeName: "uploadRemoteUrl",
    );
// {
//   "msg": "OK",
//   "server_time": "2017-08-11 04:30:07",
//   "status": 200,
//   "result": "https://xxx.dood.video/upload/01"
// }
//
// curl -X POST -F 'api_key={your_api_key}' -F 'file=@file.mp4' https://xxx.dood.video/upload/01?{your_api_key}

    return result;
  }

  /// get currrent accounts: https://doodstream.com/api-docs#files-copy
  Future<Map> copyOrCloneFile({
    required String file_code,
    String? folder_id,
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "file/clone",
      apiKey: apiKey,
      uriQueryParameters: {
        "file_code": DoodstreamUtils.parseToFileId(data: file_code),
        "fld_id": folder_id,
      },
      statusCodes: [200],
      specialTypeName: "dmca",
    );

    return result;
  }

//  upload complete
//
//

  /// get currrent accounts: https://doodstream.com/api-docs#files-copy
  Future<Map> uploadFileFromRemote({
    required String url,
    String? folder_id,
    String? new_title,
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "upload/url",
      apiKey: apiKey,
      uriQueryParameters: {
        "url": url,
        "fld_id": folder_id,
        "new_title": new_title,
      },
      statusCodes: [200],
      specialTypeName: "uploadRemoteUrl",
    );

    return result;
  }

  /// get currrent accounts: https://doodstream.com/api-docs#files-copy
  Future<Map> getRemoteUploads({
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "urlupload/list",
      apiKey: apiKey,
      statusCodes: [200],
      specialTypeName: "uploadRemoteUrl",
    );

    return result;
  }

  /// get currrent accounts: https://doodstream.com/api-docs#files-copy
  Future<Map> getRemoteUploadStatus({
    required String file_code,
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "urlupload/status",
      uriQueryParameters: {
        "file_code": DoodstreamUtils.parseToFileId(data: file_code),
      },
      apiKey: apiKey,
      statusCodes: [200],
      specialTypeName: "uploadRemoteUrl",
    );

    return result;
  }

  /// get currrent accounts: https://doodstream.com/api-docs#files-copy
  Future<Map> getRemoteUploadSlots({
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "urlupload/slots",
      apiKey: apiKey,
      statusCodes: [200],
      specialTypeName: "uploadRemoteUrl",
    );

    return result;
  }

  /// get currrent accounts: https://doodstream.com/api-docs#files-copy
  Future<Map> sendRemoteUploadActions({
    dynamic restart_errors,
    dynamic clear_errors,
    dynamic clear_all,
    dynamic delete_code,
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "urlupload/actions",
      uriQueryParameters: {
        "restart_errors": restart_errors,
        "clear_errors": clear_errors,
        "clear_all": clear_all,
        "delete_code": delete_code,
      },
      apiKey: apiKey,
      statusCodes: [200],
      specialTypeName: "uploadRemoteUrl",
    );

    return result;
  }

  /// get currrent accounts: https://doodstream.com/api-docs#files-copy
  Future<Map> createFolder({
    String? name,
    String? parent_id,
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "folder/create",
      uriQueryParameters: {
        "name": name,
        "parent_id": parent_id,
      },
      apiKey: apiKey,
      statusCodes: [200],
      specialTypeName: "uploadRemoteUrl",
    );

    return result;
  }

  /// get currrent accounts: https://doodstream.com/api-docs#files-copy
  Future<Map> setNameFolder({
    String? name,
    String? folder_id,
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "folder/rename",
      uriQueryParameters: {
        "name": name,
        "fld_id": folder_id,
      },
      apiKey: apiKey,
      statusCodes: [200],
      specialTypeName: "uploadRemoteUrl",
    );

    return result;
  }

  /// get currrent accounts: https://doodstream.com/api-docs#files-copy
  Future<Map> getListFolderAndFiles({
    String? folder_id,
    bool? only_folders,
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "folder/list",
      uriQueryParameters: {
        "fld_id": folder_id,
        "only_folders": (only_folders == true) ? "1" : "0",
      },
      apiKey: apiKey,
      statusCodes: [200],
      specialTypeName: "uploadRemoteUrl",
    );

    return result;
  }
  // manage folder and done

  /// get currrent accounts: https://doodstream.com/api-docs#files-copy
  Future<Map> getListFiles({
    int page = 0,
    int per_page = 200,
    String? folder_id,
    String? created,
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "file/list",
      uriQueryParameters: {
        "page": "${page}",
        "per_page": "${per_page}",
        "fld_id": folder_id,
        "created": created,
      },
      apiKey: apiKey,
      statusCodes: [200],
      specialTypeName: "uploadRemoteUrl",
    );

    return result;
  }

  /// get currrent accounts: https://doodstream.com/api-docs#files-copy
  Future<Map> getFileStatus({
    required String file_code,
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "file/check",
      uriQueryParameters: {
        "file_code": DoodstreamUtils.parseToFileId(data: file_code),
      },
      apiKey: apiKey,
      statusCodes: [200],
      specialTypeName: "uploadRemoteUrl",
    );

    return result;
  }

  /// get currrent accounts: https://doodstream.com/api-docs#files-copy
  Future<Map> getFileInfo({
    required String file_code,
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "file/info",
      uriQueryParameters: {
        "file_code": DoodstreamUtils.parseToFileId(data: file_code),
      },
      apiKey: apiKey,
      statusCodes: [200],
      specialTypeName: "uploadRemoteUrl",
    );

    return result;
  }

  /// get currrent accounts: https://doodstream.com/api-docs#files-copy
  Future<Map> getFileThumbnail({
    required String file_code,
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "file/image",
      uriQueryParameters: {
        "file_code": DoodstreamUtils.parseToFileId(data: file_code),
      },
      apiKey: apiKey,
      statusCodes: [200],
      specialTypeName: "uploadRemoteUrl",
    );

    return result;
  }

  /// get currrent accounts: https://doodstream.com/api-docs#files-copy
  Future<Map> setNameFile({
    required String file_code,
    required String title,
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "file/rename",
      uriQueryParameters: {
        "file_code": DoodstreamUtils.parseToFileId(data: file_code),
        "title": title,
      },
      apiKey: apiKey,
      statusCodes: [200],
      specialTypeName: "uploadRemoteUrl",
    );

    return result;
  }

  /// get currrent accounts: https://doodstream.com/api-docs#files-copy
  Future<Map> moveFile({
    required String file_code,
    required String to_folder_id,
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "file/move",
      uriQueryParameters: {
        "file_code": DoodstreamUtils.parseToFileId(data: file_code),
        "fld_id": to_folder_id,
      },
      apiKey: apiKey,
      statusCodes: [200],
      specialTypeName: "uploadRemoteUrl",
    );

    return result;
  }

  /// get currrent accounts: https://doodstream.com/api-docs#files-copy
  Future<Map> searchFile({
    required String search_term,
    String? apiKey,
  }) async {
    Map result = await invoke(
      uriPath: "search/videos",
      uriQueryParameters: {
        "search_term": search_term,
      },
      apiKey: apiKey,
      statusCodes: [200],
      specialTypeName: "uploadRemoteUrl",
    );

    return result;
  }
}
