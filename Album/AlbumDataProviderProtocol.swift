//
//  AlbumDataProviderProtocol.swift
//  Album
//
//  Created by Komari Herring on 9/27/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation
import UIKit

protocol AlbumDataProviderProtocol: UITableViewDataSource, APIControllerProtocol
{
    var albums: [Album] { get }
    var api: APIController! { get }
    weak var tableView: UITableView! { get set }
}
