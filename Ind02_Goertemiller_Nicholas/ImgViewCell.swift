//
//  ImgViewCell.swift
//  Ind02_Goertemiller_Nicholas
//
//  Created by Nicholas Goertemiller on 2/23/22.
//

import UIKit

class ImgViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                border.isHidden = false
            } else {
                border.isHidden = true
            }
        }
    }
    
    func setupViews() {
        self.addSubview(ImageView)
        ImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive=true
        ImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive=true
        ImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive=true
        ImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive=true
        
        self.addSubview(border)
        border.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive=true
        border.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive=true
        border.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive=true
        border.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive=true
        border.isHidden=true
    }
    
    let ImageView: UIImageView = {
        let v=UIImageView()
        v.image = #imageLiteral(resourceName: "pexels-victor-freitas-703014.png")
        v.contentMode = .scaleToFill
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    let border: UIView = {
        let v=UIView()
        v.backgroundColor = UIColor.clear
        v.layer.borderColor = UIColor(red: 100/255, green:100/255, blue: 0/255, alpha: 0.8).cgColor
        v.layer.borderWidth  = 8
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
