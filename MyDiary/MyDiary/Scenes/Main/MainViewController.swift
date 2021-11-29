//
//  MainViewController.swift
//  MyDiary
//
//  Created by Aaron Lee on 2021/11/29.
//

import UIKit
import RxSwift
import RxCocoa
import Then

fileprivate let tableViewCellIdentifier = "tableViewCell"

class MainViewController: UIViewController {
    
    private var bag = DisposeBag()
    
    /// Add Button
    private let addButton = UIBarButtonItem(image: nil,
                                            style: .plain,
                                            target: nil,
                                            action: nil)
        .then {
            $0.image = UIImage(named: "plus")?.withRenderingMode(.alwaysOriginal)
        }
    
    /// Table View
    private let tableView = UITableView()
        .then {
            $0.rowHeight = 48
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        layoutView()
        bindRx()
    }
    
}

// MARK: - Configure

extension MainViewController {
    
    private func configureView() {
        configureTitle()
    }
    
    private func configureTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "My Diary"
    }
    
}

// MARK: - Layout

extension MainViewController {
    
    private func layoutView() {
        layoutAddBarButton()
        layoutTableView()
    }
    
    private func layoutAddBarButton() {
        navigationItem.setRightBarButton(addButton, animated: true)
    }
    
    private func layoutTableView() {
        tableView.register(DiaryTableViewCell.self, forCellReuseIdentifier: tableViewCellIdentifier)
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
}

// MARK: - Bind

extension MainViewController {
    
    private func bindRx() {
        bindAddButton()
    }
    
    private func bindAddButton() {
        addButton
            .rx
            .tap
            .bind(onNext: { [weak self] in
                guard let self = self else { return }
                
                DispatchQueue.main.async {
                    let newDiaryViewController = NewDiaryViewController()
                    self.navigationController?.pushViewController(newDiaryViewController,
                                                                  animated: true)
                }
            })
            .disposed(by: bag)
    }
    
}
