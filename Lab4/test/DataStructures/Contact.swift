//
//  Contact.swift
//  test
//
//  Created by Pavel Bakharuev on 10.10.2023.
//

import Foundation
import UIKit

struct Contact {
    var name : String
    var number : String
    var image : UIImage?
}

let contacts: [Contact] = [
    Contact(name: "Pavel Baharuev", number: "8002281337", image: UIImage(named: "pavel")),
    Contact(name: "Alice Johnson", number: "1234567890", image: UIImage(named: "alice")),
    Contact(name: "Bob Smith", number: "9876543210", image: UIImage(named: "noimage")),
    Contact(name: "Elena Petrova", number: "5551234567", image: UIImage(named: "noimage")),
    Contact(name: "John Doe", number: "4447778888", image: UIImage(named: "noimage")),
    Contact(name: "Olga Ivanova", number: "9990001111", image: UIImage(named: "noimage")),
    Contact(name: "Michael Jackson", number: "6666666666", image: UIImage(named: "noimage")),
    Contact(name: "Anna Kim", number: "3333333333", image: UIImage(named: "noimage")),
    Contact(name: "David Lee", number: "2222222222", image: UIImage(named: "noimage")),
    Contact(name: "Marta Lopez", number: "1111111111", image: UIImage(named: "noimage"))
]
