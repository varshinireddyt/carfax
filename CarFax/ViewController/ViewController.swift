//
//  ViewController.swift
//  CarFax
//
//  Created by Varshini Thatiparthi on 7/15/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let sessionProvider = SessionProvider()
    var car: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Car Listings"
        
        tableView.dataSource = self
        tableView.isHidden = true
        
        // we can move this block to viewmodal
        sessionProvider.request(API.requestCarListings.url(), type: Car.self) { [weak self] (car, error) in
            self?.car = car
            
            DispatchQueue.main.async {
                self?.tableView.isHidden.toggle()
                self?.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        car?.listings.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarDetailCell.identifier, for: indexPath) as? CarDetailCell,
              let detail = car?.listings[indexPath.row]
        else {
            return UITableViewCell()
        }
        
        cell.configure(detail.images.large.first ?? "")
        cell.configureTitle("\(detail.year)", detail.make, detail.model)
        cell.configureDetails(detail.currentPrice.localeCurrency, detail.mileage.roundedWithAbbreviations, "\(detail.dealer.city), \(detail.dealer.state)")
        cell.configure(phone: detail.dealer.phone)
        return cell
    }
}


