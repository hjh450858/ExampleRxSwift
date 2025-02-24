//
//  ViewController.swift
//  ExampleRxSwift
//
//  Created by 황재현 on 2/24/25.
//

import UIKit
import RxSwift
import Alamofire

class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    let vm = BaseVM()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindingVM()
    }
    
    
    /// 바인딩
    func bindingVM() {
        // single 구독
        vm.single.subscribe { event in
            switch event {
            case .success(let data):
                // 성공 시
                print("single - data = \(data)")
            case .failure(let error):
                // 실패 시
                print("single - error = \(error)")
            }
        }.disposed(by: disposeBag)
        
        // completable 구독
        vm.completable.subscribe { event in
            switch event {
            case .error(let error):
                // 에러 시
                print("completable - error = \(error)")
            case .completed:
                // 완료 시
                print("completable - completed")
            }
        }.disposed(by: disposeBag)
        
        // maybe 구독
        vm.maybe.subscribe { event in
            switch event {
            case .success(let data):
                // 성공 시
                print("maybe - data = \(data)")
            case .error(let error):
                // 에러 시
                print("maybe - error = \(error)")
            case .completed:
                // 완료 시
                print("maybe - completed")
            }
        }.disposed(by: disposeBag)
        
        vm.fetchData()
        // 백그라운드에서 실행
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
        // 메인 스레드에서 UI 업데이트
            .observe(on: MainScheduler.instance)
            .subscribe(onSuccess: {[weak self] data in
                guard let self = self else { return }
                // 성공 시
                print("onSuccess - data = \(data)")
            }, onFailure: { [weak self] error in
                guard let self = self else { return }
                // 실패 시
                print("onFailure - error = \(error)")
            }).disposed(by: disposeBag)
    }
}

