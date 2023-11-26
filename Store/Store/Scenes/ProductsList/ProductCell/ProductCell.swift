//
//  ProductCell.swift
//  Store
//
//  Created by Baramidze on 25.11.23.
//

import UIKit

protocol ProductCellDelegate: AnyObject {
    func removeProduct(for cell: ProductCell)
    func addProduct(for cell: ProductCell)
}

final class ProductCell: UITableViewCell {
    
    //MARK: - Private IBOutlets
    @IBOutlet private weak var prodImageView: UIImageView!
    @IBOutlet private weak var prodTitleLbl: UILabel!
    @IBOutlet private weak var stockLbl: UILabel!
    @IBOutlet private weak var descrLbl: UILabel!
    @IBOutlet private weak var priceLbl: UILabel!
    @IBOutlet private weak var selectedQuantityLbl: UILabel!
    @IBOutlet private weak var quantityModifierView: UIView!
    
    weak var delegate: ProductCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        prodImageView.image = nil
    }
    
    //MARK: - Private Methods
    private func setupUI(){
        quantityModifierView.layer.cornerRadius = 5
        quantityModifierView.layer.borderWidth = 1
        quantityModifierView.layer.borderColor = UIColor.red.cgColor
    }
    
    func reload(with product: ProductModel) {
        //TODO: reload images are not correct when reloading list after changing quantity
        setImage(from: product.thumbnail)
        prodTitleLbl.text = product.title
        stockLbl.text = "\(product.stock)"
        descrLbl.text = "\(product.description)"
        priceLbl.text = "\(product.price)$"
        selectedQuantityLbl.text = "\(product.selectedAmount ?? 0)"
    }
    
    private func setImage(from url: String) {
        NetworkManager.shared.downloadImage(from: url) { [weak self] image in
            DispatchQueue.main.async {
                self?.prodImageView.image = image
            }
        }
    }
    
    @IBAction func addProduct(_ sender: Any) {
        delegate?.addProduct(for: self)
    }
    
    @IBAction func removeProduct(_ sender: UIButton) {
        delegate?.removeProduct(for: self)
    }
}
