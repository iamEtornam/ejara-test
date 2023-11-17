import 'package:json_annotation/json_annotation.dart';

import 'permission.dart';
import 'role.dart';
import 'wallet.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? userId;
  String? customerAppFlow;
  String? username;
  @JsonKey(name: 'phone_number')
  dynamic phoneNumber;
  @JsonKey(name: 'phone_id')
  String? phoneId;
  @JsonKey(name: 'referal_code')
  String? referalCode;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? gender;
  bool? canBuy;
  bool? canSell;
  bool? canExchange;
  bool? canSendPay;
  bool? canReceivePay;
  bool? isPartner;
  bool? isAgent;
  @JsonKey(name: 'email_address')
  String? emailAddress;
  @JsonKey(name: 'date_of_birth')
  dynamic dateOfBirth;
  @JsonKey(name: 'preferred_language')
  String? preferredLanguage;
  @JsonKey(name: 'date_creation')
  int? dateCreation;
  @JsonKey(name: 'date_update')
  int? dateUpdate;
  @JsonKey(name: 'updated_by')
  String? updatedBy;
  @JsonKey(name: 'change_reason')
  String? changeReason;
  @JsonKey(name: 'fiat_currency_id')
  int? fiatCurrencyId;
  @JsonKey(name: 'fiat_currency_code')
  String? fiatCurrencyCode;
  @JsonKey(name: 'fiat_currency_name')
  dynamic fiatCurrencyName;
  @JsonKey(name: 'in_app_notifications')
  bool? inAppNotifications;
  @JsonKey(name: 'app_screenshots')
  bool? appScreenshots;
  dynamic details;
  @JsonKey(name: 'account_status')
  String? accountStatus;
  @JsonKey(name: 'account_is_verified')
  bool? accountIsVerified;
  @JsonKey(name: 'email_verified')
  bool? emailVerified;
  @JsonKey(name: 'phone_verified')
  bool? phoneVerified;
  int? emailVerifiedAt;
  dynamic phoneVerifiedAt;
  @JsonKey(name: 'customer_type')
  String? customerType;
  @JsonKey(name: 'kyc_level_number')
  int? kycLevelNumber;
  @JsonKey(name: 'kyc_level_name')
  String? kycLevelName;
  @JsonKey(name: 'loyalty_level')
  int? loyaltyLevel;
  @JsonKey(name: 'country_id')
  int? countryId;
  String? countryAppFlow;
  @JsonKey(name: 'country_code')
  String? countryCode;
  @JsonKey(name: 'country_name_en')
  String? countryNameEn;
  @JsonKey(name: 'country_name_fr')
  String? countryNameFr;
  @JsonKey(name: 'country_dial_code')
  String? countryDialCode;
  @JsonKey(name: 'short_country_code')
  String? shortCountryCode;
  @JsonKey(name: 'friends_referred')
  int? friendsReferred;
  @JsonKey(name: 'referral_rewards_count')
  int? referralRewardsCount;
  @JsonKey(name: 'amount_transacted')
  int? amountTransacted;
  @JsonKey(name: 'balance_in_default_fiat')
  int? balanceInDefaultFiat;
  @JsonKey(name: 'balance_in_customer_fiat')
  int? balanceInCustomerFiat;
  String? godFather;
  int? dailyLimit;
  int? weeklyLimit;
  int? monthlyLimit;
  @JsonKey(name: 'daily_limit_remaining_amount')
  int? dailyLimitRemainingAmount;
  @JsonKey(name: 'weekly_limit_remaining_amount')
  int? weeklyLimitRemainingAmount;
  @JsonKey(name: 'monthly_limit_remaining_amount')
  int? monthlyLimitRemainingAmount;
  List<Wallet>? wallets;
  List<Role>? roles;
  List<Permission>? permissions;
  @JsonKey(name: 'country_status')
  String? countryStatus;
  @JsonKey(name: 'country_can_sell')
  bool? countryCanSell;
  @JsonKey(name: 'country_can_buy')
  bool? countryCanBuy;
  @JsonKey(name: 'country_can_deposit')
  bool? countryCanDeposit;
  @JsonKey(name: 'country_can_withdraw')
  bool? countryCanWithdraw;
  @JsonKey(name: 'country_can_send')
  bool? countryCanSend;
  @JsonKey(name: 'country_can_exchange')
  bool? countryCanExchange;
  @JsonKey(name: 'country_can_access_lite')
  bool? countryCanAccessLite;
  @JsonKey(name: 'ignore_sms_otp')
  bool? ignoreSmsOtp;
  @JsonKey(name: 'ignore_email_otp')
  bool? ignoreEmailOtp;
  @JsonKey(name: 'can_initiate_money_transfer')
  bool? canInitiateMoneyTransfer;
  @JsonKey(name: 'can_receive_money_transfer')
  bool? canReceiveMoneyTransfer;
  @JsonKey(name: 'can_pay_with_moneygram')
  bool? canPayWithMoneygram;
  @JsonKey(name: 'can_withdraw_with_moneygram')
  bool? canWithdrawWithMoneygram;
  dynamic address;
  String? city;
  String? zipCode;
  dynamic shortCountryCodeOfBirth;
  dynamic shortCountryCodeOfResidence;

  Data({
    this.userId,
    this.customerAppFlow,
    this.username,
    this.phoneNumber,
    this.phoneId,
    this.referalCode,
    this.firstName,
    this.lastName,
    this.gender,
    this.canBuy,
    this.canSell,
    this.canExchange,
    this.canSendPay,
    this.canReceivePay,
    this.isPartner,
    this.isAgent,
    this.emailAddress,
    this.dateOfBirth,
    this.preferredLanguage,
    this.dateCreation,
    this.dateUpdate,
    this.updatedBy,
    this.changeReason,
    this.fiatCurrencyId,
    this.fiatCurrencyCode,
    this.fiatCurrencyName,
    this.inAppNotifications,
    this.appScreenshots,
    this.details,
    this.accountStatus,
    this.accountIsVerified,
    this.emailVerified,
    this.phoneVerified,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    this.customerType,
    this.kycLevelNumber,
    this.kycLevelName,
    this.loyaltyLevel,
    this.countryId,
    this.countryAppFlow,
    this.countryCode,
    this.countryNameEn,
    this.countryNameFr,
    this.countryDialCode,
    this.shortCountryCode,
    this.friendsReferred,
    this.referralRewardsCount,
    this.amountTransacted,
    this.balanceInDefaultFiat,
    this.balanceInCustomerFiat,
    this.godFather,
    this.dailyLimit,
    this.weeklyLimit,
    this.monthlyLimit,
    this.dailyLimitRemainingAmount,
    this.weeklyLimitRemainingAmount,
    this.monthlyLimitRemainingAmount,
    this.wallets,
    this.roles,
    this.permissions,
    this.countryStatus,
    this.countryCanSell,
    this.countryCanBuy,
    this.countryCanDeposit,
    this.countryCanWithdraw,
    this.countryCanSend,
    this.countryCanExchange,
    this.countryCanAccessLite,
    this.ignoreSmsOtp,
    this.ignoreEmailOtp,
    this.canInitiateMoneyTransfer,
    this.canReceiveMoneyTransfer,
    this.canPayWithMoneygram,
    this.canWithdrawWithMoneygram,
    this.address,
    this.city,
    this.zipCode,
    this.shortCountryCodeOfBirth,
    this.shortCountryCodeOfResidence,
  });

  @override
  String toString() {
    return 'Data(userId: $userId, customerAppFlow: $customerAppFlow, username: $username, phoneNumber: $phoneNumber, phoneId: $phoneId, referalCode: $referalCode, firstName: $firstName, lastName: $lastName, gender: $gender, canBuy: $canBuy, canSell: $canSell, canExchange: $canExchange, canSendPay: $canSendPay, canReceivePay: $canReceivePay, isPartner: $isPartner, isAgent: $isAgent, emailAddress: $emailAddress, dateOfBirth: $dateOfBirth, preferredLanguage: $preferredLanguage, dateCreation: $dateCreation, dateUpdate: $dateUpdate, updatedBy: $updatedBy, changeReason: $changeReason, fiatCurrencyId: $fiatCurrencyId, fiatCurrencyCode: $fiatCurrencyCode, fiatCurrencyName: $fiatCurrencyName, inAppNotifications: $inAppNotifications, appScreenshots: $appScreenshots, details: $details, accountStatus: $accountStatus, accountIsVerified: $accountIsVerified, emailVerified: $emailVerified, phoneVerified: $phoneVerified, emailVerifiedAt: $emailVerifiedAt, phoneVerifiedAt: $phoneVerifiedAt, customerType: $customerType, kycLevelNumber: $kycLevelNumber, kycLevelName: $kycLevelName, loyaltyLevel: $loyaltyLevel, countryId: $countryId, countryAppFlow: $countryAppFlow, countryCode: $countryCode, countryNameEn: $countryNameEn, countryNameFr: $countryNameFr, countryDialCode: $countryDialCode, shortCountryCode: $shortCountryCode, friendsReferred: $friendsReferred, referralRewardsCount: $referralRewardsCount, amountTransacted: $amountTransacted, balanceInDefaultFiat: $balanceInDefaultFiat, balanceInCustomerFiat: $balanceInCustomerFiat, godFather: $godFather, dailyLimit: $dailyLimit, weeklyLimit: $weeklyLimit, monthlyLimit: $monthlyLimit, dailyLimitRemainingAmount: $dailyLimitRemainingAmount, weeklyLimitRemainingAmount: $weeklyLimitRemainingAmount, monthlyLimitRemainingAmount: $monthlyLimitRemainingAmount, wallets: $wallets, roles: $roles, permissions: $permissions, countryStatus: $countryStatus, countryCanSell: $countryCanSell, countryCanBuy: $countryCanBuy, countryCanDeposit: $countryCanDeposit, countryCanWithdraw: $countryCanWithdraw, countryCanSend: $countryCanSend, countryCanExchange: $countryCanExchange, countryCanAccessLite: $countryCanAccessLite, ignoreSmsOtp: $ignoreSmsOtp, ignoreEmailOtp: $ignoreEmailOtp, canInitiateMoneyTransfer: $canInitiateMoneyTransfer, canReceiveMoneyTransfer: $canReceiveMoneyTransfer, canPayWithMoneygram: $canPayWithMoneygram, canWithdrawWithMoneygram: $canWithdrawWithMoneygram, address: $address, city: $city, zipCode: $zipCode, shortCountryCodeOfBirth: $shortCountryCodeOfBirth, shortCountryCodeOfResidence: $shortCountryCodeOfResidence)';
  }

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
