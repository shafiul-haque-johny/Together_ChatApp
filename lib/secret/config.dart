// Create Firebase app, add to web, then copy those api (key, domain, projectId, bucket, msgSenderId, appId.

class Configurations {
  static const _apiKey = "AIzaSyDRDTgPyKYq7ripFTpSNWrNs1my051EBoo";
  static const _authDomain = "together-45f70.firebaseapp.com";
  static const _projectId = "together-45f70";
  static const _storageBucket = "together-45f70.appspot.com";
  static const _messagingSenderId = "346024035717";
  static const _appId = "1:346024035717:web:e2c6680ba769c2e60ef0ec";

//Make some getter functions
  String get apiKey => _apiKey;
  String get authDomain => _authDomain;
  String get projectId => _projectId;
  String get storageBucket => _storageBucket;
  String get messagingSenderId => _messagingSenderId;
  String get appId => _appId;
}
