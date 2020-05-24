//
// ListView
//  maumNote
//
//  Created by joon-ho kil on 2020/05/22.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import UIKit
import ReactorKit
import RxCocoa
import RxSwift

class ListViewController: UIViewController, View {
  @IBOutlet var tableView: UITableView!
  
  var disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    reactor = ViewReactor()
  }
  
  func bind(reactor: ViewReactor) {
    reactor.state.map { $0.memos }
      .bind(to: self.tableView.rx.items(cellIdentifier: "cell")) { indexPath, memo, cell in
        cell.textLabel?.text = memo.title
    }
    .disposed(by: disposeBag)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToAdd" {
      let viewController = segue.destination as! AddMemoViewController
      viewController.reactor = self.reactor
      return
    }
    
    guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
      return
    }
      
    let memo = reactor?.currentState.memos[indexPath.row]
    let viewController = segue.destination as! DetailViewController
    viewController.memo = memo
  }
}
