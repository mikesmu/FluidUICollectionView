//
//  NoteCollectionViewCell.swift
//  FluidUICollectionView
//
//  Created by Michal Smulski on 05.07.2014.
//
//

import UIKit

class NoteCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet var noteLabel : UILabel
	
	init(coder aDecoder: NSCoder!)
	{
		super.init(coder: aDecoder)
	}

    init(frame: CGRect)
	{
        super.init(frame: frame)
        // Initialization code
    }
}
