import 'package:json_annotation/json_annotation.dart';

part 'wallet.g.dart';

@JsonSerializable()
class Wallet {
  int? balance;
  @JsonKey(name: 'public_key')
  String? publicKey;
  @JsonKey(name: 'crypto_address')
  String? cryptoAddress;
  @JsonKey(name: 'currency_iso_alpha_code')
  String? currencyIsoAlphaCode;
  @JsonKey(name: 'currency_name')
  String? currencyName;
  @JsonKey(name: 'currency_is_fiat')
  int? currencyIsFiat;
  @JsonKey(name: 'currency_is_stable')
  int? currencyIsStable;
  @JsonKey(name: 'currency_can_stake')
  int? currencyCanStake;
  @JsonKey(name: 'wallet_type')
  String? walletType;

  Wallet({
    this.balance,
    this.publicKey,
    this.cryptoAddress,
    this.currencyIsoAlphaCode,
    this.currencyName,
    this.currencyIsFiat,
    this.currencyIsStable,
    this.currencyCanStake,
    this.walletType,
  });

  @override
  String toString() {
    return 'Wallet(balance: $balance, publicKey: $publicKey, cryptoAddress: $cryptoAddress, currencyIsoAlphaCode: $currencyIsoAlphaCode, currencyName: $currencyName, currencyIsFiat: $currencyIsFiat, currencyIsStable: $currencyIsStable, currencyCanStake: $currencyCanStake, walletType: $walletType)';
  }

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return _$WalletFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WalletToJson(this);
}
