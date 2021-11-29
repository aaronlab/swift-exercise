//
//  NewDiaryViewModel.swift
//  MyDiary
//
//  Created by Aaron Lee on 2021/11/29.
//

import Foundation
import RxSwift
import RxCocoa

final class NewDiaryViewModel {
    
    private var bag = DisposeBag()
    
    var savePressed = PublishSubject<Void>()
    var text = BehaviorRelay<String>(value: "")
    var isValid: Observable<Bool> {
        return text
            .map {
                !$0.replacingOccurrences(of: " ", with: "").isEmpty
            }
    }
    
    init() {
        bindRx()
    }
    
    deinit {
        bag = DisposeBag()
    }
    
}

extension NewDiaryViewModel {
    
    private func bindRx() {
        bindSavePressed()
    }
    
    private func bindSavePressed() {
        savePressed
            .map { [weak self] _ -> String in
                return self?.text.value ?? ""
            }
            .bind(onNext: { [weak self] text in
                
            })
            .disposed(by: bag)
    }
    
}
