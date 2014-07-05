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
	var items : Array<String> = Array(count: 10, repeatedValue: "Dupcia pupcia")
	
//	init(coder aDecoder: NSCoder!)
//	{
//		super.init(coder : aDecoder)
//		self.items =
//	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int
	{
		return self.items.count;
	}
	
	// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
	func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell!
	{
		var cell = collectionView.dequeueReusableCellWithReuseIdentifier("note:cell", forIndexPath: nil) as NoteCollectionViewCell
		
		cell.noteLabel.text = self.items[indexPath.row]
		
		return cell
	}

}

