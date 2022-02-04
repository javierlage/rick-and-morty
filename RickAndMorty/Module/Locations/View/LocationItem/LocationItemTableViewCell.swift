//
//  LocationItemTableViewCell.swift
//  RickAndMorty
//
//  Created by Javier Lage on 4/2/22.
//

import UIKit

class LocationItemTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var residentsLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dimensionLabel: UILabel!
    @IBOutlet weak var itemView: UIView!
    
    private var locationItem: Location!
    private var delegate: LocationItemDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(item: Location, itemDelegate: LocationItemDelegate) {
        locationItem = item
        delegate = itemDelegate
        
        nameLabel.text = item.name
        var residents = "0"
        if let count = item.residents?.count.description {
            residents = count
        }
        residentsLabel.text = residents + " resident(s)"
        typeLabel.text = item.type
        dimensionLabel.text = item.dimension
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onItemClicked))
        itemView.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func onItemClicked(_ sender: AnyObject) {
        // Do something with event...
        delegate.onLocationItemClicked(locationItem)
    }
}
