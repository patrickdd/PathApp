//
//  PointDetailView.swift
//  Path
//
//  Created by PatrykD on 15/02/2021.
//

import UIKit

class PointDetailView: UIView {
    var pointDataType: PointDataType? {
        didSet {
            switch pointDataType {
            case .longitude:
                imageView.backgroundColor = UIColor.orange
            case .latitude:
                imageView.backgroundColor = UIColor.blue
            case .altitude:
                imageView.backgroundColor = UIColor.black
            case .accuracy:
                imageView.backgroundColor = UIColor.green
            case .distance:
                imageView.backgroundColor = UIColor.red
            @unknown default:
                print("No handled case")
            }
        }
    }
    private var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.makeDefaultBold(with: 14.0)
        label.textColor = UIColor.white
        return label
    }()
    private var name = ""
    private var value = ""
    
    // MARK: Init
    
    init(with pointDataType: PointDataType, name: String, value: String) {
        super.init(frame: .zero)
        initialise()
        self.pointDataType = pointDataType
        self.name = name
        self.value = value
        setUpTitle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialise()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialise()
    }
}

// MARK: Private methods
private extension PointDetailView {
    func initialise() {
        translatesAutoresizingMaskIntoConstraints = false
        
        [nameLabel, imageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        setUpContraints()
    }
    
    func setUpContraints() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 20),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setUpTitle() {
        guard let floatValue =  Float(value)  else { return }
        nameLabel.text = "\(name): \(String(format: "%.3f", floatValue))".capitalizeFirstLetter()
    }
}

