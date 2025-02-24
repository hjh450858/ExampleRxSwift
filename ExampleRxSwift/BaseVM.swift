//
//  BaseVM.swift
//  ExampleRxSwift
//
//  Created by 황재현 on 2/24/25.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

/*
 https://jsonplaceholder.typicode.com/
 Alamofire 테스트 사이트
 */

class BaseVM: NSObject {
    /*
     single<T> = 단 하나의 값 또는 에러만 방출
     .next(value)를 딱 한번만 방출하고, 즉시 .completed
     .error(error)로 실패할 수 있음
     MARK: - 네트워크 요청, 데이터베이스 조회 등에 적합
     일반 Observable과 달리 여러 개의 .next(value)를 방출할 수 없음
     
     실무 활용 예:
     네트워크 요청(ex: RxAlamofire.requestJSON)
     파일 읽기 / 저장
     DB에서 특정 데이터 가져오기
     * 연속적인 데이터 스트림에는 적합하지않음(Observable 사용)
     */
    let single = Single<String>.create { single in
        let success = true
        if success {
            // 성공 시 단 하나의 값 방출
            single(.success("성공"))
        } else {
            // 실패 시 에러 방출
            single(.failure(NSError(domain: "API_ERROR", code: 400, userInfo: nil)))
        }
        return Disposables.create()
    }
    
    /*
     completable = 데이터 없이 성공 또는 실패만 방출
     .next(value)없이 .completed 또는 .error(error)만 방출
     작업의 성공/실패만 전달할 때 사용됨
     MARK: - 파일 저장, 로그아웃, 설정 변경, DB 업데이트 같은 작업에 적합
     
     실무 활용 예:
     파일 저장 / 삭제
     로그아웃 / 설정 변경
     로컬 DB 업데이트
     *데이터를 반환해야 하는 경우에는 Single이나 Observable 사용
     */
    let completable = Completable.create { completable in
        let success = true
        if success {
            // 성공했을 경우
            completable(.completed)
        } else {
            // 실패했을 경우
            completable(.error(NSError(domain: "File_ERROR", code: 505, userInfo: nil)))
        }
        return Disposables.create()
    }
    
    /*
     Maybe<T> = 단 하나의 값, 완료 또는 에러 중 하나만 방출
     Single과 Completable의 중간 형태
     .next(value)를 방출할 수도 있고, 안 할 수도 있음
     MARK: - 값이 없을 수도 있는 캐싱된 데이터 조회 같은 작업에 적합
     
     실무 활용 예:
     캐시된 데이터 조회(데이터가 있을 수도, 없을 수도 있음)
     로컬 DB에서 값 조회
     선택적인 데이터 반환 (ex: 로그인 상태 확인 등)
     *항상 값이 존재하는 경우에는 Single을 사용
     */
    let maybe = Maybe<String>.create { maybe in
        // 데이터가 있을 수도 있고, 없을 수도 있음
        let cacheData: String? = "이전 데이터"
        
        if let data = cacheData {
            // 데이터가 있으면 값 반환 후 완료
            maybe(.success(data))
        } else {
            // 데이터가 없으면 완료 이벤트 전달
            maybe(.completed)
        }
        return Disposables.create()
    }
    
    
    // Single + Alamofire (RxSwift에서 만든 "RxAlamofire"랑 같음)
    func fetchData() -> Single<String> {
        return Single.create { single in
            let request = AF.request("https://jsonplaceholder.typicode.com/todos/1")
                .responseString { response in
                    switch response.result {
                    case .success(let data):
                        // 성공 시 데이터 전달
                        single(.success(data))
                    case .failure(let error):
                        // 실패 시 에러 전달
                        single(.failure(error))
                    }
                }
            return Disposables.create {
                // 구독이 해제되면 요청 취소
                request.cancel()
            }
        }
    }
}
