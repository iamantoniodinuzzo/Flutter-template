///Rappresenta il response di base ottenuto dalle chiamate soap.
///! Classe inutile ma lasciata per esempio
class BaseResponse {
  final SoapEnvelope? soapEnvelope;

  BaseResponse({
    this.soapEnvelope,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        soapEnvelope: json['soap:Envelope'] == null
            ? null
            : SoapEnvelope.fromJson(json['soap:Envelope']),
      );

  Map<String, dynamic> toJson() => {
        'soap:Envelope': soapEnvelope?.toJson(),
      };
}

class SoapEnvelope {
  final SoapBody? soapBody;

  SoapEnvelope({
    this.soapBody,
  });

  factory SoapEnvelope.fromJson(Map<String, dynamic> json) => SoapEnvelope(
        soapBody: json['soap:Body'] == null
            ? null
            : SoapBody.fromJson(json['soap:Body']),
      );

  Map<String, dynamic> toJson() => {
        'soap:Body': soapBody?.toJson(),
      };
}

class SoapBody {
  final SyncSessionAuthenticateResponse? syncSessionAuthenticateResponse;

  SoapBody({
    this.syncSessionAuthenticateResponse,
  });

  factory SoapBody.fromJson(Map<String, dynamic> json) => SoapBody(
        syncSessionAuthenticateResponse:
            json['SyncSession_AuthenticateResponse'] == null
                ? null
                : SyncSessionAuthenticateResponse.fromJson(
                    json['SyncSession_AuthenticateResponse'],
                  ),
      );

  Map<String, dynamic> toJson() => {
        'SyncSession_AuthenticateResponse':
            syncSessionAuthenticateResponse?.toJson(),
      };
}

class SyncSessionAuthenticateResponse {
  final String? syncSessionAuthenticateResult;
  final dynamic oErrMsg;
  final String? oHostSessionKey;
  final String? oAssignedSubConfigKey;
  final String? oCustomerCfg;
  final String? oSerialNoStatus;

  SyncSessionAuthenticateResponse({
    this.syncSessionAuthenticateResult,
    this.oErrMsg,
    this.oHostSessionKey,
    this.oAssignedSubConfigKey,
    this.oCustomerCfg,
    this.oSerialNoStatus,
  });

  factory SyncSessionAuthenticateResponse.fromJson(Map<String, dynamic> json) =>
      SyncSessionAuthenticateResponse(
        syncSessionAuthenticateResult: json['SyncSession_AuthenticateResult'],
        oErrMsg: json['oErrMsg'],
        oHostSessionKey: json['oHostSessionKey'],
        oAssignedSubConfigKey: json['oAssignedSubConfigKey'],
        oCustomerCfg: json['oCustomerCfg'],
        oSerialNoStatus: json['oSerialNoStatus'],
      );

  Map<String, dynamic> toJson() => {
        'SyncSession_AuthenticateResult': syncSessionAuthenticateResult,
        'oErrMsg': oErrMsg,
        'oHostSessionKey': oHostSessionKey,
        'oAssignedSubConfigKey': oAssignedSubConfigKey,
        'oCustomerCfg': oCustomerCfg,
        'oSerialNoStatus': oSerialNoStatus,
      };
}
