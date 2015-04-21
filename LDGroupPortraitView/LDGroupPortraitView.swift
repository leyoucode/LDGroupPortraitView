//
//  DesignableView.swift
//  demo
//
//  Created by 刘伟 on 4/21/15.
//  Copyright (c) 2015 刘伟. All rights reserved.
//

import UIKit

func randomColor()->UIColor
{
    var hue:CGFloat = ( CGFloat(arc4random()) % 256 / 256.0 ); //0.0 to 1.0
    var saturation:CGFloat = ( CGFloat(arc4random()) % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    var brightness:CGFloat = ( CGFloat(arc4random()) % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
}

@IBDesignable class LDGroupPortraitView: UIView {

    private var imageViews = [UIImageView]()
    
    var selfWidth:CGFloat {
        return self.frame.width
    }
    
    var selfHeight:CGFloat {
        return self.frame.height
    }
    
    var imageIconWidth: CGFloat {
        if self.imageCount == 1
        {
            return selfWidth
        }
        else if self.imageCount >= 2 && self.imageCount <= 4
        {
            return ((selfWidth - (marginSpace * 3)) / 2)
        }
        else
        {
            return ((selfWidth - (marginSpace * 4)) / 3)
        }
    }
    
    var imageIconHeight: CGFloat {
        if self.imageCount == 1
        {
            return selfHeight
        }
        else if self.imageCount >= 2 && self.imageCount <= 4
        {
            return ((selfHeight - (marginSpace * 3)) / 2)
        }
        else
        {
            return ((selfHeight - (marginSpace * 4)) / 3)
        }
    }
    
    
    @IBInspectable var borderColor:UIColor = UIColor.clearColor() {
        didSet{
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    
    @IBInspectable var marginSpace: CGFloat = 2 {
    
        didSet{
            configureImageView()
        }
        
    }
    
    @IBInspectable var imageCount: Int = 0 {
        didSet{
            configureImageView()
        }
    }
    
    func configureImageView()
    {
        println("configureImageView")
        for subV in self.subviews
        {
            subV.removeFromSuperview()
        }
        imageViews.removeAll(keepCapacity: false)
        
        if imageCount <= 0{
            println("image count error")
        }
        else if imageCount == 1
        {
            var imageView1 = UIImageView(frame: CGRectMake(0, 0, imageIconWidth, imageIconHeight))
            imageView1.backgroundColor = randomColor()
            imageView1.tag = 0
            self.addSubview(imageView1)
            imageViews.append(imageView1)
        }else if imageCount == 2{
            
            var imageView1 = UIImageView(frame: CGRectMake(marginSpace, (selfHeight - imageIconHeight)/2, imageIconWidth, imageIconHeight))
            imageView1.backgroundColor = randomColor()
            imageView1.tag = 0
            self.addSubview(imageView1)
            imageViews.append(imageView1)
            
            var imageView2 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, (selfHeight - imageIconHeight)/2, imageIconWidth, imageIconHeight))
            imageView2.backgroundColor = randomColor()
            imageView2.tag = 1
            self.addSubview(imageView2)
            imageViews.append(imageView2)
        }else if imageCount == 3{
            
            var imageView1 = UIImageView(frame: CGRectMake((selfWidth - imageIconWidth)/2, marginSpace, imageIconWidth, imageIconHeight))
            imageView1.backgroundColor = randomColor()
            imageView1.tag = 0
            self.addSubview(imageView1)
            imageViews.append(imageView1)
            
            var imageView2 = UIImageView(frame: CGRectMake(marginSpace, imageIconHeight + (marginSpace*2), imageIconWidth, imageIconHeight))
            imageView2.backgroundColor = randomColor()
            imageView2.tag = 1
            self.addSubview(imageView2)
            imageViews.append(imageView2)
            
            var imageView3 = UIImageView(frame: CGRectMake(imageIconWidth + (marginSpace*2), imageIconHeight + (marginSpace*2), imageIconWidth, imageIconHeight))
            imageView3.backgroundColor = randomColor()
            imageView3.tag = 2
            self.addSubview(imageView3)
            imageViews.append(imageView3)
        }else if imageCount == 4{
            
            var imageView1 = UIImageView(frame: CGRectMake(marginSpace, marginSpace, imageIconWidth, imageIconHeight))
            imageView1.backgroundColor = randomColor()
            imageView1.tag = 0
            self.addSubview(imageView1)
            imageViews.append(imageView1)
            
            var imageView2 = UIImageView(frame: CGRectMake(imageIconWidth + (marginSpace*2), marginSpace, imageIconWidth, imageIconHeight))
            imageView2.backgroundColor = randomColor()
            imageView2.tag = 1
            self.addSubview(imageView2)
            imageViews.append(imageView2)
            
            var imageView3 = UIImageView(frame: CGRectMake(marginSpace, imageIconHeight + (marginSpace*2), imageIconWidth, imageIconHeight))
            imageView3.backgroundColor = randomColor()
            imageView3.tag = 2
            self.addSubview(imageView3)
            imageViews.append(imageView3)
            
            var imageView4 = UIImageView(frame: CGRectMake(imageIconWidth + (marginSpace*2), imageIconHeight + (marginSpace*2), imageIconWidth, imageIconHeight))
            imageView4.backgroundColor = randomColor()
            imageView4.tag = 3
            self.addSubview(imageView4)
            imageViews.append(imageView4)
            
        }else if imageCount == 5{
            
            var imageView1 = UIImageView(frame: CGRectMake((selfWidth - (imageIconWidth * 2 + marginSpace))/2, (selfHeight - (imageIconHeight * 2 + marginSpace))/2 , imageIconWidth, imageIconHeight))
            imageView1.backgroundColor = randomColor()
            imageView1.tag = 0
            self.addSubview(imageView1)
            imageViews.append(imageView1)
            
            var imageView2 = UIImageView(frame: CGRectMake((selfWidth - (imageIconWidth * 2 + marginSpace))/2 + imageIconWidth + marginSpace, (selfHeight - (imageIconHeight * 2 + marginSpace))/2 , imageIconWidth, imageIconHeight))
            imageView2.backgroundColor = randomColor()
            imageView2.tag = 1
            self.addSubview(imageView2)
            imageViews.append(imageView2)
            
            var imageView3 = UIImageView(frame: CGRectMake(marginSpace ,(selfHeight - (imageIconHeight * 2 + marginSpace))/2 + imageIconHeight + marginSpace, imageIconWidth, imageIconHeight))
            imageView3.backgroundColor = randomColor()
            imageView3.tag = 2
            self.addSubview(imageView3)
            imageViews.append(imageView3)
            
            var imageView4 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace ,(selfHeight - (imageIconHeight * 2 + marginSpace))/2 + imageIconHeight + marginSpace , imageIconWidth, imageIconHeight))
            imageView4.backgroundColor = randomColor()
            imageView4.tag = 3
            self.addSubview(imageView4)
            imageViews.append(imageView4)
            
            var imageView5 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace,(selfHeight - (imageIconHeight * 2 + marginSpace))/2 + imageIconHeight + marginSpace , imageIconWidth, imageIconHeight))
            imageView5.backgroundColor = randomColor()
            imageView5.tag = 4
            self.addSubview(imageView5)
            imageViews.append(imageView5)
            
        }else if imageCount == 6{
            
            var imageView1 = UIImageView(frame: CGRectMake(marginSpace, (selfHeight - (imageIconHeight * 2 + marginSpace))/2 , imageIconWidth, imageIconHeight))
            imageView1.backgroundColor = randomColor()
            imageView1.tag = 0
            self.addSubview(imageView1)
            imageViews.append(imageView1)
            
            var imageView2 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, (selfHeight - (imageIconHeight * 2 + marginSpace))/2 , imageIconWidth, imageIconHeight))
            imageView2.backgroundColor = randomColor()
            imageView2.tag = 1
            self.addSubview(imageView2)
            imageViews.append(imageView2)
            
            var imageView3 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace, (selfHeight - (imageIconHeight * 2 + marginSpace))/2 , imageIconWidth, imageIconHeight))
            imageView3.backgroundColor = randomColor()
            imageView3.tag = 2
            self.addSubview(imageView3)
            imageViews.append(imageView3)
            
            var imageView4 = UIImageView(frame: CGRectMake(marginSpace ,(selfHeight - (imageIconHeight * 2 + marginSpace))/2 + imageIconHeight + marginSpace, imageIconWidth, imageIconHeight))
            imageView4.backgroundColor = randomColor()
            imageView4.tag = 3
            self.addSubview(imageView4)
            imageViews.append(imageView4)
            
            var imageView5 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace ,(selfHeight - (imageIconHeight * 2 + marginSpace))/2 + imageIconHeight + marginSpace , imageIconWidth, imageIconHeight))
            imageView5.backgroundColor = randomColor()
            imageView5.tag = 4
            self.addSubview(imageView5)
            imageViews.append(imageView5)
            
            var imageView6 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace,(selfHeight - (imageIconHeight * 2 + marginSpace))/2 + imageIconHeight + marginSpace , imageIconWidth, imageIconHeight))
            imageView6.backgroundColor = randomColor()
            imageView6.tag = 5
            self.addSubview(imageView6)
            imageViews.append(imageView6)
            
        }else if imageCount == 7{
            
            var imageView1 = UIImageView(frame: CGRectMake((selfWidth - imageIconWidth)/2, marginSpace , imageIconWidth, imageIconHeight))
            imageView1.backgroundColor = randomColor()
            imageView1.tag = 0
            self.addSubview(imageView1)
            imageViews.append(imageView1)
            
            var imageView2 = UIImageView(frame: CGRectMake(marginSpace, marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView2.backgroundColor = randomColor()
            imageView2.tag = 1
            self.addSubview(imageView2)
            imageViews.append(imageView2)
            
            var imageView3 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView3.backgroundColor = randomColor()
            imageView3.tag = 2
            self.addSubview(imageView3)
            imageViews.append(imageView3)
            
            var imageView4 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView4.backgroundColor = randomColor()
            imageView4.tag = 3
            self.addSubview(imageView4)
            imageViews.append(imageView4)
            
            var imageView5 = UIImageView(frame: CGRectMake(marginSpace,marginSpace + imageIconHeight + marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView5.backgroundColor = randomColor()
            imageView5.tag = 4
            self.addSubview(imageView5)
            imageViews.append(imageView5)
            
            var imageView6 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView6.backgroundColor = randomColor()
            imageView6.tag = 5
            self.addSubview(imageView6)
            imageViews.append(imageView6)
            
            var imageView7 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView7.backgroundColor = randomColor()
            imageView7.tag = 6
            self.addSubview(imageView7)
            imageViews.append(imageView7)
            
        }else if imageCount == 8{
            var imageView1 = UIImageView(frame: CGRectMake(marginSpace, marginSpace , imageIconWidth, imageIconHeight))
            imageView1.backgroundColor = randomColor()
            imageView1.tag = 0
            self.addSubview(imageView1)
            imageViews.append(imageView1)
            
            var imageView2 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, marginSpace , imageIconWidth, imageIconHeight))
            imageView2.backgroundColor = randomColor()
            imageView2.tag = 1
            self.addSubview(imageView2)
            imageViews.append(imageView2)
            
            var imageView3 = UIImageView(frame: CGRectMake(marginSpace, marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView3.backgroundColor = randomColor()
            imageView3.tag = 2
            self.addSubview(imageView3)
            imageViews.append(imageView3)
            
            var imageView4 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView4.backgroundColor = randomColor()
            imageView4.tag = 3
            self.addSubview(imageView4)
            imageViews.append(imageView4)
            
            var imageView5 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView5.backgroundColor = randomColor()
            imageView5.tag = 4
            self.addSubview(imageView5)
            imageViews.append(imageView5)
            
            var imageView6 = UIImageView(frame: CGRectMake(marginSpace,marginSpace + imageIconHeight + marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView6.backgroundColor = randomColor()
            imageView6.tag = 5
            self.addSubview(imageView6)
            imageViews.append(imageView6)
            
            var imageView7 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView7.backgroundColor = randomColor()
            imageView7.tag = 6
            self.addSubview(imageView7)
            imageViews.append(imageView7)
            
            var imageView8 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView8.backgroundColor = randomColor()
            imageView8.tag = 7
            self.addSubview(imageView8)
            imageViews.append(imageView8)
            
        }else if imageCount >= 9{
            
            var imageView1 = UIImageView(frame: CGRectMake(marginSpace, marginSpace , imageIconWidth, imageIconHeight))
            imageView1.backgroundColor = randomColor()
            imageView1.tag = 0
            self.addSubview(imageView1)
            imageViews.append(imageView1)
            
            var imageView2 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, marginSpace , imageIconWidth, imageIconHeight))
            imageView2.backgroundColor = randomColor()
            imageView2.tag = 1
            self.addSubview(imageView2)
            imageViews.append(imageView2)
            
            var imageView3 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace, marginSpace , imageIconWidth, imageIconHeight))
            imageView3.backgroundColor = randomColor()
            imageView3.tag = 2
            self.addSubview(imageView3)
            imageViews.append(imageView3)
            
            var imageView4 = UIImageView(frame: CGRectMake(marginSpace, marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView4.backgroundColor = randomColor()
            imageView4.tag = 3
            self.addSubview(imageView4)
            imageViews.append(imageView4)
            
            var imageView5 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView5.backgroundColor = randomColor()
            imageView5.tag = 4
            self.addSubview(imageView5)
            imageViews.append(imageView5)
            
            var imageView6 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView6.backgroundColor = randomColor()
            imageView6.tag = 5
            self.addSubview(imageView6)
            imageViews.append(imageView6)
            
            var imageView7 = UIImageView(frame: CGRectMake(marginSpace,marginSpace + imageIconHeight + marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView7.backgroundColor = randomColor()
            imageView7.tag = 6
            self.addSubview(imageView7)
            imageViews.append(imageView7)
            
            var imageView8 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView8.backgroundColor = randomColor()
            imageView8.tag = 7
            self.addSubview(imageView8)
            imageViews.append(imageView8)
            
            var imageView9 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView9.backgroundColor = randomColor()
            imageView9.tag = 8
            self.addSubview(imageView9)
            imageViews.append(imageView9)
            
        }
    }
    
    
    func setImages(images:[UIImage])
    {
        self.imageCount = images.count
        for var i = 0; i < images.count; i++
        {
            imageViews[i].image = images[i]
        }
    }
    
    func setImageUrls(imagesUrls:[String],defaultImage:UIImage)
    {
        self.imageCount = imagesUrls.count
        for var i = 0; i < imagesUrls.count; i++
        {
            imageViews[i].image = defaultImage
            var t = NSThread(target: self, selector: "downloadImage:", object: ["url":imagesUrls[i],"index":i])
            t.start()
        }
    }
    
    func downloadImage(dict:Dictionary<String,AnyObject>)
    {
        var index = dict["index"] as! Int
        var url = dict["url"] as! String
        //下载图片
        var data = NSData(contentsOfURL: NSURL(string: url)!)
        if data == nil
        {
            println("下载图片报错:\(url)")
        }else{
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                //更新UI
                self.imageViews[index].image = UIImage(data: data!)
            })
        }
    }
    
}
