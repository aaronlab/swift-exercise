//
//  DiaryTableViewCell.swift
//  MyDiary
//
//  Created by Aaron Lee on 2021/11/29.
//

import UIKit
import SnapKit
import Then

class DiaryTableViewCell: UITableViewCell {
    
    var labelTitle = UILabel()
        .then {
            $0.textAlignment = .left
            $0.numberOfLines = 2
        }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layoutView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        labelTitle.text = nil
    }
    
    // MARK: - Layout
    
    private func layoutView() {
        contentView.addSubview(labelTitle)
        labelTitle.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(8)
            $0.trailing.bottom.equalToSuperview().offset(-16)
        }
    }
    
}
