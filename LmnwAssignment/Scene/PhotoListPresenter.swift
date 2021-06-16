import UIKit

protocol PhotoListPresentationLogic {
    func presentPhoto(response: PhotoList.GetPhoto.Response)
}

class PhotoListPresenter: PhotoListPresentationLogic {
    weak var viewController: PhotoListDisplayLogic?
    
    func presentPhoto(response: PhotoList.GetPhoto.Response) {
        let photoDisplayList: [PhotoDisplay] =
            response.photoResp.photos?.map({ item -> PhotoDisplay in
                let voteCountDisplay =
                    NumberFormatComponent().formatDecimal(
                    number: item.positiveVotesCount)
                
                let photoDisplay = PhotoDisplay(
                    imageUrl: item.imageUrl.first ?? "",
                    positiveVotes: voteCountDisplay,
                    description: item.description)
                return photoDisplay
            }) ?? []
        let viewModel = PhotoList.GetPhoto.ViewModel(photoList: photoDisplayList)
        viewController?.displayPhoto(viewModel: viewModel)
    }
}
