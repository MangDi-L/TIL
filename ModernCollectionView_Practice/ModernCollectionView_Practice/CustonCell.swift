//
//  CustonCell.swift
//  ModernCollectionView_Practice
//
//  Created by Mangdi on 2022/12/31.
//

import UIKit

class CustonCell: UICollectionViewCell {
    static let identifier = "customCell"

    private let textLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "안녕하세요"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        contentView.addSubview(textLabel)
        settingUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func settingUI() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
