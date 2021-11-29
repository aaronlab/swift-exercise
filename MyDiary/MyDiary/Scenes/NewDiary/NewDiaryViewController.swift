//
//  NewDiaryViewController.swift
//  MyDiary
//
//  Created by Aaron Lee on 2021/11/29.
//

import UIKit
import UITextView_Placeholder
import RxSwift

class NewDiaryViewController: UIViewController {
    
    private var bag = DisposeBag()
    
    private var viewModel = NewDiaryViewModel()
    
    private let textView = UITextView()
        .then {
            $0.placeholder = "How was your day?"
            $0.placeholderColor = .gray
            $0.font = .systemFont(ofSize: 22)
        }
    
    private let saveButton = UIButton(type: .system)
        .then {
            $0.setTitle("Save", for: .normal)
            $0.backgroundColor = .gray
            $0.setTitleColor(.white, for: .normal)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        layoutView()
        bindRx()
    }
    
}

// MARK: - Configure

extension NewDiaryViewController {
    
    private func configureView() {
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "New Diary"
    }
    
}

// MARK: - Layout

extension NewDiaryViewController {
    
    private func layoutView() {
        layoutTextView()
        layoutSaveButton()
    }
    
    private func layoutTextView() {
        view.addSubview(textView)
        textView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(16)
        }
    }
    
    private func layoutSaveButton() {
        view.addSubview(saveButton)
        saveButton.snp.makeConstraints {
            $0.top.equalTo(textView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        view.layoutIfNeeded()
    }
    
}

// MARK: - Bind

extension NewDiaryViewController {
    
    private func bindRx() {
        bindNotificationCenter()
        bindViewModel()
    }
    
    private func bindNotificationCenter() {
        NotificationCenter.default
            .keyboardWillChangeFrame()
            .bind(onNext: { [weak self] height in
                guard let self = self else { return }
                
                DispatchQueue.main.async {
                    self.saveButton.snp.updateConstraints {
                        $0.bottom.equalToSuperview().offset(-height)
                        $0.height.equalTo(50)
                    }
                    
                    UIView.animate(withDuration: 0.3) {
                        self.view.layoutIfNeeded()
                    }
                }
            })
            .disposed(by: bag)
        
        NotificationCenter.default
            .keyboardWillHideObservable()
            .bind(onNext: { [weak self] _ in
                guard let self = self else { return }
                
                DispatchQueue.main.async {
                    self.saveButton.snp.updateConstraints {
                        $0.bottom.equalToSuperview().offset(0)
                        $0.height.equalTo(100)
                    }
                    
                    UIView.animate(withDuration: 0.3) {
                        self.view.layoutIfNeeded()
                    }
                }
            })
            .disposed(by: bag)
    }
    
    private func bindViewModel() {
        textView
            .rx
            .text
            .orEmpty
            .distinctUntilChanged()
            .bind(to: viewModel.text)
            .disposed(by: bag)
        
        saveButton
            .rx
            .tap
            .bind(to: viewModel.savePressed)
            .disposed(by: bag)
        
        viewModel.isValid
            .bind(onNext: { [weak self] isValid in
                let color: UIColor = isValid ? .orange : .gray
                if self?.saveButton.backgroundColor == color { return }
                
                self?.saveButton.isEnabled = isValid
                UIView.animate(withDuration: 0.3) {
                    self?.saveButton.backgroundColor = color
                }
            })
            .disposed(by: bag)
    }
    
}
