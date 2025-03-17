//
//  ViewController.swift
//  ExampleRxSwift
//
//  Created by 황재현 on 2/24/25.
//

import UIKit
import RxSwift
import Alamofire
import SnapKit
import Then

// 뷰컨
class ViewController: UIViewController, Storyboarded {
    let disposeBag = DisposeBag()
    
    // 뷰모델
    let vm = BaseVM()
    
    // 데이터
    var dataSource = BehaviorSubject<[String]>(value: ["Observable", "Single", "Completable", "Maybe", "PublishSubject", "BehaviorSubject", "PublishRelay", "BehaviorRelay"])
    
    // 테이블뷰
    let tableView = UITableView(frame: .zero, style: .insetGrouped).then {
        $0.backgroundColor = .systemPink
        $0.register(StudyListCell.self, forCellReuseIdentifier: "StudyListCell")
    }
    
    let subject = BehaviorSubject<String>(value: "init subject")

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        configureUI()
        
//        bindingVM()
        
        testObservable()
    }
    
    func testObservable() {
        
        // just - 단일 값 방출
//        let justObservable = Observable<String>.just("just observable")
//        justObservable.subscribe { print($0) }
//            .disposed(by: disposeBag)
        
        // of - 여러 개의 값 방출 / String 타입
//        let ofObservable = Observable<String>.of("Hellow", "Swift", "RxSwift")
//        ofObservable.subscribe { print($0) }
//            .disposed(by: disposeBag)
        
        
        // from - 배열의 값을 하나씩 방출
        // Observable<Int> - 방출할 데이터 타입
//        let fromObsrvable = Observable<Int>.from([1, 10, 50, 100])
//        fromObsrvable.subscribe { print($0) }
//            .disposed(by: disposeBag)
        
        
        // 필요한 observable을 .create로 생성
//        let customObservable = Observable<String>.create { observer in
//            // onNext로 해당 타입의 값을 방출
//            observer.onNext("custom")
//            observer.onNext("observable")
//            // onCompleted로 해당 이벤트 종료
//            observer.onCompleted()
//            return Disposables.create()
//        }
//        
//        customObservable.subscribe { print($0) }
//            .disposed(by: disposeBag)
        
        // Int타입의 Observable
//        let observable = Observable<Int>.of(3, 2, 1, 0)
//        
//        // Int타입의 Observable을 구독하여 값을 받음
//        let subscribe = observable.subscribe { event in
//            print(event)
//        }
        
        // Int타입의 Observable
//        let observable = Observable<Int>.of(2, 4, 6, 8, 10)
//        
//        // Int타입의 Observable을 구독하여 값을 받음
//        let subscribe = observable.subscribe { print($0) }
//        
//        // 즉시 구독 해제
//        subscribe.dispose()
        
//        let disposeBag = DisposeBag()
//        
//        // String타입의 Observable
//        let observable = Observable<String>.of("Hello", "Apple", "Swift", "RxSwift")
//        // String타입의 Observable 구독
//        observable.subscribe { print($0) }
//            .disposed(by: disposeBag)
        
//        let observable = Observable.of(1, 10, 20, 21, 5)
//            .filter { $0 % 2 == 0} // [10, 20]
        
//        let observable = Observable.of(1, 1, 1, 2, 2, 3, 4, 4, 2)
//            .distinctUntilChanged() // [1, 2, 3, 4, 2]
        
//        let observable = Observable.of(1, 2, 3, 4, 5, 6)
//            .skip(2) // [3, 4, 5, 6]
        
//        let observable = Observable.of(1, 2, 3)
//        
//        let users = observable
//            .concatMap { user in self.fetchUserInfo(user) }
//        
//        users.subscribe(onNext: { user in
//            print("User : \(user)")
//        }).disposed(by: disposeBag)
        
        
        // MARK: - zip Observable
//        let observable1 = Observable.of(1, 2, 3)
//        let observable2 = Observable.of("A", "B", "C")
//        
//        let zipObservable = Observable.zip(observable1, observable2)
//        
//        zipObservable.subscribe { data in
//            print("data = \(data)")
//        }.disposed(by: disposeBag)
//
//        // MARK: - combineLastest Observable
//        let publishSubject1 = PublishSubject<String>()
//        let publishSubject2 = PublishSubject<String>()
//        
//        let combineObservable = Observable.combineLatest(publishSubject1, publishSubject2)
//        // 첫번째 스트림
//        publishSubject1.subscribe { first in
//            print("first = \(first)")
//        }.disposed(by: disposeBag)
//        // 두번째 스트림
//        publishSubject2.subscribe { second in
//            print("second = \(second)")
//        }.disposed(by: disposeBag)
//        // 묶은 스트림
//        combineObservable.subscribe { (first, second) in
//            // 두 값이 다 들어와야 출력
//            print("first = \(first), second = \(second)")
//        }.disposed(by: disposeBag)
//        // 첫번째 스트림 전송
//        publishSubject1.onNext("A")
//        publishSubject1.onNext("B")
//        
//        
//        // 두번째 스트림 전송
//        publishSubject2.onNext("1")
        
        // MARK: - withLatest Observable
        // 버튼 탭 스트림
//        let buttonTap = PublishSubject<Void>()
//        // 텍스트필드 스트림
//        let textField = BehaviorSubject(value: "Text Field")
//        
//        let withLatestObservable = buttonTap.withLatestFrom(textField)
//        
//        buttonTap.subscribe { _ in
//            print("button tap")
//        }.disposed(by: disposeBag)
//        
//        withLatestObservable.subscribe { event in
//            print("event = \(event)")
//        }.disposed(by: disposeBag)
//        
//        // 버튼 탭 이벤트
//        buttonTap.onNext(())

//        // String PublishSubject 스트림
//        let publishSubject = PublishSubject<String>()
//        // 에러감지 스트림
//        let errorObservable = publishSubject.catch { _ in
//            // MARK: 에러 시 "ERROR" String 값 전달
//            Observable.just("ERROR")
//        }
//        // String 타입 값 전달
//        publishSubject.onNext("TEST")
//        // Error 타입 값 전달
//        publishSubject.onError(NSError(domain: "Error", code: -1, userInfo: nil))
//        
//        errorObservable.subscribe { event in
//            print("event = \(event)")
//        } onError: { error in
//            print("error = \(error)")
//        }.disposed(by: disposeBag)
        
        // String PublishSubject 스트림
        let publishSubject = PublishSubject<String>()
        // 재시도 최대 3회 스트림
        let retryObservable = publishSubject.retry(3)
        
        // String 타입 값 전달
        publishSubject.onNext("1")
        publishSubject.onNext("2")
        publishSubject.onNext("3")
        publishSubject.onNext("4")
        // Error 타입 값 전달
        publishSubject.onError(NSError(domain: "Error", code: -1, userInfo: nil))
        
        retryObservable.subscribe { event in
            print("event = \(event)")
        } onError: { error in
            print("error = \(error)")
        }.disposed(by: disposeBag)

    }
    
    func fetchUserInfo(_ id: Int) -> Observable<String> {
        return Observable.create { observer in
            let delay = Int.random(in: 1...3) // 1~3초 랜덤 딜레이
            DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(delay)) {
                observer.onNext("User \(id)")
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    
    // UI 구현
    func configureUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.subject.onNext("send data")
        }
    }
    
    
    /// 바인딩
    func bindingVM() {
        // 테이블뷰에 보여질 리스트
        dataSource
            .catchAndReturn([])
            .observe(on: MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "StudyListCell", cellType: StudyListCell.self)) { [weak self] (index, element, cell) in
                guard let self = self else { return }
//                print("element = \(element)")
                cell.textLabel?.text = element
            }.disposed(by: disposeBag)
        
        // 테이블뷰에 있는 리스트 선택 시
        tableView.rx.modelSelected(String.self).subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
//            print("modelSelected - data = \(data)")
            // MARK: - 화면 이동
        }).disposed(by: disposeBag)
        
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
        
        // Observable을 vm.relay에 바인딩
        vm.getObservable()
            .bind(to: vm.relay)
            .disposed(by: disposeBag)
        
        // vm.relay의 값 구독
        vm.relay.subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
            print("relay - data = \(data)")
        }).disposed(by: disposeBag)
        
        // Observable을 vm.subject에 바인딩
        vm.getObservable()
            .bind(to: vm.subject)
            .disposed(by: disposeBag)
        
        // vm.subject의 값 구독
        vm.subject.subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
            print("subject - data = \(data)")
        }, onError: { [weak self] error in
            guard let self = self else { return }
            print("subject - error = \(error)")
        }, onCompleted: {
            print("subject - onCompleted")
        }, onDisposed: {
            print("subject - onDisposed")
        }).disposed(by: disposeBag)
        
        subject.subscribe(onNext: { data in
            print("behavior subject - data = \(data)")
        }).disposed(by: disposeBag)
    }
}

