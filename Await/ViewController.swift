//
//  ViewController.swift
//  Await
//
//  Created by belal medhat on 02/06/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var DogImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        DogImg.contentMode = .scaleAspectFit
        indicator.isHidden = true
        indicator.hidesWhenStopped = true
        // Do any additional setup after loading the view.
    }

    @IBAction func getDogBtn(_ sender: UIButton) {
        indicator.isHidden = false
        indicator.startAnimating()
        // 1 - add task to handle async code
        Task{
        do{
        // 2 - await for netwrok call to return with results
        /// Here you can do multiple call api that depends on eachother like
            /// (await func getImg())
            /// (await func sendimg())
            /// ... etc
        let result = try await NetworkCaller.request()
            print(result)
            switch result {
            case (let response,nil,nil):
                DogImg.convertUrlToImage(url: response?.message ?? "")
                indicator.stopAnimating()
            break
            case (nil,let errorServer,nil):
                print(errorServer?.message ?? "")
                indicator.stopAnimating()

            break
            default:
            print("error found in decode")
                indicator.stopAnimating()

                
            }
        }catch{
        print(error)
            indicator.stopAnimating()

        }
        }
    }

}

