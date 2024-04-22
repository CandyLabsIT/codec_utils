import 'dart:convert';

import 'package:codec_utils/codec_utils.dart';
import 'package:test/test.dart';

void main() {
  group('Tests of URRegistryDecoder.decode()', () {
    test('Should [return URRegistryCryptoCoinInfo] if given UR [type is "crypto-coin-info"]', () {
      // Arrange
      // ur:crypto-coin-info/taadehoeadcsfnaoadaygevwjs
      UR actualUR = UR(
        type: 'crypto-coin-info',
        cborPayload: base64Decode('2QExogEYPAIB'),
      );

      // Act
      IURRegistryRecord actualURRegistryRecord = URRegistryDecoder.decode(actualUR);

      // Assert
      URRegistryCryptoCoinInfo expectedURRegistryRecord = const URRegistryCryptoCoinInfo(type: 60, network: 1);

      expect(actualURRegistryRecord, expectedURRegistryRecord);
    });

    test('Should [return URRegistryCryptoHDKey] if given UR [type is "crypto-hdkey"]', () {
      // Arrange
      // ur:crypto-hdkey/onaxhdclaxpsgefyjsutpfckcalydtgyjpamjlndfsetiyhtetaajprnzseokptbhnghasesiyaahdcxvabdvsmucpttaodrfyayrobwveasvefnrezsrpbbfyotvyenwyuejogdcyiojeuoamtaaddyoeadlncsdwykcsfnykaeykaocynlzsiamnaycydyeeiyidasjnfpinjpflhsjocxdpcxjykthsjyrkbedymn
      UR actualUR = UR(
        type: 'crypto-hdkey',
        cborPayload: base64Decode(
            'pQNYIQOsSkRx3bAeHYEpUXIGb5s9OGZaOARyvvozddZgVAk5ZgRYIOYL6JMi0QIqRAi4E+QJ5Dy1+rYURKPhNu7ecFAaZ2vcBtkBMKIBhhgs9Rg89QD1AhqZ+mOOCBowNGZiCW1BaXJHYXAgLSB0d2F0'),
      );

      // Act
      IURRegistryRecord actualURRegistryRecord = URRegistryDecoder.decode(actualUR);

      // Assert
      URRegistryCryptoHDKey expectedURRegistryRecord = URRegistryCryptoHDKey(
        isMaster: false,
        isPrivate: false,
        keyData: base64Decode('A6xKRHHdsB4dgSlRcgZvmz04Zlo4BHK++jN11mBUCTlm'),
        chainCode: base64Decode('5gvokyLRAipECLgT5AnkPLX6thREo+E27t5wUBpna9w='),
        origin: const URRegistryCryptoKeypath(
          components: <PathComponent>[
            PathComponent(index: 44, hardened: true),
            PathComponent(index: 60, hardened: true),
            PathComponent(index: 0, hardened: true)
          ],
          sourceFingerprint: 2583323534,
        ),
        parentFingerprint: 808740450,
        name: 'AirGap - twat',
      );

      expect(actualURRegistryRecord, expectedURRegistryRecord);
    });

    test('Should [return URRegistryCryptoKeypath] if given UR [type is "crypto-keypath"]', () {
      // Arrange
      // ur:crypto-keypath/taaddyoeadlecsdwykcsfnykaeykaewkaewkaocymshlgtwnvejedtny
      UR actualUR = UR(
        type: 'crypto-keypath',
        cborPayload: base64Decode('2QEwogGKGCz1GDz1APUA9AD0AhqXXU3x'),
      );

      // Act
      IURRegistryRecord actualURRegistryRecord = URRegistryDecoder.decode(actualUR);

      // Assert
      URRegistryCryptoKeypath expectedURRegistryRecord = const URRegistryCryptoKeypath(
        components: <PathComponent>[
          PathComponent(index: 44, hardened: true),
          PathComponent(index: 60, hardened: true),
          PathComponent(index: 0, hardened: true),
          PathComponent(index: 0, hardened: false),
          PathComponent(index: 0, hardened: false)
        ],
        sourceFingerprint: 2539474417,
      );

      expect(actualURRegistryRecord, expectedURRegistryRecord);
    });

    test('Should [return URRegistryEthSignature] if given UR [type is "eth-signature"]', () {
      // Arrange
      // ur:eth-signature/oeadtpdagdlnrsmsyaclntgannnypfsaoxpeecamlsaohdfpwklnswwmtbwfvdrkcysettkowtksgyimcfcttbbelnjzdpsgbsdllngotptohtjlgmutdnspkskbrhbaryfnpkdndeqzdljebssnremwtpgewnadmnsklpiswmprvsfzaeonondyny
      UR actualUR = UR(
        type: 'eth-signature',
        cborPayload: base64Decode('ogHYJVCGv5f4IZ1JnpqwwqSvNQaDAlhB9IbG69bz57sawdF28HhRahkf1hCGbC3KDy+GVdjOWm9S3SvIeH65Dr08qisotC9rD821lNhK8QGOxYVo67LoQAA='),
      );

      // Act
      IURRegistryRecord actualURRegistryRecord = URRegistryDecoder.decode(actualUR);

      // Assert
      URRegistryEthSignature expectedURRegistryRecord = URRegistryEthSignature(
        requestId: base64Decode('hr+X+CGdSZ6asMKkrzUGgw=='),
        signature: base64Decode('9IbG69bz57sawdF28HhRahkf1hCGbC3KDy+GVdjOWm9S3SvIeH65Dr08qisotC9rD821lNhK8QGOxYVo67LoQAA='),
      );

      expect(actualURRegistryRecord, expectedURRegistryRecord);
    });

    test('Should [return URRegistryEthSignRequest] if given UR [type is "eth-sign-request"]', () {
      // Arrange
      // ur:eth-sign-request/1015-3/lpcfaxylaxcfadmkcyltotttcwhdlowkcymwenidhdoyolwsvwlthkpfstgwamdklotizsvofybahthkbkenjofhhsdkcneodwdwcxcsftksjpimbnfhfxdpcmbtkiindebbjyiacnieenieiseodpemiaiacpemcpkbdyendnkoihdidyfrihfmkgbyjpisfsbnftkoihctatctcwsbfwdnpmglrlhlehwngyfnzmguptfdvycyzcgyflfmknrturamheguwkhsfngrfgdypfcycldwnldigdvtvekkfwbyfzfemuhfet
      // ur:eth-sign-request/491-3/lpcfadwmaxcfadmkcyltotttcwhdlogycwgsbweyashhaygmfpchcahhgsfxfxbgaockcthlfghghpchhlgucehhbagafgbwhdfxaehggecaceesinhyiddiceglbyaegrlbghchgsfyfebtbshlbthybtfxfxhkfghygygofdbwbzgubegwbthphphyaobtguhehechfegridjnkoroidfysbjtveetfxltethenyjklycxmdjtlgcpkibygopepeiaehcxmeaebgcpdtctsskpgmahrhfgfmlrssdtdyksenihbylsvd
      // ur:eth-sign-request/675-3/lpcfaootaxcfadmkcyltotttcwhdlohsiakkcxgdjljziniakkcxdeisjyjyjojkftdldljljoihjtjkihhsdminjldljojpinkohsiakkdtdmbkbkghisinjkcxjpihjskpihjkjycxktinjzjzcxjtjljycxjyjpinioioihjpcxhscxidjzjliajeiaishsinjtcxjyjphsjtjkhsiajyinjljtcxjljpcxiajljkjycxhsjtkkcxiohsjkcxiyihihjkdmbkbkhghsjzjzihjycxhsieiejpihjkjkftbkbsuepsbg

      UR actualUR = UR(
        type: 'eth-sign-request',
        cborPayload: base64Decode(
            'pQHYJVBR/a69pJBE7IsMRTaKzuW/AlkBTldlbGNvbWUgdG8gT3BlblNlYSEKCkNsaWNrIHRvIHNpZ24gaW4gYW5kIGFjY2VwdCB0aGUgT3BlblNlYSBUZXJtcyBvZiBTZXJ2aWNlIChodHRwczovL29wZW5zZWEuaW8vdG9zKSBhbmQgUHJpdmFjeSBQb2xpY3kgKGh0dHBzOi8vb3BlbnNlYS5pby9wcml2YWN5KS4KClRoaXMgcmVxdWVzdCB3aWxsIG5vdCB0cmlnZ2VyIGEgYmxvY2tjaGFpbiB0cmFuc2FjdGlvbiBvciBjb3N0IGFueSBnYXMgZmVlcy4KCldhbGxldCBhZGRyZXNzOgoweDUzYmYwYTE4NzU0ODczYTgxMDI2MjVkODIyNWFmNmExNWE0MzQyM2MKCk5vbmNlOgoxZDhkMmRjMS0wYjdjLTQ3NjItYTUyMC1hNDg1YWUyNjE3MTkDAwXZATCiAYoYLPUYPPUA9QD0APQCGnAmj8kGVFO/Chh1SHOoECYl2CJa9qFaQ0I8'),
      );

      // Act
      IURRegistryRecord actualURRegistryRecord = URRegistryDecoder.decode(actualUR);

      // Assert
      URRegistryEthSignRequest expectedURRegistryRecord = URRegistryEthSignRequest(
        requestId: base64Decode('Uf2uvaSQROyLDEU2is7lvw=='),
        signData: base64Decode(
            'V2VsY29tZSB0byBPcGVuU2VhIQoKQ2xpY2sgdG8gc2lnbiBpbiBhbmQgYWNjZXB0IHRoZSBPcGVuU2VhIFRlcm1zIG9mIFNlcnZpY2UgKGh0dHBzOi8vb3BlbnNlYS5pby90b3MpIGFuZCBQcml2YWN5IFBvbGljeSAoaHR0cHM6Ly9vcGVuc2VhLmlvL3ByaXZhY3kpLgoKVGhpcyByZXF1ZXN0IHdpbGwgbm90IHRyaWdnZXIgYSBibG9ja2NoYWluIHRyYW5zYWN0aW9uIG9yIGNvc3QgYW55IGdhcyBmZWVzLgoKV2FsbGV0IGFkZHJlc3M6CjB4NTNiZjBhMTg3NTQ4NzNhODEwMjYyNWQ4MjI1YWY2YTE1YTQzNDIzYwoKTm9uY2U6CjFkOGQyZGMxLTBiN2MtNDc2Mi1hNTIwLWE0ODVhZTI2MTcxOQ=='),
        dataType: EthSignDataType.rawBytes,
        derivationPath: const URRegistryCryptoKeypath(
          components: <PathComponent>[
            PathComponent(index: 44, hardened: true),
            PathComponent(index: 60, hardened: true),
            PathComponent(index: 0, hardened: true),
            PathComponent(index: 0, hardened: false),
            PathComponent(index: 0, hardened: false)
          ],
          sourceFingerprint: 1881575369,
        ),
        address: '0x53bf0a18754873a8102625d8225af6a15a43423c',
      );

      expect(actualURRegistryRecord, expectedURRegistryRecord);
    });
  });
}
