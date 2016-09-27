//
//  ViewController.swift
//  Album
//
//  Created by Komari Herring on 9/27/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class AlbumTableViewController: UITableViewController
{
    
    var dataProvider: AlbumDataProviderProtocol?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        title = "Beatles Albums"
        
        
        dataProvider = AlbumDataProvider()
        if let dataProv = dataProvider as? AlbumDataProvider
        {
            tableView.dataSource = dataProvider
            dataProv.setAndRegisterNib(tableView: tableView)
        }
        
        
        
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableView Data Source
    /*
     override func numberOfSections(in tableView: UITableView) -> Int
     {
     return 1
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
     {
     return albums.count
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {
     let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumCell
     
     let album = albums[indexPath.row]
     
     // cell.imageView?.image = UIImage(named: "Blank44")
     //  cell.artworkImageView.image = UIImage(named: "Blank66")
     cell.artworkImageView.image = nil
     cell.titleLabel?.text = album.title
     cell.priceLabel.text = album.price
     
     cell.activityView.startAnimating()
     
     let request = URLRequest(url: URL(string: album.thumbnailImageURL)!)
     URLSession.shared.dataTask(with: request, completionHandler: {
     data, response, error in
     if error == nil
     {
     let image = UIImage(data: data!)
     let queue = DispatchQueue.main
     queue.async {
     if let cellToUpdate = tableView.cellForRow(at: indexPath) as? AlbumCell
     {
     cellToUpdate.activityView.stopAnimating()
     cellToUpdate.artworkImageView.image = image
     }
     }
     }
     else
     {
     print("Error \(error?.localizedDescription)")
     }
     }).resume()
     
     
     
     return cell
     }
     */
    //MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return CGFloat(66.0)
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let destVC =  AlbumDetailViewController()
        if let dataProvider = tableView.dataSource as? AlbumDataProvider
        {
            let album = dataProvider.albums[indexPath.row]
            destVC.anAlbum = album
        }
        navigationController?.pushViewController(destVC, animated: true)
        
        //     let detailAlbum = albums[indexPath.row]
        //     destVC.anAlbum = detailAlbum
    }
    
    
    
    // MARK: - APIController delegate
    /*
     func didReceiveAPIResults(_ results: [Any])
     {
     let queue = DispatchQueue.main
     queue.async {
     self.albums = Album.albumsWithJSON(results)
     self.tableView.reloadData()
     UIApplication.shared.isNetworkActivityIndicatorVisible = false
     }
     }
     */
}
