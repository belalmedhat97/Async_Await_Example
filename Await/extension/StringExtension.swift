//
//  StringExtension.swift
//  Async+Await
//
//  Created by belal medhat on 03/06/2022.
//

import UIKit
extension UIImageView{
func convertUrlToImage(url:String){
    let url = URL(string: url)
    DispatchQueue.global().async {
        if let data = try? Data(contentsOf: url!) {
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }

    }
}
}
