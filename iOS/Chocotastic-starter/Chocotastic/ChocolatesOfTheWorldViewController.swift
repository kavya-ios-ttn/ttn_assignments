
import UIKit
import RxSwift
import RxCocoa

class ChocolatesOfTheWorldViewController: UIViewController {
  @IBOutlet private var cartButton: UIBarButtonItem!
  @IBOutlet private var tableView: UITableView!
  
  let europeanChocolates = Observable.just(Chocolate.ofEurope) // This sets up a reactive Observer to update the cart values automatically.
     
  let disposeBag = DisposeBag() // This creates the DisposeBag which you’ll use to clean up any Observers you set up.
}

//MARK: View Lifecycle
extension ChocolatesOfTheWorldViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Chocolate!!!"
    
//    tableView.dataSource = self
//    tableView.delegate = self
    setupCartObserver()
    setupTableViewDataSource()
    setupTableViewDelegates()

  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
//    updateCartButton()
  }
}

//MARK: - Rx Setup

// making the chocolate view controller a reactive table view using Rx swift by adding observables and subscribing the data.
private extension ChocolatesOfTheWorldViewController {
  func setupCartObserver() {
    ShoppingCart.sharedCart
      .chocolates
      .asObservable()
      // on subscribing using onNext the cartbutton in the right corner of the navigation bar gets updated with the count of the chocolates selected from the table view
      .subscribe (onNext: { [weak self] newChocolates in
        self?.cartButton.title = "\(newChocolates.count) 🍫"
      })
   
      .disposed(by: disposeBag)
  }

  func setupTableViewDataSource() {
    // binding the table view data source so as to get the chocolate model in the table view cell
    europeanChocolates.bind(to: tableView.rx.items(cellIdentifier: ChocolateCell.Identifier, cellType: ChocolateCell.self)) { _, model, cell in
      cell.configureWithChocolate(chocolate: model)
    }.disposed(by: disposeBag)
  }

  func setupTableViewDelegates() {
   
    // added the functionality of incrementing the count of chocolates in the navigation bar by subscribing the table view cell and hence updating the shopping cart values.
    tableView.rx.modelSelected(Chocolate.self)
      .subscribe(onNext: { chocolate in
        let newValue = ShoppingCart.sharedCart.chocolates.value + [chocolate]
        ShoppingCart.sharedCart.chocolates.accept(newValue)

        if let selectedRowIndexPath = self.tableView.indexPathForSelectedRow {
          self.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
        }
      }).disposed(by: disposeBag)
  }
}

// MARK: - SegueHandler
extension ChocolatesOfTheWorldViewController: SegueHandler {
  enum SegueIdentifier: String {
    case goToCart
  }
}
