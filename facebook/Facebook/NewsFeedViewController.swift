//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!

    @IBOutlet weak var weddingImage01: UIImageView!
    @IBOutlet weak var weddingImage02: UIImageView!
    @IBOutlet weak var weddingImage03: UIImageView!
    @IBOutlet weak var weddingImage04: UIImageView!
    @IBOutlet weak var weddingImage05: UIImageView!
    
    var selectedImageView: UIImageView!
    var fadeTransition: FadeTransition!
    var lightboxTransition: LightboxTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSize(width: 320, height: feedImageView.image!.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    @IBAction func didTapImage(_ sender: UITapGestureRecognizer) {
        
        selectedImageView = sender.view as! UIImageView
        
        performSegue(withIdentifier: "showImageSegue", sender: nil)
    }
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let photoViewController = segue.destination as! PhotoViewController

        photoViewController.image = selectedImageView.image
        
        photoViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        lightboxTransition = LightboxTransition()
        photoViewController.transitioningDelegate = lightboxTransition
        lightboxTransition.duration = 00.3
        
        
        // fadeTransition = FadeTransition()
        // photoViewController.transitioningDelegate = fadeTransition
        // fadeTransition.duration = 00.3
    }

}
