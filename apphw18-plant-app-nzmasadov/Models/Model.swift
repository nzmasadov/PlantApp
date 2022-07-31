//
//  Model.swift
//  apphw18-plant-app-nzmasadov
//
//  Created by Nazim Asadov on 30.07.22.
//

import Foundation
import UIKit

struct Plants {
    var name: String?
    var image: UIImage?
}

struct Categories {
    var backgroundColor: UIColor?
    var title: String?
    var image: UIImage?
    var amount: String?
}

struct Tutorials {
    var title: String?
    var subtitle: String?
    var backImg: UIImage?
    var videoUrl: URL?
}

struct Item {
    var leftText: String?
    var rightText: String?
}
