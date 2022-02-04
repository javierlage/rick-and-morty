//
//  EpisodeItemTableViewCell.swift
//  RickAndMorty
//
//  Created by Javier Lage on 4/2/22.
//

import UIKit

class EpisodeItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var itemView: UIView!
    
    private var episodeItem: Episode!
    private var delegate: EpisodeItemDelegate!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bind(item: Episode, itemDelegate: EpisodeItemDelegate) {
        episodeItem = item
        delegate = itemDelegate
        
        nameLabel.text = item.name
        episodeLabel.text = item.episode
        airDateLabel.text = item.air_date
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onItemClicked))
        itemView.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func onItemClicked(_ sender: AnyObject) {
        // Do something with event...
        delegate.onEpisodeItemClicked(episodeItem)
    }
}
