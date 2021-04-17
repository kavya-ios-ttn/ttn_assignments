

import UIKit
import RxSwift
import RxCocoa

class BillingInfoViewController: UIViewController {
  @IBOutlet private var creditCardNumberTextField: ValidatingTextField!
  @IBOutlet private var creditCardImageView: UIImageView!
  @IBOutlet private var expirationDateTextField: ValidatingTextField!
  @IBOutlet private var cvvTextField: ValidatingTextField!
  @IBOutlet private var purchaseButton: UIButton!
  
  private let cardType: BehaviorRelay<CardType> = BehaviorRelay(value: .unknown)
  private let throlltleIntervalInMillis = 1000

  private let disposeBag = DisposeBag()
}

// MARK: - View Lifecycle
extension BillingInfoViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "💳 Info"
    creditCardNumberTextField.textColor = .black
    creditCardNumberTextField.layer.borderWidth = 1.0
    creditCardNumberTextField.layer.borderColor = UIColor.black.cgColor

    expirationDateTextField.textColor = .black
    expirationDateTextField.layer.borderWidth = 1.0
    expirationDateTextField.layer.borderColor = UIColor.black.cgColor

    cvvTextField.textColor = .black
    cvvTextField.layer.borderWidth = 1.0
    cvvTextField.layer.borderColor = UIColor.black.cgColor

    setupCardType()
    setupTextFieldTextChangeHandling()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let identifier = self.identifier(forSegue: segue)
    switch identifier {
    case .purchaseSuccess:
      guard let destination = segue.destination as? ChocolateIsComingViewController else {
        assertionFailure("Couldn't get chocolate is coming VC!")
        return
      }
      destination.cardType = cardType.value
    }
  }
}

//MARK: - RX Setup

// here we are making the Billing info view controller reactive
private extension BillingInfoViewController {
  
  // adding observer on the selection of the card type
  
  func setupCardType() {
    cardType.asObservable()
      .subscribe(onNext: { [unowned self] cardType in
        self.creditCardImageView.image = cardType.image
      }).disposed(by: disposeBag)
  }
  
  // selecting the appropriate card type by observing the card number format
  
  func setupTextFieldTextChangeHandling() {
    let creditCardValid = creditCardNumberTextField
      .rx
      .text
      .observeOn(MainScheduler.asyncInstance)
      .distinctUntilChanged()
      .throttle(.milliseconds(throlltleIntervalInMillis), scheduler: MainScheduler.instance)
      .map { [unowned self] in
        self.validate(cardText: $0)
      }
    
    // validating the card type if valid or not by subscribing the creditCardNumberTextField
    
    creditCardValid.subscribe(onNext: { [unowned self] in
      self.creditCardNumberTextField.valid = $0
    }).disposed(by: disposeBag)
    
    // validating the expiration date of the credit card validated
    let expirationValidity = expirationDateTextField
      .rx
      .text
      .observeOn(MainScheduler.asyncInstance)
      .distinctUntilChanged()
      .throttle(.milliseconds(throlltleIntervalInMillis), scheduler: MainScheduler.instance)
      .map { [unowned self] in
        self.validate(expirationDateText: $0)
      }

    expirationValidity.subscribe(onNext: { [unowned self] in
      self.expirationDateTextField.valid = $0
    }).disposed(by: disposeBag)

    // validating the cvv of the credit card validated above.
    let cvvValid = cvvTextField
      .rx
      .text
      .observeOn(MainScheduler.asyncInstance)
      .distinctUntilChanged()
      .throttle(.milliseconds(throlltleIntervalInMillis), scheduler: MainScheduler.instance)
      .map { [unowned self] in
        self.validate(cvvText: $0)
      }

    cvvValid.subscribe(onNext: { [unowned self] in
      self.cvvTextField.valid = $0
    }).disposed(by: disposeBag)


    // clubbing the observables sequence to return the control only if all the sequences are true and thereafter enabling the purchase button to make the purchase successful.
    
    let isEverythingValid = Observable.combineLatest(creditCardValid, expirationValidity, cvvValid) { [unowned self] isCardValid, isExpiryValid, iscvvValid -> Bool in
      debugPrint(isCardValid)
      debugPrint(isExpiryValid)
      debugPrint(iscvvValid)

      return isCardValid && isExpiryValid && iscvvValid
    }

    isEverythingValid
      .bind(to: purchaseButton.rx.isEnabled)
      .disposed(by: disposeBag)
  }
}

//MARK: - Validation methods
private extension BillingInfoViewController {
  func validate(cardText: String?) -> Bool {
    guard let cardText = cardText else {
      return false
    }
    let noWhitespace = cardText.removingSpaces
    
    updateCardType(using: noWhitespace)
    formatCardNumber(using: noWhitespace)
    advanceIfNecessary(noSpacesCardNumber: noWhitespace)
    
    guard cardType.value != .unknown else {
      
      //Definitely not valid if the type is unknown.
      return false
    }
    
    guard noWhitespace.isLuhnValid else {
      
      //Failed luhn validation
      return false
    }
    
    return noWhitespace.count == cardType.value.expectedDigits
  }
  
  func validate(expirationDateText expiration: String?) -> Bool {
    guard let expiration = expiration else {
      return false
    }
    let strippedSlashExpiration = expiration.removingSlash
    
    formatExpirationDate(using: strippedSlashExpiration)
    advanceIfNecessary(expirationNoSpacesOrSlash:  strippedSlashExpiration)
    
    return strippedSlashExpiration.isExpirationDateValid
  }
  
  func validate(cvvText cvv: String?) -> Bool {
    guard let cvv = cvv else {
      return false
    }
    guard cvv.areAllCharactersNumbers else {
      //Someone snuck a letter in here.
      return false
    }
    dismissIfNecessary(cvv: cvv)
    return cvv.count == cardType.value.cvvDigits
  }
}

//MARK: Single-serve helper functions
private extension BillingInfoViewController {
  func updateCardType(using noSpacesNumber: String) {
    cardType.accept(CardType.fromString(string: noSpacesNumber))
  }
  
  func formatCardNumber(using noSpacesCardNumber: String) {
    creditCardNumberTextField.text = cardType.value.format(noSpaces: noSpacesCardNumber)
  }
  
  func advanceIfNecessary(noSpacesCardNumber: String) {
    if noSpacesCardNumber.count == cardType.value.expectedDigits {
      expirationDateTextField.becomeFirstResponder()
    }
  }
  
  func formatExpirationDate(using expirationNoSpacesOrSlash: String) {
    expirationDateTextField.text = expirationNoSpacesOrSlash.addingSlash
  }
  
  func advanceIfNecessary(expirationNoSpacesOrSlash: String) {
    if expirationNoSpacesOrSlash.count == 6 { //mmyyyy
      cvvTextField.becomeFirstResponder()
    }
  }
  
  func dismissIfNecessary(cvv: String) {
    if cvv.count == cardType.value.cvvDigits {
      let _ = cvvTextField.resignFirstResponder()
    }
  }
}

// MARK: - SegueHandler
extension BillingInfoViewController: SegueHandler {
  enum SegueIdentifier: String {
    case purchaseSuccess
  }
}

