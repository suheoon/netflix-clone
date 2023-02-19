//
//  TitleCollectionViewCell.swift
//  NetflixClone
//
//  Created by Suheon Song on 2023/02/17.
//

import UIKit
import SDWebImage

final class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.posterImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configuer(with model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model)") else {
            return
        }
        // SDWebImage라이브러리를 사용해서 캐싱을 해서 이미지 로드
        posterImageView.sd_setImage(with: url)
        // 캐싱은 없지만 url로 이미지를 요청하는 코드
//        DispatchQueue.global().async {
//            guard let data = try? Data(contentsOf: url) else { return }
//            DispatchQueue.main.async {
//                self.posterImageView.image = UIImage(data: data)
//            }
//        }
    }
    
}
