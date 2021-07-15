//
//  CarDetailCell.swift
//  CarFax
//
//  Created by Varshini Thatiparthi on 7/15/21.
//

import UIKit

class CarDetailCell: UITableViewCell {
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var milesLocationLabel: UILabel!
    @IBOutlet weak var phoneButton: UIButton!
    
    private var phoneNumber = ""
    
    static var identifier: String {
        "\(Self.self)"
    }
    
    func configure(_ url: String) {
        carImageView.getImage(from: url)
    }
    
    func configureTitle(_ year: String, _ make: String, _ model: String) {
        titleLabel.text = [year, make, model].joined(separator: " ")
    }
    
    func configureDetails(_ price: String, _ mileage: String, _ location: String) {
        priceLabel?.text = price
        milesLocationLabel.text = " | " + [mileage, location].joined(separator: " | ")
    }
    
    func configure(phone: String) {
        phoneNumber = phone
        phoneButton.setTitle(phone.convertToInternationalFormat(), for: .normal)
    }
    
    @IBAction func didTappedOnPhone(_ sender: Any) {
        if let url = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
