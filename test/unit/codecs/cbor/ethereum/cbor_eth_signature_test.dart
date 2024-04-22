import 'dart:convert';

import 'package:cbor/cbor.dart';
import 'package:codec_utils/src/codecs/cbor/cbor_special_tag.dart';
import 'package:codec_utils/src/codecs/cbor/ethereum/cbor_eth_signature.dart';
import 'package:test/test.dart';

void main() {
  group('Tests of CborEthSignRequest.fromCborMap()', () {
    test('Should [return CborEthSignRequest] from CborMap (WITH tag)', () {
      // Arrange
      CborMap actualCborMap = CborMap(
        <CborSmallInt, CborValue>{
          const CborSmallInt(1): CborBytes(base64Decode('hr+X+CGdSZ6asMKkrzUGgw=='), tags: <int>[CborSpecialTag.uuid.tag]),
          const CborSmallInt(2): CborBytes(base64Decode('9IbG69bz57sawdF28HhRahkf1hCGbC3KDy+GVdjOWm9S3SvIeH65Dr08qisotC9rD821lNhK8QGOxYVo67LoQAA=')),
        },
        tags: <int>[CborSpecialTag.ethSignRequest.tag],
      );

      // Act
      CborEthSignature actualCborEthSignature = CborEthSignature.fromCborMap(actualCborMap);

      // Assert
      CborEthSignature expectedCborEthSignature = CborEthSignature(
        requestId: base64Decode('hr+X+CGdSZ6asMKkrzUGgw=='),
        signature: base64Decode('9IbG69bz57sawdF28HhRahkf1hCGbC3KDy+GVdjOWm9S3SvIeH65Dr08qisotC9rD821lNhK8QGOxYVo67LoQAA='),
      );

      expect(actualCborEthSignature, expectedCborEthSignature);
    });

    test('Should [return CborEthSignRequest] from CborMap (WITHOUT tag)', () {
      // Arrange
      CborMap actualCborMap = CborMap(
        <CborSmallInt, CborValue>{
          const CborSmallInt(1): CborBytes(base64Decode('hr+X+CGdSZ6asMKkrzUGgw=='), tags: <int>[CborSpecialTag.uuid.tag]),
          const CborSmallInt(2): CborBytes(base64Decode('9IbG69bz57sawdF28HhRahkf1hCGbC3KDy+GVdjOWm9S3SvIeH65Dr08qisotC9rD821lNhK8QGOxYVo67LoQAA=')),
        },
        tags: <int>[],
      );

      // Act
      CborEthSignature actualCborEthSignature = CborEthSignature.fromCborMap(actualCborMap);

      // Assert
      CborEthSignature expectedCborEthSignature = CborEthSignature(
        requestId: base64Decode('hr+X+CGdSZ6asMKkrzUGgw=='),
        signature: base64Decode('9IbG69bz57sawdF28HhRahkf1hCGbC3KDy+GVdjOWm9S3SvIeH65Dr08qisotC9rD821lNhK8QGOxYVo67LoQAA='),
      );

      expect(actualCborEthSignature, expectedCborEthSignature);
    });
  });

  group('Tests of CborEthSignRequest.toCborMap()', () {
    test('Should [return CborMap] from CborEthSignRequest (WITH tag)', () {
      // Arrange
      CborEthSignature actualCborEthSignature = CborEthSignature(
        requestId: base64Decode('hr+X+CGdSZ6asMKkrzUGgw=='),
        signature: base64Decode('9IbG69bz57sawdF28HhRahkf1hCGbC3KDy+GVdjOWm9S3SvIeH65Dr08qisotC9rD821lNhK8QGOxYVo67LoQAA='),
      );

      // Act
      CborMap actualCborMap = actualCborEthSignature.toCborMap(includeTagBool: true);

      // Assert
      CborMap expectedCborMap = CborMap(
        <CborSmallInt, CborValue>{
          const CborSmallInt(1): CborBytes(base64Decode('hr+X+CGdSZ6asMKkrzUGgw=='), tags: <int>[CborSpecialTag.uuid.tag]),
          const CborSmallInt(2): CborBytes(base64Decode('9IbG69bz57sawdF28HhRahkf1hCGbC3KDy+GVdjOWm9S3SvIeH65Dr08qisotC9rD821lNhK8QGOxYVo67LoQAA=')),
        },
        tags: <int>[CborSpecialTag.ethSignRequest.tag],
      );

      expect(actualCborMap, expectedCborMap);
    });

    test('Should [return CborMap] from CborEthSignRequest (WITHOUT tag)', () {
      // Arrange
      CborEthSignature actualCborEthSignature = CborEthSignature(
        requestId: base64Decode('hr+X+CGdSZ6asMKkrzUGgw=='),
        signature: base64Decode('9IbG69bz57sawdF28HhRahkf1hCGbC3KDy+GVdjOWm9S3SvIeH65Dr08qisotC9rD821lNhK8QGOxYVo67LoQAA='),
      );

      // Act
      CborMap actualCborMap = actualCborEthSignature.toCborMap(includeTagBool: false);

      // Assert
      CborMap expectedCborMap = CborMap(
        <CborSmallInt, CborValue>{
          const CborSmallInt(1): CborBytes(base64Decode('hr+X+CGdSZ6asMKkrzUGgw=='), tags: <int>[CborSpecialTag.uuid.tag]),
          const CborSmallInt(2): CborBytes(base64Decode('9IbG69bz57sawdF28HhRahkf1hCGbC3KDy+GVdjOWm9S3SvIeH65Dr08qisotC9rD821lNhK8QGOxYVo67LoQAA=')),
        },
        tags: <int>[],
      );

      expect(actualCborMap, expectedCborMap);
    });
  });

  group('Tests of CborEthSignRequest.getCborSpecialTag()', () {
    test('Should [return CborSpecialTag.cryptoHDKey] from CborEthSignRequest', () {
      // Arrange
      CborEthSignature actualCborEthSignature = CborEthSignature(
        requestId: base64Decode('hr+X+CGdSZ6asMKkrzUGgw=='),
        signature: base64Decode('9IbG69bz57sawdF28HhRahkf1hCGbC3KDy+GVdjOWm9S3SvIeH65Dr08qisotC9rD821lNhK8QGOxYVo67LoQAA='),
      );

      // Act
      CborSpecialTag actualCborSpecialTag = actualCborEthSignature.getCborSpecialTag();

      // Assert
      CborSpecialTag expectedCborSpecialTag = CborSpecialTag.ethSignature;

      expect(actualCborSpecialTag, expectedCborSpecialTag);
    });
  });
}
