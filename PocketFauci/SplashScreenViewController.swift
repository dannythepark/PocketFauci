//
//  SplashScreenViewController.swift
//  PocketFauci
//
//  Created by Danny Park on 4/19/22.
//

import UIKit
import AVFoundation

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var appNameLabel: UILabel!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(name: "corona")
        imageView.frame.origin.y = self.view.frame.height
        appNameLabel.alpha = 0.0
        
        UIView.animate(withDuration: 1.0, animations: {self.imageView.frame.origin.y = 0})
        
        UIView.animate(withDuration: 1.0, delay: 1.0, animations: {self.appNameLabel.alpha = 1.0})

    }
    
    func playSound(name: String){
        if let sound = NSDataAsset(name: name) {
            do{
                audioPlayer = try AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch{
                print ("Error")
            }
        } else {
            print ("Error")
        }
    }
    

    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "ShowTableView", sender: sender)
    }
    
}
