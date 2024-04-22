import 'package:cbor/cbor.dart';
import 'package:codec_utils/src/codecs/cbor/cbor_special_tag.dart';
import 'package:codec_utils/src/codecs/cbor/crypto/cbor_crypto_keypath.dart';
import 'package:codec_utils/src/codecs/cbor/crypto/metadata/cbor_path_component.dart';
import 'package:test/test.dart';

void main() {
  group('Tests of CborCryptoKeypath.fromCborMap()', () {
    test('Should [return CborCryptoKeypath] from CborMap (WITH tag)', () {
      // Arrange
      CborMap actualCborMap = CborMap(
        <CborSmallInt, CborValue>{
          const CborSmallInt(1): CborList(<CborValue>[
            const CborSmallInt(44),
            const CborBool(true),
            const CborSmallInt(60),
            const CborBool(true),
            const CborSmallInt(0),
            const CborBool(true),
            const CborSmallInt(0),
            const CborBool(false),
            const CborSmallInt(0),
            const CborBool(false),
          ]),
          const CborSmallInt(2): CborInt(BigInt.from(2539474417)),
        },
        tags: <int>[CborSpecialTag.cryptoKeypath.tag],
      );

      // Act
      CborCryptoKeypath actualCborCryptoKeypath = CborCryptoKeypath.fromCborMap(actualCborMap);

      // Assert
      CborCryptoKeypath expectedCborCryptoKeypath = const CborCryptoKeypath(
        components: <CborPathComponent>[
          CborPathComponent(index: 44, hardened: true),
          CborPathComponent(index: 60, hardened: true),
          CborPathComponent(index: 0, hardened: true),
          CborPathComponent(index: 0, hardened: false),
          CborPathComponent(index: 0, hardened: false)
        ],
        sourceFingerprint: 2539474417,
      );

      expect(actualCborCryptoKeypath, expectedCborCryptoKeypath);
    });

    test('Should [return CborCryptoKeypath] from CborMap (WITHOUT tag)', () {
      // Arrange
      CborMap actualCborMap = CborMap(
        <CborSmallInt, CborValue>{
          const CborSmallInt(1): CborList(<CborValue>[
            const CborSmallInt(44),
            const CborBool(true),
            const CborSmallInt(60),
            const CborBool(true),
            const CborSmallInt(0),
            const CborBool(true),
            const CborSmallInt(0),
            const CborBool(false),
            const CborSmallInt(0),
            const CborBool(false),
          ]),
          const CborSmallInt(2): CborInt(BigInt.from(2539474417)),
        },
        tags: <int>[],
      );

      // Act
      CborCryptoKeypath actualCborCryptoKeypath = CborCryptoKeypath.fromCborMap(actualCborMap);

      // Assert
      CborCryptoKeypath expectedCborCryptoKeypath = const CborCryptoKeypath(
        components: <CborPathComponent>[
          CborPathComponent(index: 44, hardened: true),
          CborPathComponent(index: 60, hardened: true),
          CborPathComponent(index: 0, hardened: true),
          CborPathComponent(index: 0, hardened: false),
          CborPathComponent(index: 0, hardened: false)
        ],
        sourceFingerprint: 2539474417,
      );

      expect(actualCborCryptoKeypath, expectedCborCryptoKeypath);
    });
  });

  group('Tests of CborCryptoKeypath.toCborMap()', () {
    test('Should [return CborMap] from CborCryptoKeypath (WITH tag)', () {
      // Arrange
      CborCryptoKeypath actualCborCryptoKeypath = const CborCryptoKeypath(
        components: <CborPathComponent>[
          CborPathComponent(index: 44, hardened: true),
          CborPathComponent(index: 60, hardened: true),
          CborPathComponent(index: 0, hardened: true),
          CborPathComponent(index: 0, hardened: false),
          CborPathComponent(index: 0, hardened: false)
        ],
        sourceFingerprint: 2539474417,
      );

      // Act
      CborMap actualCborMap = actualCborCryptoKeypath.toCborMap(includeTagBool: true);

      // Assert
      CborMap expectedCborMap = CborMap(
        <CborSmallInt, CborValue>{
          const CborSmallInt(1): CborList(<CborValue>[
            const CborSmallInt(44),
            const CborBool(true),
            const CborSmallInt(60),
            const CborBool(true),
            const CborSmallInt(0),
            const CborBool(true),
            const CborSmallInt(0),
            const CborBool(false),
            const CborSmallInt(0),
            const CborBool(false),
          ]),
          const CborSmallInt(2): CborInt(BigInt.from(2539474417)),
        },
        tags: <int>[CborSpecialTag.cryptoKeypath.tag],
      );

      expect(actualCborMap, expectedCborMap);
    });

    test('Should [return CborMap] from CborCryptoKeypath (WITHOUT tag)', () {
      // Arrange
      CborCryptoKeypath actualCborCryptoKeypath = const CborCryptoKeypath(
        components: <CborPathComponent>[
          CborPathComponent(index: 44, hardened: true),
          CborPathComponent(index: 60, hardened: true),
          CborPathComponent(index: 0, hardened: true),
          CborPathComponent(index: 0, hardened: false),
          CborPathComponent(index: 0, hardened: false)
        ],
        sourceFingerprint: 2539474417,
      );

      // Act
      CborMap actualCborMap = actualCborCryptoKeypath.toCborMap(includeTagBool: false);

      // Assert
      CborMap expectedCborMap = CborMap(
        <CborSmallInt, CborValue>{
          const CborSmallInt(1): CborList(<CborValue>[
            const CborSmallInt(44),
            const CborBool(true),
            const CborSmallInt(60),
            const CborBool(true),
            const CborSmallInt(0),
            const CborBool(true),
            const CborSmallInt(0),
            const CborBool(false),
            const CborSmallInt(0),
            const CborBool(false),
          ]),
          const CborSmallInt(2): CborInt(BigInt.from(2539474417)),
        },
        tags: <int>[],
      );

      expect(actualCborMap, expectedCborMap);
    });
  });

  group('Tests of CborCryptoKeypath.getCborSpecialTag()', () {
    test('Should [return CborSpecialTag.cryptoHDKey] from CborCryptoHDKey', () {
      // Arrange
      CborCryptoKeypath actualCborCryptoKeypath = const CborCryptoKeypath(
        components: <CborPathComponent>[
          CborPathComponent(index: 44, hardened: true),
          CborPathComponent(index: 60, hardened: true),
          CborPathComponent(index: 0, hardened: true),
          CborPathComponent(index: 0, hardened: false),
          CborPathComponent(index: 0, hardened: false)
        ],
        sourceFingerprint: 2539474417,
      );

      // Act
      CborSpecialTag actualCborSpecialTag = actualCborCryptoKeypath.getCborSpecialTag();

      // Assert
      CborSpecialTag expectedCborSpecialTag = CborSpecialTag.cryptoKeypath;

      expect(actualCborSpecialTag, expectedCborSpecialTag);
    });
  });
}
