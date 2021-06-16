import UIKit

@objc protocol PhotoListRoutingLogic {
}

protocol PhotoListDataPassing {
    var dataStore: PhotoListDataStore? { get }
}

class PhotoListRouter: NSObject, PhotoListRoutingLogic, PhotoListDataPassing {
    weak var viewController: PhotoListViewController?
    var dataStore: PhotoListDataStore?
}
