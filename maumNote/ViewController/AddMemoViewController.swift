//
//  AddMemoViewController.swift
//  maumNote
//
//  Created by joon-ho kil on 2020/05/23.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import UIKit
import ReactorKit

class AddMemoViewController: UIViewController, View {
  @IBOutlet var titleTextField: UITextField!
  @IBOutlet var contentTextView: UITextView!
  
  var disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    self.contentTextView.layer.cornerRadius = 5
    self.contentTextView.layer.borderColor = UIColor.init(red: 204/255.0, green: 204/255.0, blue: 204/255.0, alpha: 1).cgColor
    self.contentTextView.layer.borderWidth = 1
    self.contentTextView.clipsToBounds = true
  }
  
  func bind(reactor: ViewReactor) {
    
  }
  
  @IBAction func AddMemo(_ sender: Any) {
    
  }
  
}
