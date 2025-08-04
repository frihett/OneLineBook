import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../../domain/repository/firebase_auth_repository.dart';

class AccountViewModel with ChangeNotifier {
  final bool _isLoading = true;
  final FirebaseAuthRepository _firebaseAuthRepository;
  final InAppPurchase _iap = InAppPurchase.instance;

  bool _iapAvailable = false;
  List<ProductDetails> _products = [];
  final String _productId = 'donation_coffee';

  AccountViewModel({
    required FirebaseAuthRepository firebaseAuthRepository,
  }) : _firebaseAuthRepository = firebaseAuthRepository {
    _initIAP();
    _listenToPurchaseUpdated();
  }

  bool get isLoading => _isLoading;

  bool get isIAPAvailable => _iapAvailable;

  List<ProductDetails> get products => _products;

  Future<void> _initIAP() async {
    final available = await _iap.isAvailable();
    print('available : ${available}');
    _iapAvailable = available;
    if (!available) {
      notifyListeners();
      return;
    }

    final response = await _iap.queryProductDetails({_productId});
    if (response.notFoundIDs.isEmpty) {
      _products = response.productDetails;
    }
    notifyListeners();
  }

  void purchaseCoffee() {
    print('purchaseCoffee');
    if (_products.isNotEmpty) {
      final purchaseParam = PurchaseParam(productDetails: _products.first);
      _iap.buyConsumable(purchaseParam: purchaseParam);
    }
  }

  void _listenToPurchaseUpdated() {
    InAppPurchase.instance.purchaseStream.listen((purchases) {
      for (var purchase in purchases) {
        if (purchase.status == PurchaseStatus.purchased) {
          print('후원 완료!');
        } else if (purchase.status == PurchaseStatus.error) {
          print('결제 오류: ${purchase.error}');
        }
      }
    });
  }

  Future<void> logOut() async {
    await _firebaseAuthRepository.signOut();
  }
}
