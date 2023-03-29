//
//  preView.swift
//  imageCut
//
//  Created by andyhaz on 3/26/23.
//

import Foundation
import AppKit

class preView:NSView{
    
    override func draw(_ dirtyRect: NSRect) {
       /* let Image = NSImage(named:"grsLogo.png")
        let myImageView:NSImageView = NSImageView()
            myImageView.frame.size.width = CGFloat(100)//Image.size.width
            myImageView.frame.size.height = CGFloat(100)//Image.size.height
            myImageView.frame.origin.x = 0
            myImageView.frame.origin.y = 0
            myImageView.image = Image

            self.addSubview(myImageView)
        */
        dirtyRect.fill()
    }
    
    //displat new image
    func displayNewImage(imageName:NSImage,x:Int,y:Int,w:Int,h:Int){
            let myImageView:NSImageView = NSImageView()
            myImageView.frame.size.width = CGFloat(100)//Image.size.width
            myImageView.frame.size.height = CGFloat(100)//Image.size.height
            myImageView.frame.origin.x = 0
            myImageView.frame.origin.y = 0
            myImageView.image = imageName
            
            self.addSubview(myImageView)
            
            needsDisplay = true
        }
}
