import 'package:cbor/cbor.dart';
import 'package:codec_utils/src/codecs/cbor/cbor_special_tag.dart';
import 'package:codec_utils/src/codecs/cbor/i_cbor_tagged_object.dart';
import 'package:equatable/equatable.dart';

/// Metadata for a network details.
///
/// https://github.com/BlockchainCommons/Research/blob/master/papers/bcr-2020-007-hdkey.md#cddl-for-coin-info
class CborCryptoCoinInfo extends Equatable implements ICborTaggedObject {
  static CborSpecialTag cborSpecialTag = CborSpecialTag.cryptoCoinInfo;

  /// Coin-specific identifier for testnet or mainnet.
  /// Default is 0 for mainnet.
  final int network;

  /// Defines values values from [SLIP44](https://github.com/satoshilabs/slips/blob/master/slip-0044.md) with high bit turned off.
  final int? type;

  const CborCryptoCoinInfo({
    required this.network,
    this.type,
  });

  factory CborCryptoCoinInfo.fromCborMap(CborMap cborMap) {
    CborSmallInt? cborType = cborMap[const CborSmallInt(1)] as CborSmallInt?;
    CborSmallInt? cborNetwork = cborMap[const CborSmallInt(2)] as CborSmallInt?;

    return CborCryptoCoinInfo(
      network: cborNetwork?.value ?? 0,
      type: cborType?.value,
    );
  }

  @override
  CborMap toCborMap({required bool includeTagBool}) {
    return CborMap.of(
      <CborValue, CborValue>{
        if (type != null) const CborSmallInt(1): CborSmallInt(type!),
        if (network != 0) const CborSmallInt(2): CborSmallInt(network),
      },
      tags: includeTagBool ? <int>[cborSpecialTag.tag] : <int>[],
    );
  }

  @override
  CborSpecialTag getCborSpecialTag() => cborSpecialTag;

  @override
  List<Object?> get props => <Object?>[type, network];
}
