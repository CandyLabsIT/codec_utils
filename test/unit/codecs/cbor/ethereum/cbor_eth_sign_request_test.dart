import 'dart:convert';

import 'package:cbor/cbor.dart';
import 'package:codec_utils/src/codecs/cbor/cbor_special_tag.dart';
import 'package:codec_utils/src/codecs/cbor/crypto/cbor_crypto_keypath.dart';
import 'package:codec_utils/src/codecs/cbor/crypto/metadata/cbor_path_component.dart';
import 'package:codec_utils/src/codecs/cbor/ethereum/cbor_eth_sign_request.dart';
import 'package:codec_utils/src/codecs/cbor/ethereum/metadata/cbor_eth_sign_data_type.dart';
import 'package:codec_utils/src/codecs/hex/hex_codec.dart';
import 'package:test/test.dart';

void main() {
  group('Tests of CborEthSignRequest.fromCborMap()', () {
    test('Should [return CborEthSignRequest] from CborMap (WITH tag)', () {
      // Arrange
      CborMap actualCborMap = CborMap(
        <CborSmallInt, CborValue>{
          const CborSmallInt(1): CborBytes(base64Decode('Uf2uvaSQROyLDEU2is7lvw=='), tags: <int>[CborSpecialTag.uuid.tag]),
          const CborSmallInt(2): CborBytes(base64Decode(
            'V2VsY29tZSB0byBPcGVuU2VhIQoKQ2xpY2sgdG8gc2lnbiBpbiBhbmQgYWNjZXB0IHRoZSBPcGVuU2VhIFRlcm1zIG9mIFNlcnZpY2UgKGh0dHBzOi8vb3BlbnNlYS5pby90b3MpIGFuZCBQcml2YWN5IFBvbGljeSAoaHR0cHM6Ly9vcGVuc2VhLmlvL3ByaXZhY3kpLgoKVGhpcyByZXF1ZXN0IHdpbGwgbm90IHRyaWdnZXIgYSBibG9ja2NoYWluIHRyYW5zYWN0aW9uIG9yIGNvc3QgYW55IGdhcyBmZWVzLgoKV2FsbGV0IGFkZHJlc3M6CjB4NTNiZjBhMTg3NTQ4NzNhODEwMjYyNWQ4MjI1YWY2YTE1YTQzNDIzYwoKTm9uY2U6CjFkOGQyZGMxLTBiN2MtNDc2Mi1hNTIwLWE0ODVhZTI2MTcxOQ==',
          )),
          const CborSmallInt(3): const CborSmallInt(3),
          const CborSmallInt(5): CborMap(
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
              const CborSmallInt(2): CborInt(BigInt.from(1881575369)),
            },
            tags: <int>[CborSpecialTag.cryptoKeypath.tag],
          ),
          const CborSmallInt(6): CborBytes(HexCodec.decode('0x53bf0a18754873a8102625d8225af6a15a43423c')),
        },
        tags: <int>[CborSpecialTag.ethSignRequest.tag],
      );

      // Act
      CborEthSignRequest actualCborEthSignRequest = CborEthSignRequest.fromCborMap(actualCborMap);

      // Assert
      CborEthSignRequest expectedCborEthSignRequest = CborEthSignRequest(
        requestId: base64Decode('Uf2uvaSQROyLDEU2is7lvw=='),
        signData: base64Decode(
          'V2VsY29tZSB0byBPcGVuU2VhIQoKQ2xpY2sgdG8gc2lnbiBpbiBhbmQgYWNjZXB0IHRoZSBPcGVuU2VhIFRlcm1zIG9mIFNlcnZpY2UgKGh0dHBzOi8vb3BlbnNlYS5pby90b3MpIGFuZCBQcml2YWN5IFBvbGljeSAoaHR0cHM6Ly9vcGVuc2VhLmlvL3ByaXZhY3kpLgoKVGhpcyByZXF1ZXN0IHdpbGwgbm90IHRyaWdnZXIgYSBibG9ja2NoYWluIHRyYW5zYWN0aW9uIG9yIGNvc3QgYW55IGdhcyBmZWVzLgoKV2FsbGV0IGFkZHJlc3M6CjB4NTNiZjBhMTg3NTQ4NzNhODEwMjYyNWQ4MjI1YWY2YTE1YTQzNDIzYwoKTm9uY2U6CjFkOGQyZGMxLTBiN2MtNDc2Mi1hNTIwLWE0ODVhZTI2MTcxOQ==',
        ),
        dataType: CborEthSignDataType.rawBytes,
        derivationPath: const CborCryptoKeypath(
          components: <CborPathComponent>[
            CborPathComponent(index: 44, hardened: true),
            CborPathComponent(index: 60, hardened: true),
            CborPathComponent(index: 0, hardened: true),
            CborPathComponent(index: 0, hardened: false),
            CborPathComponent(index: 0, hardened: false)
          ],
          sourceFingerprint: 1881575369,
        ),
        address: '0x53bf0a18754873a8102625d8225af6a15a43423c',
      );

      expect(actualCborEthSignRequest, expectedCborEthSignRequest);
    });

    test('Should [return CborEthSignRequest] from CborMap (WITHOUT tag)', () {
      // Arrange
      CborMap actualCborMap = CborMap(
        <CborSmallInt, CborValue>{
          const CborSmallInt(1): CborBytes(base64Decode('Uf2uvaSQROyLDEU2is7lvw=='), tags: <int>[CborSpecialTag.uuid.tag]),
          const CborSmallInt(2): CborBytes(base64Decode(
            'V2VsY29tZSB0byBPcGVuU2VhIQoKQ2xpY2sgdG8gc2lnbiBpbiBhbmQgYWNjZXB0IHRoZSBPcGVuU2VhIFRlcm1zIG9mIFNlcnZpY2UgKGh0dHBzOi8vb3BlbnNlYS5pby90b3MpIGFuZCBQcml2YWN5IFBvbGljeSAoaHR0cHM6Ly9vcGVuc2VhLmlvL3ByaXZhY3kpLgoKVGhpcyByZXF1ZXN0IHdpbGwgbm90IHRyaWdnZXIgYSBibG9ja2NoYWluIHRyYW5zYWN0aW9uIG9yIGNvc3QgYW55IGdhcyBmZWVzLgoKV2FsbGV0IGFkZHJlc3M6CjB4NTNiZjBhMTg3NTQ4NzNhODEwMjYyNWQ4MjI1YWY2YTE1YTQzNDIzYwoKTm9uY2U6CjFkOGQyZGMxLTBiN2MtNDc2Mi1hNTIwLWE0ODVhZTI2MTcxOQ==',
          )),
          const CborSmallInt(3): const CborSmallInt(3),
          const CborSmallInt(5): CborMap(
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
              const CborSmallInt(2): CborInt(BigInt.from(1881575369)),
            },
          ),
          const CborSmallInt(6): CborBytes(HexCodec.decode('0x53bf0a18754873a8102625d8225af6a15a43423c')),
        },
        tags: <int>[],
      );

      // Act
      CborEthSignRequest actualCborEthSignRequest = CborEthSignRequest.fromCborMap(actualCborMap);

      // Assert
      CborEthSignRequest expectedCborEthSignRequest = CborEthSignRequest(
        requestId: base64Decode('Uf2uvaSQROyLDEU2is7lvw=='),
        signData: base64Decode(
          'V2VsY29tZSB0byBPcGVuU2VhIQoKQ2xpY2sgdG8gc2lnbiBpbiBhbmQgYWNjZXB0IHRoZSBPcGVuU2VhIFRlcm1zIG9mIFNlcnZpY2UgKGh0dHBzOi8vb3BlbnNlYS5pby90b3MpIGFuZCBQcml2YWN5IFBvbGljeSAoaHR0cHM6Ly9vcGVuc2VhLmlvL3ByaXZhY3kpLgoKVGhpcyByZXF1ZXN0IHdpbGwgbm90IHRyaWdnZXIgYSBibG9ja2NoYWluIHRyYW5zYWN0aW9uIG9yIGNvc3QgYW55IGdhcyBmZWVzLgoKV2FsbGV0IGFkZHJlc3M6CjB4NTNiZjBhMTg3NTQ4NzNhODEwMjYyNWQ4MjI1YWY2YTE1YTQzNDIzYwoKTm9uY2U6CjFkOGQyZGMxLTBiN2MtNDc2Mi1hNTIwLWE0ODVhZTI2MTcxOQ==',
        ),
        dataType: CborEthSignDataType.rawBytes,
        derivationPath: const CborCryptoKeypath(
          components: <CborPathComponent>[
            CborPathComponent(index: 44, hardened: true),
            CborPathComponent(index: 60, hardened: true),
            CborPathComponent(index: 0, hardened: true),
            CborPathComponent(index: 0, hardened: false),
            CborPathComponent(index: 0, hardened: false)
          ],
          sourceFingerprint: 1881575369,
        ),
        address: '0x53bf0a18754873a8102625d8225af6a15a43423c',
      );

      expect(actualCborEthSignRequest, expectedCborEthSignRequest);
    });
  });

  group('Tests of CborEthSignRequest.toCborMap()', () {
    test('Should [return CborMap] from CborEthSignRequest (WITH tag)', () {
      // Arrange
      CborEthSignRequest actualCborEthSignRequest = CborEthSignRequest(
        requestId: base64Decode('Uf2uvaSQROyLDEU2is7lvw=='),
        signData: base64Decode(
          'V2VsY29tZSB0byBPcGVuU2VhIQoKQ2xpY2sgdG8gc2lnbiBpbiBhbmQgYWNjZXB0IHRoZSBPcGVuU2VhIFRlcm1zIG9mIFNlcnZpY2UgKGh0dHBzOi8vb3BlbnNlYS5pby90b3MpIGFuZCBQcml2YWN5IFBvbGljeSAoaHR0cHM6Ly9vcGVuc2VhLmlvL3ByaXZhY3kpLgoKVGhpcyByZXF1ZXN0IHdpbGwgbm90IHRyaWdnZXIgYSBibG9ja2NoYWluIHRyYW5zYWN0aW9uIG9yIGNvc3QgYW55IGdhcyBmZWVzLgoKV2FsbGV0IGFkZHJlc3M6CjB4NTNiZjBhMTg3NTQ4NzNhODEwMjYyNWQ4MjI1YWY2YTE1YTQzNDIzYwoKTm9uY2U6CjFkOGQyZGMxLTBiN2MtNDc2Mi1hNTIwLWE0ODVhZTI2MTcxOQ==',
        ),
        dataType: CborEthSignDataType.rawBytes,
        derivationPath: const CborCryptoKeypath(
          components: <CborPathComponent>[
            CborPathComponent(index: 44, hardened: true),
            CborPathComponent(index: 60, hardened: true),
            CborPathComponent(index: 0, hardened: true),
            CborPathComponent(index: 0, hardened: false),
            CborPathComponent(index: 0, hardened: false)
          ],
          sourceFingerprint: 1881575369,
        ),
        address: '0x53bf0a18754873a8102625d8225af6a15a43423c',
      );

      // Act
      CborMap actualCborMap = actualCborEthSignRequest.toCborMap(includeTagBool: true);

      // Assert
      CborMap expectedCborMap = CborMap(
        <CborSmallInt, CborValue>{
          const CborSmallInt(1): CborBytes(base64Decode('Uf2uvaSQROyLDEU2is7lvw=='), tags: <int>[CborSpecialTag.uuid.tag]),
          const CborSmallInt(2): CborBytes(base64Decode(
            'V2VsY29tZSB0byBPcGVuU2VhIQoKQ2xpY2sgdG8gc2lnbiBpbiBhbmQgYWNjZXB0IHRoZSBPcGVuU2VhIFRlcm1zIG9mIFNlcnZpY2UgKGh0dHBzOi8vb3BlbnNlYS5pby90b3MpIGFuZCBQcml2YWN5IFBvbGljeSAoaHR0cHM6Ly9vcGVuc2VhLmlvL3ByaXZhY3kpLgoKVGhpcyByZXF1ZXN0IHdpbGwgbm90IHRyaWdnZXIgYSBibG9ja2NoYWluIHRyYW5zYWN0aW9uIG9yIGNvc3QgYW55IGdhcyBmZWVzLgoKV2FsbGV0IGFkZHJlc3M6CjB4NTNiZjBhMTg3NTQ4NzNhODEwMjYyNWQ4MjI1YWY2YTE1YTQzNDIzYwoKTm9uY2U6CjFkOGQyZGMxLTBiN2MtNDc2Mi1hNTIwLWE0ODVhZTI2MTcxOQ==',
          )),
          const CborSmallInt(3): const CborSmallInt(3),
          const CborSmallInt(5): CborMap(
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
              const CborSmallInt(2): CborInt(BigInt.from(1881575369)),
            },
          ),
          const CborSmallInt(6): CborBytes(HexCodec.decode('0x53bf0a18754873a8102625d8225af6a15a43423c')),
        },
        tags: <int>[CborSpecialTag.ethSignRequest.tag],
      );

      expect(actualCborMap, expectedCborMap);
    });

    test('Should [return CborMap] from CborEthSignRequest (WITHOUT tag)', () {
      // Arrange
      CborEthSignRequest actualCborEthSignRequest = CborEthSignRequest(
        requestId: base64Decode('Uf2uvaSQROyLDEU2is7lvw=='),
        signData: base64Decode(
          'V2VsY29tZSB0byBPcGVuU2VhIQoKQ2xpY2sgdG8gc2lnbiBpbiBhbmQgYWNjZXB0IHRoZSBPcGVuU2VhIFRlcm1zIG9mIFNlcnZpY2UgKGh0dHBzOi8vb3BlbnNlYS5pby90b3MpIGFuZCBQcml2YWN5IFBvbGljeSAoaHR0cHM6Ly9vcGVuc2VhLmlvL3ByaXZhY3kpLgoKVGhpcyByZXF1ZXN0IHdpbGwgbm90IHRyaWdnZXIgYSBibG9ja2NoYWluIHRyYW5zYWN0aW9uIG9yIGNvc3QgYW55IGdhcyBmZWVzLgoKV2FsbGV0IGFkZHJlc3M6CjB4NTNiZjBhMTg3NTQ4NzNhODEwMjYyNWQ4MjI1YWY2YTE1YTQzNDIzYwoKTm9uY2U6CjFkOGQyZGMxLTBiN2MtNDc2Mi1hNTIwLWE0ODVhZTI2MTcxOQ==',
        ),
        dataType: CborEthSignDataType.rawBytes,
        derivationPath: const CborCryptoKeypath(
          components: <CborPathComponent>[
            CborPathComponent(index: 44, hardened: true),
            CborPathComponent(index: 60, hardened: true),
            CborPathComponent(index: 0, hardened: true),
            CborPathComponent(index: 0, hardened: false),
            CborPathComponent(index: 0, hardened: false)
          ],
          sourceFingerprint: 1881575369,
        ),
        address: '0x53bf0a18754873a8102625d8225af6a15a43423c',
      );

      // Act
      CborMap actualCborMap = actualCborEthSignRequest.toCborMap(includeTagBool: false);

      // Assert
      CborMap expectedCborMap = CborMap(
        <CborSmallInt, CborValue>{
          const CborSmallInt(1): CborBytes(base64Decode('Uf2uvaSQROyLDEU2is7lvw=='), tags: <int>[CborSpecialTag.uuid.tag]),
          const CborSmallInt(2): CborBytes(base64Decode(
            'V2VsY29tZSB0byBPcGVuU2VhIQoKQ2xpY2sgdG8gc2lnbiBpbiBhbmQgYWNjZXB0IHRoZSBPcGVuU2VhIFRlcm1zIG9mIFNlcnZpY2UgKGh0dHBzOi8vb3BlbnNlYS5pby90b3MpIGFuZCBQcml2YWN5IFBvbGljeSAoaHR0cHM6Ly9vcGVuc2VhLmlvL3ByaXZhY3kpLgoKVGhpcyByZXF1ZXN0IHdpbGwgbm90IHRyaWdnZXIgYSBibG9ja2NoYWluIHRyYW5zYWN0aW9uIG9yIGNvc3QgYW55IGdhcyBmZWVzLgoKV2FsbGV0IGFkZHJlc3M6CjB4NTNiZjBhMTg3NTQ4NzNhODEwMjYyNWQ4MjI1YWY2YTE1YTQzNDIzYwoKTm9uY2U6CjFkOGQyZGMxLTBiN2MtNDc2Mi1hNTIwLWE0ODVhZTI2MTcxOQ==',
          )),
          const CborSmallInt(3): const CborSmallInt(3),
          const CborSmallInt(5): CborMap(
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
              const CborSmallInt(2): CborInt(BigInt.from(1881575369)),
            },
          ),
          const CborSmallInt(6): CborBytes(HexCodec.decode('0x53bf0a18754873a8102625d8225af6a15a43423c')),
        },
        tags: <int>[],
      );

      expect(actualCborMap, expectedCborMap);
    });
  });

  group('Tests of CborEthSignRequest.getCborSpecialTag()', () {
    test('Should [return CborSpecialTag.cryptoHDKey] from CborEthSignRequest', () {
      // Arrange
      CborEthSignRequest actualCborEthSignRequest = CborEthSignRequest(
        requestId: base64Decode('Uf2uvaSQROyLDEU2is7lvw=='),
        signData: base64Decode(
          'V2VsY29tZSB0byBPcGVuU2VhIQoKQ2xpY2sgdG8gc2lnbiBpbiBhbmQgYWNjZXB0IHRoZSBPcGVuU2VhIFRlcm1zIG9mIFNlcnZpY2UgKGh0dHBzOi8vb3BlbnNlYS5pby90b3MpIGFuZCBQcml2YWN5IFBvbGljeSAoaHR0cHM6Ly9vcGVuc2VhLmlvL3ByaXZhY3kpLgoKVGhpcyByZXF1ZXN0IHdpbGwgbm90IHRyaWdnZXIgYSBibG9ja2NoYWluIHRyYW5zYWN0aW9uIG9yIGNvc3QgYW55IGdhcyBmZWVzLgoKV2FsbGV0IGFkZHJlc3M6CjB4NTNiZjBhMTg3NTQ4NzNhODEwMjYyNWQ4MjI1YWY2YTE1YTQzNDIzYwoKTm9uY2U6CjFkOGQyZGMxLTBiN2MtNDc2Mi1hNTIwLWE0ODVhZTI2MTcxOQ==',
        ),
        dataType: CborEthSignDataType.rawBytes,
        derivationPath: const CborCryptoKeypath(
          components: <CborPathComponent>[
            CborPathComponent(index: 44, hardened: true),
            CborPathComponent(index: 60, hardened: true),
            CborPathComponent(index: 0, hardened: true),
            CborPathComponent(index: 0, hardened: false),
            CborPathComponent(index: 0, hardened: false)
          ],
          sourceFingerprint: 1881575369,
        ),
        address: '0x53bf0a18754873a8102625d8225af6a15a43423c',
      );

      // Act
      CborSpecialTag actualCborSpecialTag = actualCborEthSignRequest.getCborSpecialTag();

      // Assert
      CborSpecialTag expectedCborSpecialTag = CborSpecialTag.ethSignRequest;

      expect(actualCborSpecialTag, expectedCborSpecialTag);
    });
  });
}
