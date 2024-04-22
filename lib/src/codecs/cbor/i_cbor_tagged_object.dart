import 'package:cbor/cbor.dart';
import 'package:codec_utils/src/codecs/cbor/cbor_special_tag.dart';
import 'package:codec_utils/src/codecs/cbor/crypto/cbor_crypto_coin_info.dart';
import 'package:codec_utils/src/codecs/cbor/crypto/cbor_crypto_hd_key.dart';
import 'package:codec_utils/src/codecs/cbor/crypto/cbor_crypto_keypath.dart';
import 'package:codec_utils/src/codecs/cbor/ethereum/cbor_eth_sign_request.dart';
import 'package:codec_utils/src/codecs/cbor/ethereum/cbor_eth_signature.dart';

abstract interface class ICborTaggedObject {
  /// The CBOR special tag for selected object.
  CborSpecialTag getCborSpecialTag();

  /// When a CBOR with a UR type is encoded as standalone CBOR or anywhere embedded
  /// in a CBOR structure, its tag MUST match the tag registered with the UR type.
  ///
  /// On the other hand, if the CBOR structure is the top-level object in a UR,
  /// then it  MUST NOT be tagged, as the UR type provides that information.
  ///
  /// https://github.com/BlockchainCommons/Research/blob/master/papers/bcr-2020-005-ur.md#ur-cbor-tags
  CborValue toCborMap({required bool includeTagBool});

  /// Converts a CBOR map to a tagged object.
  static ICborTaggedObject fromCborMap(CborSpecialTag cborSpecialTag, CborMap cborMap) {
    switch (cborSpecialTag) {
      case CborSpecialTag.cryptoCoinInfo:
        return CborCryptoCoinInfo.fromCborMap(cborMap);
      case CborSpecialTag.cryptoHDKey:
        return CborCryptoHDKey.fromCborMap(cborMap);
      case CborSpecialTag.cryptoKeypath:
        return CborCryptoKeypath.fromCborMap(cborMap);
      case CborSpecialTag.ethSignature:
        return CborEthSignature.fromCborMap(cborMap);
      case CborSpecialTag.ethSignRequest:
        return CborEthSignRequest.fromCborMap(cborMap);
      default:
        throw UnimplementedError('Unimplemented CBOR tag: ${cborSpecialTag}');
    }
  }
}
