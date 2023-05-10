//
//  ViewController.swift
//  HighOcean
//
//  Created by jeongyun on 2023/05/09.
//

import Foundation

class ViewController {
    func viewDidLoad(){
        
        let urlString = "https://mc2highocean-default-rtdb.firebaseio.com/photoCard.json"
        let url = URL(string: urlString)
        
        guard url != nil else{
                    return
                }
                
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!){(data, response, error) in
            if error == nil && data != nil{
                let decoder = JSONDecoder()
                do{
                    let cardData = try decoder.decode(Card.self, from: data!)
                    print(cardData)
                }
                catch{
                    print("error : parsing")
                }
            }
        }
    }
}
