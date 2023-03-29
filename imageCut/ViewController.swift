//
//  ViewController.swift
//  imageCut
//
//  Created by andyhaz on 3/26/23.
//

import Cocoa

//set procall
protocol locationDelaget:AnyObject{
    func pointerLocation(locX:Int,locY:Int)
}

class ViewController: NSViewController,locationDelaget {
    
    var posX:Int = 0
    var posY:Int = 0
    var boxWidth:Int = 200
    var boxHeight:Int = 200

    @IBOutlet weak var imageView: imageView!
    @IBOutlet weak var perViewq: preView!
    
    func pointerLocation(locX: Int, locY: Int) {
        print("location:\(Int(locX))\(Int(locY))")
        posX = locX
        posY = locY
       
        imageView.clearView()
        imageView.loadImageView(x:0, y:0)
        imageView.drawBox(x:locX, y:locY, w: boxWidth, h: boxHeight)
        //
        let pv:NSImage = imageView.copyBox(x:locX, y:locY, w: boxWidth, h: boxHeight)
        perViewq.displayNewImage(imageName: pv, x: locX, y: locY, w: boxWidth, h: boxHeight)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.delegate = self
        self.view.wantsLayer = true

        imageView.loadImageView(x:0, y:0)
        imageView.drawBox(x:0, y: 0, w: 200, h: 200)
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

