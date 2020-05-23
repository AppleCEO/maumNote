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
  var disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    self.navigationController?.navigationBar.topItem?.title = "마음노트"
    self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushAddMemoViewController))
    reactor = ViewReactor()
  }
  
  func bind(reactor: ViewReactor) {
  
  }
  
  @objc func pushAddMemoViewController() {
    let addMemoViewController = AddMemoViewController()
    self.navigationController?.pushViewController(addMemoViewController, animated: true)
  }
}
