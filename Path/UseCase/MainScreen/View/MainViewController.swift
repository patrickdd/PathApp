//
//  MainViewController.swift
//  Path
//
//  Created by PatrykD on 13/02/2021.
//

import UIKit
import GoogleMaps

protocol MainViewType: class {
    var presenter: MainPresenterType? { get set }
    func showPointsOnMap(with pointsData: [PointsData])
    var viewFactory: ViewsFactoryType? { get set }
}

class MainViewController: UIViewController {
    weak var presenter: MainPresenterType?
    var tableView: UITableView!
    var mapView: MapView?
    var viewFactory: ViewsFactoryType?
    private var path = GMSMutablePath()
    private var correctedPath = GMSMutablePath()
    private var correctedCoordinateBounds = GMSCoordinateBounds()
    var setCorrectPathButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.titleLabel?.font = UIFont.makeDefaultBold(with: 14.0)
        button.backgroundColor = UIColor.scienceBlue
        button.setTitle("Show correct path", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setRoundedCorners()
        return button
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.loadData(completion: { [weak self] in
            self?.tableView.reloadData()
        })
    }
    
    override func loadView() {
        super.loadView()
        setUp()
    }
    
    // MARK: Action methods
    
     @objc func setCorrectPathTapped(sender: UIButton) {
        mapView?.clear()
        let rectangle = GMSPolyline(path: correctedPath)
        rectangle.map = mapView
        mapView?.animate(with: GMSCameraUpdate.fit(correctedCoordinateBounds, withPadding: 20.0))
    }
}

extension MainViewController: MainViewType {
    func showPointsOnMap(with pointsData: [PointsData]) {
        DispatchQueue.main.async { [weak self] in
            self?.show(with: pointsData)
        }
    }
    
    private func show(with pointsData: [PointsData]) {
        var coordinateBounds = GMSCoordinateBounds()
        
        var previousLocation: CLLocation?
        var location: CLLocation
        
        for point in pointsData {
           
            location = CLLocation(latitude: Double(point.latitude)!, longitude: Double(point.longitude)!)
            path.add(location.coordinate)
            coordinateBounds = coordinateBounds.includingCoordinate(location.coordinate)
            
            if let previous = previousLocation, 8.0 > location.distance(from: previous) {
                let distance = location.distance(from: previous)
                correctedPath.add(location.coordinate)
                correctedCoordinateBounds.includingCoordinate(location.coordinate)
            }
            
            previousLocation = CLLocation(latitude: Double(point.latitude)!, longitude: Double(point.longitude)!)
        }
    
        let rectangle = GMSPolyline(path: path)
        rectangle.map = mapView
        mapView?.isMyLocationEnabled = true
        mapView?.animate(with: GMSCameraUpdate.fit(coordinateBounds, withPadding: 20.0))
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.itemsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainTableViewCell = tableView.dequeue(indexPath) as MainTableViewCell
        cell.setData(with: presenter?.getItem(with: indexPath.row))
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}

// MARK: Private methods
extension MainViewController {
    func setUp() {
        view.backgroundColor = UIColor.haverlockBlue
        tableView = viewFactory?.makeMainTableView()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        mapView = MapView(frame: CGRect(x: 0,y: 0, width: view.bounds.width, height: 280.0))
        mapView?.isMyLocationEnabled = true
        tableView.tableHeaderView = mapView;
        
        setCorrectPathButton.addTarget(self, action: #selector(setCorrectPathTapped(sender:)), for: .touchUpInside)
        view.addSubview(setCorrectPathButton)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        guard let tableView = self.tableView else { return }
        
        NSLayoutConstraint.activate(
            [
                setCorrectPathButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15.0),
                setCorrectPathButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15.0),
                setCorrectPathButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15.0),
                setCorrectPathButton.heightAnchor.constraint(equalToConstant: 50.0),
            
                tableView.topAnchor.constraint(equalTo: setCorrectPathButton.bottomAnchor,constant: 20),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
        )
    }
}

