//
//  RhinoCollectionViewController.swift
//  Rhino
//
//  Created by Calista Nguyen on 2/20/22.
//

import UIKit

private let reuseIdentifier = "rhinoCell"

class RhinoCollectionViewController: UICollectionViewController {

    var rhinoImages = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...11 {
            rhinoImages.append("rhino\(i)")
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
        collectionView.collectionViewLayout = generateLayout()
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return rhinoImages.count
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RhinoCollectionViewCell
    
        // Configure the cell
        let image = UIImage(named: rhinoImages[indexPath.row])
        cell.imageView.image = image
        return cell
    }
    
    //MARK: Layout
    func generateLayout() -> UICollectionViewLayout {
        // create item size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        // create an item layout
        let photoItem = NSCollectionLayoutItem(layoutSize: itemSize)
        photoItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)
        // create group size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.2))
        // create a group arranged horizontally
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: photoItem, count: 3)
        // create a section with one group
        let section = NSCollectionLayoutSection(group: group)
        // create a header
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        // add the header to the section
        section.boundarySupplementaryItems = [sectionHeader]
        // create and return the layout object
        let layout = UICollectionViewCompositionalLayout(section: section)
    
        return layout
    }

    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    var header = CollectionSupplementaryView()
    if kind == UICollectionView.elementKindSectionHeader{
    header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! CollectionSupplementaryView
        header.headerLabel.text = "Rhino Gallery" }
    return header }
    // MARK: UICollectionViewDelegate
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { if segue.identifier == "showDetail"{
    let indexPath = collectionView?.indexPath(for: sender as! RhinoCollectionViewCell)
    let detailVC = segue.destination as! DetailViewController
    detailVC.imageName = rhinoImages[(indexPath?.row)!] }
    }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
