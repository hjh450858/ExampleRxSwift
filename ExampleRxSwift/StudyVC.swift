//
//  StudyVC.swift
//  ExampleRxSwift
//
//  Created by 황재현 on 2/24/25.
//

import UIKit
import SnapKit
import Then
import Alamofire
import RxSwift
import RxCocoa

class StudyVC: UIViewController, Storyboarded {
    
    let disposeBag = DisposeBag()
    
    // 모델
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        bindingVM()
    }
    
    func configureUI() {
        
    }
    
    func bindingVM() {
        
    }
}
