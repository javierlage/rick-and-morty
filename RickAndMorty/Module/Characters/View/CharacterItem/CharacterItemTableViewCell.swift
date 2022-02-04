//
//  CharacterItemTableViewCell.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import UIKit
import Kingfisher

class CharacterItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var episodesLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var itemView: UIView!
    
    private var characterItem: Character!
    private var delegate: CharacterItemDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(item: Character, itemDelegate: CharacterItemDelegate) {
        characterItem = item
        delegate = itemDelegate
        characterImageView.kf.setImage(with: URL(string: item.image), placeholder: UIImage(named: "Default"))
        nameLabel.text = item.name
        var episodes = "0"
        if let count = item.episode?.count {
            episodes = count.description
        }
        episodesLabel.text = episodes + " Episode(s)"
        originLabel.text = item.origin.name
        statusLabel.text = item.status + " - " + item.species
        switch item.status {
        case "Alive":
            statusView.backgroundColor = .green
        case "Dead":
            statusView.backgroundColor = .red
        default:
            statusView.backgroundColor = .darkGray
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onItemClicked))
        itemView.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func onItemClicked(_ sender: AnyObject) {
        // Do something with event...
        delegate.onCharacterItemClicked(characterItem)
    }

}
