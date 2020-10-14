//
//  ViewController.swift
//  HotelEercise
//
//  Created by Cleís Aurora Pereira on 09/10/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkoutDatePicker: UIDatePicker!
    @IBOutlet weak var isVipSwitch: UISwitch!
    @IBOutlet weak var bestHotelNameLabel: UILabel!


    private let bookSystem = BookSystem()
    
    @IBAction func bestHotelButtonTapped() {
        let customerType = isVipSwitch.isOn ? CustomerType.vip : CustomerType.regular
        let bestHotel = bookSystem.findBestHotel(checkInDate: checkInDatePicker.date, checkOutDate: checkoutDatePicker.date, customerType: customerType)

        bestHotelNameLabel.text = bestHotel.name
    }


}

