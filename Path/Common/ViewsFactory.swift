//
//  ViewsFactory.swift
//  Path
//
//  Created by PatrykD on 16/02/2021.
//

import UIKit

protocol ViewsFactoryType {
    func makeMainTableView() -> UITableView
    static func makePointsStackView() -> UIStackView
    static func makeStackViewBackgroundView() -> UIView
}

class ViewsFactory: ViewsFactoryType {
    func makeMainTableView() -> UITableView {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.registerReusableCell(MainTableViewCell.self)
        tableView.separatorStyle = .none
        tableView.bounces = false
        return tableView
    }
    
    static func makePointsStackView() -> UIStackView {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    static func makeStackViewBackgroundView() -> UIView {
        let view = UIView()
        view.setRoundedCorners()
        view.setUpShadow()
        view.backgroundColor = UIColor.scienceBlue
        return view
    }
}
