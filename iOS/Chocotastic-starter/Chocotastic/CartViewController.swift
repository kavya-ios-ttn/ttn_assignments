
import UIKit
import RxSwift
import RxCocoa

class CartViewController: UIViewController {
  @IBOutlet private var checkoutButton: UIButton!
  @IBOutlet private var totalItemsLabel: UILabel!
  @IBOutlet private var totalCostLabel: UILabel!

  var tableView: UITableView!
}

//MARK: - View lifecycle
extension CartViewController {
  override func viewDidLoad() {
    tableView = UITableView(frame: .zero)
    super.viewDidLoad()
    title = "Cart"
    configureFromCart()

    let chocolates = ShoppingCart.sharedCart.chocolates
    let setOfChocolates = Set<Chocolate>(chocolates.value)

    let itemStrings: [String] = setOfChocolates.map {
      chocolate in
      let count: Int = chocolates.value.reduce(0) {
        runningTotal, reduceChocolate in
        if chocolate == reduceChocolate {
          return runningTotal + 1
        }

        return runningTotal
      }

      return "\(chocolate.countryFlagEmoji)🍫: \(count)"
    }

    let allChocolates = Observable.just(itemStrings)
  }
}

//MARK: - IBActions
extension CartViewController {
  @IBAction func reset() {
//    ShoppingCart.sharedCart.chocolates = []
    ShoppingCart.sharedCart.chocolates.accept([])
    let _ = navigationController?.popViewController(animated: true)
  }
}

//MARK: - Configuration methods
private extension CartViewController {
  func configureFromCart() {
    guard checkoutButton != nil else {
      //UI has not been instantiated yet. Bail!
      return
    }
    
    let cart = ShoppingCart.sharedCart
    totalItemsLabel.text = cart.itemCountString
    
    let cost = cart.totalCost
    totalCostLabel.text = CurrencyFormatter.dollarsFormatter.string(from: cost)
    
    //Disable checkout if there's nothing to check out with
    checkoutButton.isEnabled = (cost > 0)
  }
}
