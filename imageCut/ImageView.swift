//
//  ImageView.swift
//  imageCut
//
//  Created by andyhaz on 3/26/23.
//

import Foundation
import AppKit

class imageView:NSView{
    
    weak var delegate:locationDelaget?

    override func draw(_ dirtyRect: NSRect) {
       // NSColor.red.set()    
        dirtyRect.fill()
    }
//mouse down
    override func mouseDown(with event: NSEvent) {
        let mouseLocation = event.locationInWindow
        let frameLoc = self.frame.origin
        let currentPoint =  CGPoint(x:mouseLocation.x - frameLoc.x,
                                   y:mouseLocation.y - frameLoc.y)
        self.delegate?.pointerLocation(locX:Int(currentPoint.x), locY: Int(currentPoint.y))
        print("mouseLocation:\(mouseLocation)")
        
    }
//displat new image
    func displayNewImage(imageName:NSImage,x:Int,y:Int,w:Int,h:Int){
        let myImageView:NSImageView = NSImageView()
        myImageView.frame.size.width = CGFloat(w)//Image.size.width
        myImageView.frame.size.height = CGFloat(h)//Image.size.height
        myImageView.frame.origin.x = 0
        myImageView.frame.origin.y = 0
        myImageView.image = imageName
        
        self.addSubview(myImageView)
        
        needsDisplay = true
    }
//copy image
    func copyBox(x:Int,y:Int,w:Int,h:Int)->NSImage{
        print("copyBox")
          let copyImageBox = NSRect(x:x, y: y, width:w, height:h)
          let rep: NSBitmapImageRep! = self.bitmapImageRepForCachingDisplay(in:copyImageBox)
        ///   rep.draw(in: NSRect(origin: .zero, size: CGSize(width: 300, height: 300)))
          self.cacheDisplay(in:copyImageBox, to: rep!)
          let imageData: Data! = rep!.representation(using: NSBitmapImageRep.FileType.png, properties: [:])
          //take image and past in
          let newImage = NSImage(data: imageData)
          return newImage!
    }
//draw squer
    func drawBox(x:Int,y:Int,w:Int,h:Int){
        print("drawBox")
         let frame = CGRect(x:x, y:y, width: w, height: h)
       //  let line = Line(frame: frame)
         let Rect = Rect(frame: frame)
         self.addSubview(Rect)
        needsDisplay = true
    }
//loaduimage
    func loadImageView(x:Int, y:Int) {
        /* Create an image view */
        if let Image = NSImage(named:"grsLogo.png"){
            let myImageView:NSImageView = NSImageView()
            myImageView.frame.size.width = CGFloat(400)//Image.size.width
            myImageView.frame.size.height = CGFloat(400)//Image.size.height
            myImageView.frame.origin.x = CGFloat(x)
            myImageView.frame.origin.y = CGFloat(y)
            myImageView.image = Image

            self.addSubview(myImageView)

            needsDisplay = true
        } else {
            print("error")
        }
    }//end
    //clear 
    func clearView(){
        let theSubviews : Array<NSView> = self.subviews as Array<NSView>
        for view in theSubviews {
            view.removeFromSuperview()
        }
       // self.removeFromSuperview()
    }
}
class Rect: NSView {
    override func draw(_ dirtyRect: NSRect) {
        NSColor.red.set()
        let myRect = NSBezierPath(rect:dirtyRect )//NSRect(x:0, y:0, width: 200, height: 200)
        myRect.lineWidth = 2
        myRect.stroke()
      /*  let maskPath = NSBezierPath(
            roundedRect: view.bounds,
            byRoundingCorners: corners,
            cornerRadii: cornerRadii
        )*/
    }
}

class Line: NSView {
    override func draw(_ dirtyRect: NSRect) {
        NSColor.red.set()
        let myPath = NSBezierPath()
        myPath.move(to: CGPoint(x: 20, y: 20))
        myPath.line(to: CGPoint(x: 100, y: 100))
        myPath.lineWidth = 2
        myPath.stroke()
    }
}
/*   let copyImage = NSRect(x:0, y: 0, width: 200, height: 200)
   let rep: NSBitmapImageRep! = self.bitmapImageRepForCachingDisplay(in:copyImage)
 ///   rep.draw(in: NSRect(origin: .zero, size: CGSize(width: 300, height: 300)))
   self.cacheDisplay(in:copyImage, to: rep!)
   let imageData: Data! = rep!.representation(using: NSBitmapImageRep.FileType.png, properties: [:])
   //take image and past in
   if let newImage = NSImage(data: imageData){
       let myImageView:NSImageView = NSImageView()
       myImageView.frame.size.width = CGFloat(200)//Image.size.width
       myImageView.frame.size.height = CGFloat(200)//Image.size.height
       myImageView.frame.origin.x = 200
       myImageView.frame.origin.y = 0
       myImageView.image = newImage
       
       self.addSubview(myImageView)
       
       needsDisplay = true
   }*/
