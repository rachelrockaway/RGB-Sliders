// Comment
//
//  ViewController.swift
//  RGB Sliders
//
//  Created by Rachel Stevenson on 3/24/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorSquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorSquare.layer.borderColor = UIColor.blackColor().CGColor
        colorSquare.layer.borderWidth = 1
        
        let defaults = NSUserDefaults.standardUserDefaults()
        redSlider.value = defaults.floatForKey("red")
        greenSlider.value = defaults.floatForKey("green")
        blueSlider.value = defaults.floatForKey("blue")
        
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        
        
        colorSquare.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "openColor") {
            let newViewController = segue.destinationViewController as UIViewController
            newViewController.view.backgroundColor = colorSquare.backgroundColor
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateBackgroudColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        colorSquare.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setFloat(redSlider.value, forKey: "red")
        defaults.setFloat(greenSlider.value, forKey: "green")
        defaults.setFloat(blueSlider.value, forKey: "blue")
        defaults.synchronize()
        

    }

}

