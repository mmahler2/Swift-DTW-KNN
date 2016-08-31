//
//  ViewController.swift
//  KNNDTW_TEST
//
//  Created by Michael Mahler on 8/28/16.
//  Copyright © 2016 UARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
        var training_samples: [knn_curve_label_pair] = [knn_curve_label_pair]()
        
        
        //some are dogs
        training_samples.append(knn_curve_label_pair(curve: [1,2,3,4,5], label: "dog"))
        training_samples.append(knn_curve_label_pair(curve: [1,3,4,6,7], label: "dog"))
        training_samples.append(knn_curve_label_pair(curve: [1,2,3,6,7], label: "dog"))
        
        //some are cats
        training_samples.append(knn_curve_label_pair(curve: [1,2,2,2,1], label: "cat"))
        training_samples.append(knn_curve_label_pair(curve: [1,1,0,1,0], label: "cat"))
        training_samples.append(knn_curve_label_pair(curve: [2,0,1,2,0], label: "cat"))
        
        
        
        let knn: KNNDTW = KNNDTW()
        
        knn.configure(3, max_warp: 0) //max_warp isn't implemented yet
        
        knn.train(training_samples)
        
        let prediction: knn_certainty_label_pair = knn.predict([1.0, 1.75, 2.0, 2.5, 2.0])
        
        print("predicted " + prediction.label, "with ", prediction.probability*100,"% certainty")
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

