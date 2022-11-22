//
//  CustomCell.swift
//  UICollectionViewTest
//
//  Created by Mangdi on 2022/11/14.
//

import UIKit

class CustomCell: UICollectionViewListCell {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var discountedPrice: UILabel!
    @IBOutlet weak var stock: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        thumbnailImage.image = nil
        name.text = nil
        price.text = nil
        discountedPrice.text = nil
        stock.text = nil
    }
    
    func configureCell(imageSource: String, name: String, price: Int, discountedPrice: Int, stock: Int) {
        let imageUrl = URL(string: imageSource)!
        do {
            let imageData = try Data(contentsOf: imageUrl)
            self.thumbnailImage.image = UIImage(data: imageData)
        } catch {
            print(error.localizedDescription)
        }
        self.name.text = name
        self.price.text = String(price)
        self.discountedPrice.text = String(discountedPrice)
        self.stock.text = String(stock)
    }

}
