//
//  MainTableViewCell.swift
//  Path
//
//  Created by PatrykD on 14/02/2021.
//

import UIKit

protocol PointsDataShowing {
    func setData(with pointData: PointsData?, isCorrupted: Bool)
}

enum PointDataType: String {
    case longitude
    case latitude
    case altitude
    case accuracy
    case distance
}

class MainTableViewCell: UITableViewCell {
    private var stackView: UIStackView = ViewsFactory.makePointsStackView()
    private lazy var stackViewBackgroundView: UIView = ViewsFactory.makeStackViewBackgroundView()
    
    // MARK: Init
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
}

// MARK: Methods related with PointsDataShowing
extension MainTableViewCell: PointsDataShowing {
    func setData(with pointData: PointsData?, isCorrupted: Bool) {
        stackViewBackgroundView.backgroundColor = isCorrupted ? UIColor.burntSienna : UIColor.scienceBlue
        
        guard let pointData = pointData else { return }
        stackView.removeAllArrangedViews()
        
        let mirror = Mirror(reflecting: pointData)
        mirror.children.forEach{
            if let label = $0.label, let pointDataType = PointDataType(rawValue: label), let text = $0.value as? String {
                stackView.addArrangedSubview(PointDetailView(with: pointDataType, name: label, value: text))
            }
        }
    }
}

// MARK: Private methods
private extension MainTableViewCell {
    func initialize() {
        contentView.addSubview(stackView)
        setBackgroundWithShadowForStackView(stackViewBackgroundView, to: stackView)
        setUpConstaints()
    }
    
    func setUpConstaints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15.0),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15.0),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15.0),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15.0)
        ])
    }
    
    func setBackgroundWithShadowForStackView(_ view: UIView, to stackView: UIStackView?) {
        guard let stackView = stackView else { return }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        stackView.insertSubview(view, at: 0)
        NSLayoutConstraint.activate([
            stackViewBackgroundView.topAnchor.constraint(equalTo: stackView.topAnchor),
            stackViewBackgroundView.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            stackViewBackgroundView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            stackViewBackgroundView.leftAnchor.constraint(equalTo: stackView.leftAnchor)
        ])
    }
}
