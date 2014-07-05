//
//  ViewController.swift
//  FluidUICollectionView
//
//  Created by Michal Smulski on 05.07.2014.
//
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{                   
	@IBOutlet var collectionView : UICollectionView
	var items : Array<String> = DataSourceGenerator.collectionContent()
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int
	{
		return self.items.count
	}
	
	// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
	func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell!
	{
		var cell = collectionView.dequeueReusableCellWithReuseIdentifier("note:cell", forIndexPath: indexPath) as NoteCollectionViewCell
		cell.noteLabel.text = self.items[indexPath.row]
		cell.backgroundColor = UIColor(hue: CGFloat(rand() % 100) / 100, saturation: 1, brightness: 1, alpha: 1)
		return cell
	}
    
    
}

