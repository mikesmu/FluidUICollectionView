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
    var movingItemIndex: Int?
    var deltaPoint: CGPoint?
    
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
        
//        if !cell.gestureRecognizers.isEmpty {
//            for gestureRec: AnyObject in cell.gestureRecognizers {
//                cell.removeGestureRecognizer(gestureRec as UIGestureRecognizer)
//            }
//        }
        
        let panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: Selector("pan:"))
        cell.addGestureRecognizer(panGesture)
        
		return cell
	}
    
    func pan(gesture: UIPanGestureRecognizer)
    {
        if gesture.state == UIGestureRecognizerState.Began {
            let indexPath = collectionView.indexPathForItemAtPoint(gesture.locationInView(self.collectionView))
            if indexPath != nil {
                movingItemIndex = indexPath.row
                deltaPoint = gesture.locationInView(gesture.view)
                gesture.view.layer.zPosition = 100
            }
        }
        
        if gesture.state == UIGestureRecognizerState.Changed {
            let point: CGPoint = gesture.locationInView(self.collectionView)
            
            gesture.view.frame.origin = CGPointMake(
                point.x - deltaPoint!.x,
                point.y - deltaPoint!.y)
        }
        
        if gesture.state == UIGestureRecognizerState.Ended
        {
            let indexPath = collectionView.indexPathForItemAtPoint(gesture.locationInView(self.collectionView))

            if indexPath != nil {
                collectionView.performBatchUpdates({() -> Void in
                    let switchToElementIndex = indexPath.row
                    
                        if switchToElementIndex != self.movingItemIndex {
                            let movingElement = self.items[self.movingItemIndex!]
                            let switchWithElement = self.items[switchToElementIndex]
                        
                            self.collectionView.moveItemAtIndexPath(NSIndexPath(forRow: self.movingItemIndex!, inSection: 0), toIndexPath: NSIndexPath(forRow: switchToElementIndex, inSection: 0))
                            
                            self.items[switchToElementIndex] = movingElement
                            self.items[self.movingItemIndex!] = switchWithElement
                        }
                        else {
                            self.collectionView.reloadSections(NSIndexSet(index: 0))
                        }
                    }, completion: {(Bool) -> Void in
                        self.movingItemIndex = nil
                        gesture.view.layer.zPosition = 0
                    })
                
            }
            else {
                self.collectionView.reloadSections(NSIndexSet(index: 0))
            }
        }
    }
    
}

