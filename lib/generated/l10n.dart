// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `A-Store`
  String get appName {
    return Intl.message(
      'A-Store',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `E-commerce Marketplace`
  String get slagon {
    return Intl.message(
      'E-commerce Marketplace',
      name: 'slagon',
      desc: '',
      args: [],
    );
  }

  /// `Find Your Product`
  String get onBoardingTitle1 {
    return Intl.message(
      'Find Your Product',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Select Payment Method`
  String get onBoardingTitle2 {
    return Intl.message(
      'Select Payment Method',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Diliver at your door step`
  String get onBoardingTitle3 {
    return Intl.message(
      'Diliver at your door step',
      name: 'onBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Welcome at the World of Limitless Choices - Your Perfect Product Awaits!`
  String get onBoardingSubTitle1 {
    return Intl.message(
      'Welcome at the World of Limitless Choices - Your Perfect Product Awaits!',
      name: 'onBoardingSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// `For Seemless Transaction, Choose Payment Path - Your Convenience, Our Priority`
  String get onBoardingSubTitle2 {
    return Intl.message(
      'For Seemless Transaction, Choose Payment Path - Your Convenience, Our Priority',
      name: 'onBoardingSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `From Our Doorstep to Yours - Swift, secure, and reliable Delivery`
  String get onBoardingSubTitle3 {
    return Intl.message(
      'From Our Doorstep to Yours - Swift, secure, and reliable Delivery',
      name: 'onBoardingSubTitle3',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get userName {
    return Intl.message(
      'Username',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get remmberMe {
    return Intl.message(
      'Remember Me',
      name: 'remmberMe',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Or sign in with`
  String get orSignInWith {
    return Intl.message(
      'Or sign in with',
      name: 'orSignInWith',
      desc: '',
      args: [],
    );
  }

  /// `Or sign up with`
  String get orsignUpWith {
    return Intl.message(
      'Or sign up with',
      name: 'orsignUpWith',
      desc: '',
      args: [],
    );
  }

  /// `I agree to`
  String get iAgreeTo {
    return Intl.message(
      'I agree to',
      name: 'iAgreeTo',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use`
  String get termsOfUse {
    return Intl.message(
      'Terms of Use',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get verificationCode {
    return Intl.message(
      'Verification Code',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend Email`
  String get resendEmail {
    return Intl.message(
      'Resend Email',
      name: 'resendEmail',
      desc: '',
      args: [],
    );
  }

  /// `And`
  String get and {
    return Intl.message(
      'And',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back,`
  String get loginTitle {
    return Intl.message(
      'Welcome back,',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Discover Limitless Choices and Unmatched Convenience.`
  String get loginSubTitle {
    return Intl.message(
      'Discover Limitless Choices and Unmatched Convenience.',
      name: 'loginSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Let’s create your account`
  String get signupTitle {
    return Intl.message(
      'Let’s create your account',
      name: 'signupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get forgetPasswordTitle {
    return Intl.message(
      'Forget password',
      name: 'forgetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Don’t worry sometimes people can forget too, enter your email and we will send you a password reset link.`
  String get forgetPasswordSubTitle {
    return Intl.message(
      'Don’t worry sometimes people can forget too, enter your email and we will send you a password reset link.',
      name: 'forgetPasswordSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Password Reset Email Sent`
  String get changeYourPasswordTitle {
    return Intl.message(
      'Password Reset Email Sent',
      name: 'changeYourPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your Account Security is Our Priority! We've Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.`
  String get changeYourPasswordSubTitle {
    return Intl.message(
      'Your Account Security is Our Priority! We\'ve Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.',
      name: 'changeYourPasswordSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verify your email address!`
  String get confirmEmail {
    return Intl.message(
      'Verify your email address!',
      name: 'confirmEmail',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.`
  String get confirmEmailSubTitle {
    return Intl.message(
      'Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.',
      name: 'confirmEmailSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Didn’t get the email? Check your junk/spam or resend it.`
  String get emailNotReceivedMessage {
    return Intl.message(
      'Didn’t get the email? Check your junk/spam or resend it.',
      name: 'emailNotReceivedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your account successfully created!`
  String get yourAccountCreatedTitle {
    return Intl.message(
      'Your account successfully created!',
      name: 'yourAccountCreatedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!`
  String get yourAccountCreatedSubTitle {
    return Intl.message(
      'Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!',
      name: 'yourAccountCreatedSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Good day for shopping`
  String get homeAppBarTitle {
    return Intl.message(
      'Good day for shopping',
      name: 'homeAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `IsFirstTime`
  String get isFirstTime {
    return Intl.message(
      'IsFirstTime',
      name: 'isFirstTime',
      desc: '',
      args: [],
    );
  }

  /// `RememberMeEmail`
  String get rememberMeEmail {
    return Intl.message(
      'RememberMeEmail',
      name: 'rememberMeEmail',
      desc: '',
      args: [],
    );
  }

  /// `RememberMePassword`
  String get rememberMePassword {
    return Intl.message(
      'RememberMePassword',
      name: 'rememberMePassword',
      desc: '',
      args: [],
    );
  }

  /// `Email Sent`
  String get emailSentTitle {
    return Intl.message(
      'Email Sent',
      name: 'emailSentTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please check your Inbox to verify your email.`
  String get emailSentSubTitle {
    return Intl.message(
      'Please check your Inbox to verify your email.',
      name: 'emailSentSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Oh Snap!`
  String get ohSnap {
    return Intl.message(
      'Oh Snap!',
      name: 'ohSnap',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again later.`
  String get errorMessage {
    return Intl.message(
      'Something went wrong. Please try again later.',
      name: 'errorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Have a Promo Code? Enter here`
  String get enterPromoCode {
    return Intl.message(
      'Have a Promo Code? Enter here',
      name: 'enterPromoCode',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Show More`
  String get showMore {
    return Intl.message(
      'Show More',
      name: 'showMore',
      desc: '',
      args: [],
    );
  }

  /// `Show Less`
  String get showLess {
    return Intl.message(
      'Show Less',
      name: 'showLess',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Logging Out`
  String get loggingOut {
    return Intl.message(
      'Logging Out',
      name: 'loggingOut',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get logOutMessage {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logOutMessage',
      desc: '',
      args: [],
    );
  }

  /// `Processing your request...`
  String get requestProcessing {
    return Intl.message(
      'Processing your request...',
      name: 'requestProcessing',
      desc: '',
      args: [],
    );
  }

  /// `Email has been sent to Reset your Password.`
  String get resetPasswordEmail {
    return Intl.message(
      'Email has been sent to Reset your Password.',
      name: 'resetPasswordEmail',
      desc: '',
      args: [],
    );
  }

  /// `Logging you in...`
  String get loggingIn {
    return Intl.message(
      'Logging you in...',
      name: 'loggingIn',
      desc: '',
      args: [],
    );
  }

  /// `We are Processing your information`
  String get informationProcessing {
    return Intl.message(
      'We are Processing your information',
      name: 'informationProcessing',
      desc: '',
      args: [],
    );
  }

  /// `Accept our Policy and Terms`
  String get acceptPolicyAndTerms {
    return Intl.message(
      'Accept our Policy and Terms',
      name: 'acceptPolicyAndTerms',
      desc: '',
      args: [],
    );
  }

  /// `in order to create your account, please accept our policy`
  String get acceptPolicyAndTermsMessage {
    return Intl.message(
      'in order to create your account, please accept our policy',
      name: 'acceptPolicyAndTermsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations!`
  String get congratulations {
    return Intl.message(
      'Congratulations!',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `Your account was created successfully! verify your email to continue`
  String get accountCreatedSuccessfully {
    return Intl.message(
      'Your account was created successfully! verify your email to continue',
      name: 'accountCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Re-Authentication User`
  String get reAuthenticationUser {
    return Intl.message(
      'Re-Authentication User',
      name: 'reAuthenticationUser',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Success!`
  String get success {
    return Intl.message(
      'Success!',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `address added successfully`
  String get addressAdded {
    return Intl.message(
      'address added successfully',
      name: 'addressAdded',
      desc: '',
      args: [],
    );
  }

  /// `address deleted successfully`
  String get addressDeleted {
    return Intl.message(
      'address deleted successfully',
      name: 'addressDeleted',
      desc: '',
      args: [],
    );
  }

  /// `address updated successfully`
  String get addressUpdated {
    return Intl.message(
      'address updated successfully',
      name: 'addressUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Select Address`
  String get selectAddress {
    return Intl.message(
      'Select Address',
      name: 'selectAddress',
      desc: '',
      args: [],
    );
  }

  /// `No Address Found`
  String get noAddressFound {
    return Intl.message(
      'No Address Found',
      name: 'noAddressFound',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get addNewAddress {
    return Intl.message(
      'Add New Address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `light`
  String get light {
    return Intl.message(
      'light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `dark`
  String get dark {
    return Intl.message(
      'dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `system`
  String get system {
    return Intl.message(
      'system',
      name: 'system',
      desc: '',
      args: [],
    );
  }

  /// `Your name has been updated.`
  String get nameUpdated {
    return Intl.message(
      'Your name has been updated.',
      name: 'nameUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Your phone number has been updated.`
  String get phoneUpdated {
    return Intl.message(
      'Your phone number has been updated.',
      name: 'phoneUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Your User Name has been updated.`
  String get userNameUpdated {
    return Intl.message(
      'Your User Name has been updated.',
      name: 'userNameUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Data Not Saved`
  String get dataNotSaved {
    return Intl.message(
      'Data Not Saved',
      name: 'dataNotSaved',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.`
  String get deleteAccountMessage {
    return Intl.message(
      'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      name: 'deleteAccountMessage',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Account Deleted Successfully`
  String get accountDeletedSuccessfully {
    return Intl.message(
      'Account Deleted Successfully',
      name: 'accountDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Copied`
  String get copied {
    return Intl.message(
      'Copied',
      name: 'copied',
      desc: '',
      args: [],
    );
  }

  /// `Copied to clipboard`
  String get copiedToClipboard {
    return Intl.message(
      'Copied to clipboard',
      name: 'copiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Profile Picture Updated Successfully`
  String get profilePictureUpdatedSuccessfully {
    return Intl.message(
      'Profile Picture Updated Successfully',
      name: 'profilePictureUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `My Addresses`
  String get myAddresses {
    return Intl.message(
      'My Addresses',
      name: 'myAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Set shopping delivery address`
  String get setShoppingDeliveryAddress {
    return Intl.message(
      'Set shopping delivery address',
      name: 'setShoppingDeliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get myCart {
    return Intl.message(
      'My Cart',
      name: 'myCart',
      desc: '',
      args: [],
    );
  }

  /// `Add, remove products and move to checkout`
  String get addRemoveProductsMoveToCheckout {
    return Intl.message(
      'Add, remove products and move to checkout',
      name: 'addRemoveProductsMoveToCheckout',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message(
      'My Orders',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `In-progress and Completed Orders`
  String get inProgressAndCompletedOrders {
    return Intl.message(
      'In-progress and Completed Orders',
      name: 'inProgressAndCompletedOrders',
      desc: '',
      args: [],
    );
  }

  /// `Credit Cards`
  String get creditCards {
    return Intl.message(
      'Credit Cards',
      name: 'creditCards',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw balance to registered bank account`
  String get withdrawBalanceToBank {
    return Intl.message(
      'Withdraw balance to registered bank account',
      name: 'withdrawBalanceToBank',
      desc: '',
      args: [],
    );
  }

  /// `My Coupons`
  String get myCoupons {
    return Intl.message(
      'My Coupons',
      name: 'myCoupons',
      desc: '',
      args: [],
    );
  }

  /// `List of all the discounted coupons`
  String get listOfDiscountedCoupons {
    return Intl.message(
      'List of all the discounted coupons',
      name: 'listOfDiscountedCoupons',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Set any kind of notification message`
  String get setNotificationMessages {
    return Intl.message(
      'Set any kind of notification message',
      name: 'setNotificationMessages',
      desc: '',
      args: [],
    );
  }

  /// `Account Privacy`
  String get accountPrivacy {
    return Intl.message(
      'Account Privacy',
      name: 'accountPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Manage data usage and connected accounts`
  String get manageDataUsage {
    return Intl.message(
      'Manage data usage and connected accounts',
      name: 'manageDataUsage',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Update Address`
  String get updateAddress {
    return Intl.message(
      'Update Address',
      name: 'updateAddress',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Building Number`
  String get buildingNumber {
    return Intl.message(
      'Building Number',
      name: 'buildingNumber',
      desc: '',
      args: [],
    );
  }

  /// `Street`
  String get street {
    return Intl.message(
      'Street',
      name: 'street',
      desc: '',
      args: [],
    );
  }

  /// `Postal Code`
  String get postalCode {
    return Intl.message(
      'Postal Code',
      name: 'postalCode',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message(
      'State',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `New Card`
  String get newCard {
    return Intl.message(
      'New Card',
      name: 'newCard',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get cardNumber {
    return Intl.message(
      'Card Number',
      name: 'cardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Cardholder Name`
  String get cardholderName {
    return Intl.message(
      'Cardholder Name',
      name: 'cardholderName',
      desc: '',
      args: [],
    );
  }

  /// `Expiry Date (MM/YY)`
  String get expiryDate {
    return Intl.message(
      'Expiry Date (MM/YY)',
      name: 'expiryDate',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get cvv {
    return Intl.message(
      'CVV',
      name: 'cvv',
      desc: '',
      args: [],
    );
  }

  /// `Save Card info`
  String get saveCardInfo {
    return Intl.message(
      'Save Card info',
      name: 'saveCardInfo',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your card number`
  String get enterCardNumber {
    return Intl.message(
      'Please enter your card number',
      name: 'enterCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Card number must be 16 digits`
  String get cardNumberLength {
    return Intl.message(
      'Card number must be 16 digits',
      name: 'cardNumberLength',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the cardholder name`
  String get enterCardholderName {
    return Intl.message(
      'Please enter the cardholder name',
      name: 'enterCardholderName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the expiry date`
  String get enterExpiryDate {
    return Intl.message(
      'Please enter the expiry date',
      name: 'enterExpiryDate',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid expiry date (MM/YY)`
  String get validExpiryDate {
    return Intl.message(
      'Enter a valid expiry date (MM/YY)',
      name: 'validExpiryDate',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the CVV`
  String get enterCvv {
    return Intl.message(
      'Please enter the CVV',
      name: 'enterCvv',
      desc: '',
      args: [],
    );
  }

  /// `CVV must be 3 digits`
  String get cvvLength {
    return Intl.message(
      'CVV must be 3 digits',
      name: 'cvvLength',
      desc: '',
      args: [],
    );
  }

  /// `Payment Methods`
  String get paymentMethods {
    return Intl.message(
      'Payment Methods',
      name: 'paymentMethods',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a real phone number for easy Communication`
  String get enterRealPhoneNumber {
    return Intl.message(
      'Please enter a real phone number for easy Communication',
      name: 'enterRealPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Change Phone Number`
  String get changePhoneNumber {
    return Intl.message(
      'Change Phone Number',
      name: 'changePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Change UserName`
  String get changeUserName {
    return Intl.message(
      'Change UserName',
      name: 'changeUserName',
      desc: '',
      args: [],
    );
  }

  /// `Use a nice username for easy identifing`
  String get changeUserNameMessage {
    return Intl.message(
      'Use a nice username for easy identifing',
      name: 'changeUserNameMessage',
      desc: '',
      args: [],
    );
  }

  /// `Change Name`
  String get changeName {
    return Intl.message(
      'Change Name',
      name: 'changeName',
      desc: '',
      args: [],
    );
  }

  /// `Use real name for easy Verification`
  String get realNameVerification {
    return Intl.message(
      'Use real name for easy Verification',
      name: 'realNameVerification',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your first name`
  String get enterFirstName {
    return Intl.message(
      'Please enter your first name',
      name: 'enterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your last name`
  String get enterLastName {
    return Intl.message(
      'Please enter your last name',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Change Profile Photo`
  String get changeProfilePhoto {
    return Intl.message(
      'Change Profile Photo',
      name: 'changeProfilePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Profile Information`
  String get profileInformation {
    return Intl.message(
      'Profile Information',
      name: 'profileInformation',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInformation {
    return Intl.message(
      'Personal Information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `User ID`
  String get userId {
    return Intl.message(
      'User ID',
      name: 'userId',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get accountSettings {
    return Intl.message(
      'Account Settings',
      name: 'accountSettings',
      desc: '',
      args: [],
    );
  }

  /// `App Settings`
  String get appSettings {
    return Intl.message(
      'App Settings',
      name: 'appSettings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Set your preferred language`
  String get setYourPreferredLanguage {
    return Intl.message(
      'Set your preferred language',
      name: 'setYourPreferredLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Choose your preferred theme`
  String get chooseYourPreferredTheme {
    return Intl.message(
      'Choose your preferred theme',
      name: 'chooseYourPreferredTheme',
      desc: '',
      args: [],
    );
  }

  /// `Geolocation`
  String get geolocation {
    return Intl.message(
      'Geolocation',
      name: 'geolocation',
      desc: '',
      args: [],
    );
  }

  /// `Set recommendation based on location`
  String get setRecommendationBasedOnLocation {
    return Intl.message(
      'Set recommendation based on location',
      name: 'setRecommendationBasedOnLocation',
      desc: '',
      args: [],
    );
  }

  /// `Enable notifications`
  String get enableNotifications {
    return Intl.message(
      'Enable notifications',
      name: 'enableNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Price: Low to High`
  String get priceLowToHigh {
    return Intl.message(
      'Price: Low to High',
      name: 'priceLowToHigh',
      desc: '',
      args: [],
    );
  }

  /// `Price: High to Low`
  String get priceHighToLow {
    return Intl.message(
      'Price: High to Low',
      name: 'priceHighToLow',
      desc: '',
      args: [],
    );
  }

  /// `Sale`
  String get sale {
    return Intl.message(
      'Sale',
      name: 'sale',
      desc: '',
      args: [],
    );
  }

  /// `Newest`
  String get newest {
    return Intl.message(
      'Newest',
      name: 'newest',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `In Stock`
  String get inStock {
    return Intl.message(
      'In Stock',
      name: 'inStock',
      desc: '',
      args: [],
    );
  }

  /// `Out of Stock`
  String get outOfStock {
    return Intl.message(
      'Out of Stock',
      name: 'outOfStock',
      desc: '',
      args: [],
    );
  }

  /// `Remove Product`
  String get removeProduct {
    return Intl.message(
      'Remove Product',
      name: 'removeProduct',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to remove this product from the cart?`
  String get confirmRemove {
    return Intl.message(
      'Are you sure you want to remove this product from the cart?',
      name: 'confirmRemove',
      desc: '',
      args: [],
    );
  }

  /// `Product removed from cart`
  String get removedFromCart {
    return Intl.message(
      'Product removed from cart',
      name: 'removedFromCart',
      desc: '',
      args: [],
    );
  }

  /// `Select Quantity`
  String get selectQuantity {
    return Intl.message(
      'Select Quantity',
      name: 'selectQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Select Variation`
  String get selectVariation {
    return Intl.message(
      'Select Variation',
      name: 'selectVariation',
      desc: '',
      args: [],
    );
  }

  /// `Select Payment Method`
  String get selectPaymentMethod {
    return Intl.message(
      'Select Payment Method',
      name: 'selectPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Product has been added to the wishlist.`
  String get addedToWishlist {
    return Intl.message(
      'Product has been added to the wishlist.',
      name: 'addedToWishlist',
      desc: '',
      args: [],
    );
  }

  /// `Product has been removed from the wishlist.`
  String get removedFromWishlist {
    return Intl.message(
      'Product has been removed from the wishlist.',
      name: 'removedFromWishlist',
      desc: '',
      args: [],
    );
  }

  /// `Your order has been placed successfully`
  String get orderPlacedMessage {
    return Intl.message(
      'Your order has been placed successfully',
      name: 'orderPlacedMessage',
      desc: '',
      args: [],
    );
  }

  /// `No Brands Found`
  String get noBrandsFound {
    return Intl.message(
      'No Brands Found',
      name: 'noBrandsFound',
      desc: '',
      args: [],
    );
  }

  /// `No Products Found`
  String get noProductsFound {
    return Intl.message(
      'No Products Found',
      name: 'noProductsFound',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Whoops! Cart is empty`
  String get cartEmpty {
    return Intl.message(
      'Whoops! Cart is empty',
      name: 'cartEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Let's fill it up`
  String get fillCart {
    return Intl.message(
      'Let\'s fill it up',
      name: 'fillCart',
      desc: '',
      args: [],
    );
  }

  /// `Empty Cart.`
  String get emptyCart {
    return Intl.message(
      'Empty Cart.',
      name: 'emptyCart',
      desc: '',
      args: [],
    );
  }

  /// `Add items to cart`
  String get addItems {
    return Intl.message(
      'Add items to cart',
      name: 'addItems',
      desc: '',
      args: [],
    );
  }

  /// `Wishlist`
  String get wishlist {
    return Intl.message(
      'Wishlist',
      name: 'wishlist',
      desc: '',
      args: [],
    );
  }

  /// `Whoops! Wishlist is empty...`
  String get wishlistEmpty {
    return Intl.message(
      'Whoops! Wishlist is empty...',
      name: 'wishlistEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Let's add some`
  String get addSome {
    return Intl.message(
      'Let\'s add some',
      name: 'addSome',
      desc: '',
      args: [],
    );
  }

  /// `All Products`
  String get allProducts {
    return Intl.message(
      'All Products',
      name: 'allProducts',
      desc: '',
      args: [],
    );
  }

  /// `Search in Store`
  String get searchInStore {
    return Intl.message(
      'Search in Store',
      name: 'searchInStore',
      desc: '',
      args: [],
    );
  }

  /// `Popular Categories`
  String get popularCategories {
    return Intl.message(
      'Popular Categories',
      name: 'popularCategories',
      desc: '',
      args: [],
    );
  }

  /// `No categories found`
  String get noCategoriesFound {
    return Intl.message(
      'No categories found',
      name: 'noCategoriesFound',
      desc: '',
      args: [],
    );
  }

  /// `Popular Products`
  String get popularProducts {
    return Intl.message(
      'Popular Products',
      name: 'popularProducts',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get order_details {
    return Intl.message(
      'Order Details',
      name: 'order_details',
      desc: '',
      args: [],
    );
  }

  /// `Order #`
  String get order_number {
    return Intl.message(
      'Order #',
      name: 'order_number',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Fee`
  String get shipping_fee {
    return Intl.message(
      'Shipping Fee',
      name: 'shipping_fee',
      desc: '',
      args: [],
    );
  }

  /// `Tax Fee`
  String get tax_fee {
    return Intl.message(
      'Tax Fee',
      name: 'tax_fee',
      desc: '',
      args: [],
    );
  }

  /// `Order Total`
  String get order_total {
    return Intl.message(
      'Order Total',
      name: 'order_total',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get payment_method {
    return Intl.message(
      'Payment Method',
      name: 'payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Address`
  String get shipping_address {
    return Intl.message(
      'Shipping Address',
      name: 'shipping_address',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `No Notes`
  String get no_notes {
    return Intl.message(
      'No Notes',
      name: 'no_notes',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Reviews & Ratings`
  String get reviews_and_ratings {
    return Intl.message(
      'Reviews & Ratings',
      name: 'reviews_and_ratings',
      desc: '',
      args: [],
    );
  }

  /// `Ratings and Reviews are verified and are from people who use this app like you and use the same type of device.`
  String get ratings_and_reviews_message {
    return Intl.message(
      'Ratings and Reviews are verified and are from people who use this app like you and use the same type of device.',
      name: 'ratings_and_reviews_message',
      desc: '',
      args: [],
    );
  }

  /// `Store`
  String get store {
    return Intl.message(
      'Store',
      name: 'store',
      desc: '',
      args: [],
    );
  }

  /// `Featured Brands`
  String get featured_brands {
    return Intl.message(
      'Featured Brands',
      name: 'featured_brands',
      desc: '',
      args: [],
    );
  }

  /// `Brands`
  String get brands {
    return Intl.message(
      'Brands',
      name: 'brands',
      desc: '',
      args: [],
    );
  }

  /// `No categories available`
  String get no_categories_available {
    return Intl.message(
      'No categories available',
      name: 'no_categories_available',
      desc: '',
      args: [],
    );
  }

  /// `No Brands Found`
  String get no_brands_found {
    return Intl.message(
      'No Brands Found',
      name: 'no_brands_found',
      desc: '',
      args: [],
    );
  }

  /// `You May Also Like`
  String get you_may_also_like {
    return Intl.message(
      'You May Also Like',
      name: 'you_may_also_like',
      desc: '',
      args: [],
    );
  }

  /// `No Products Found`
  String get no_products_found {
    return Intl.message(
      'No Products Found',
      name: 'no_products_found',
      desc: '',
      args: [],
    );
  }

  /// `Search in Store`
  String get search_in_store {
    return Intl.message(
      'Search in Store',
      name: 'search_in_store',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Address`
  String get shippingAddress {
    return Intl.message(
      'Shipping Address',
      name: 'shippingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Date`
  String get shippingDate {
    return Intl.message(
      'Shipping Date',
      name: 'shippingDate',
      desc: '',
      args: [],
    );
  }

  /// `Not Set`
  String get notSet {
    return Intl.message(
      'Not Set',
      name: 'notSet',
      desc: '',
      args: [],
    );
  }

  /// `Quantity: `
  String get quantityLabel {
    return Intl.message(
      'Quantity: ',
      name: 'quantityLabel',
      desc: '',
      args: [],
    );
  }

  /// `Total Price: `
  String get totalPriceLabel {
    return Intl.message(
      'Total Price: ',
      name: 'totalPriceLabel',
      desc: '',
      args: [],
    );
  }

  /// `No Orders Found`
  String get noOrdersFound {
    return Intl.message(
      'No Orders Found',
      name: 'noOrdersFound',
      desc: '',
      args: [],
    );
  }

  /// `Add to Bag`
  String get addToBag {
    return Intl.message(
      'Add to Bag',
      name: 'addToBag',
      desc: '',
      args: [],
    );
  }

  /// `Status: `
  String get status {
    return Intl.message(
      'Status: ',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Variation: `
  String get variation {
    return Intl.message(
      'Variation: ',
      name: 'variation',
      desc: '',
      args: [],
    );
  }

  /// `Quantity: `
  String get quantity {
    return Intl.message(
      'Quantity: ',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Price: `
  String get price {
    return Intl.message(
      'Price: ',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Total Price: `
  String get totalPrice {
    return Intl.message(
      'Total Price: ',
      name: 'totalPrice',
      desc: '',
      args: [],
    );
  }

  /// `is required`
  String get fieldRequired {
    return Intl.message(
      'is required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get invalidEmail {
    return Intl.message(
      'Invalid email address',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get passwordTooShort {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get phoneNumberRequired {
    return Intl.message(
      'Phone number is required',
      name: 'phoneNumberRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid phone number',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password is required`
  String get confirmPasswordRequired {
    return Intl.message(
      'Confirm password is required',
      name: 'confirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'de'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
