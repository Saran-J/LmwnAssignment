import UIKit
import Kingfisher

class PhotoCell: UITableViewCell {
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCellData(data: PhotoDisplay) {
        let processor = DownsamplingImageProcessor(size: photoView.bounds.size)
        let url = URL(string: data.imageUrl)
        photoView.kf.setImage(
            with: url,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        
        titleLabel.text = data.name
        descriptionLabel.text = data.description
        voteCountLabel.text = data.positiveVotes
    }
}
