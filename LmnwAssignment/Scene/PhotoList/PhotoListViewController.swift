import UIKit
import RxSwift
import RxCocoa

protocol PhotoListDisplayLogic: class {
    func displayPhoto(viewModel: PhotoList.GetPhoto.ViewModel)
    func displayError(error: ServiceError)
}

class PhotoListViewController: BaseViewController, PhotoListDisplayLogic {
    var interactor: PhotoListBusinessLogic?
    var router: (NSObjectProtocol & PhotoListRoutingLogic & PhotoListDataPassing)?
    
    var photoDisplayList: [PhotoDisplay] = []
    var isLastPage = false
    var refreshControl = UIRefreshControl()
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = PhotoListInteractor()
        let presenter = PhotoListPresenter()
        let router = PhotoListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getPhoto(isRefresh: true)
    }
    
    func setupTableView() {
        refreshControl.attributedTitle = NSAttributedString(string: "Refresh")
        refreshControl.rx.controlEvent(.valueChanged)
            .bind { [weak self] _ in
                self?.getPhoto(isRefresh: true)
            }
        .disposed(by: disposeBag)
        tableView.addSubview(refreshControl)
    }
    
    func getPhoto(isRefresh: Bool) {
        let request = PhotoList.GetPhoto.Request(
            isRefresh: isRefresh,
            feature: "popular")
        interactor?.getPhoto(request: request)
    }
    
    func displayPhoto(viewModel: PhotoList.GetPhoto.ViewModel) {
        if refreshControl.isRefreshing {
            self.photoDisplayList = []
            refreshControl.endRefreshing()
        }
        self.photoDisplayList.append(contentsOf: viewModel.photoList)
        self.tableView.reloadData()
    }
    
    func displayError(error: ServiceError) {
        refreshControl.endRefreshing()
        self.displayMessage(
            title: error.getTitle(),
            message: error.getMessage()
        )
    }
}

extension PhotoListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photoDisplayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "photoCell") as? PhotoCell else {
            return UITableViewCell()
        }
        cell.setupCellData(data: self.photoDisplayList[indexPath.row])
        
        if indexPath.row == photoDisplayList.count - 1 && !isLastPage {
            print("photoList Count",photoDisplayList.count)
            getPhoto(isRefresh: false)
        }
        return cell
    }
}
