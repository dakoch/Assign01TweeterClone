//
//  ViewController.swift
//  TweeterClone
//
//  Created by Gru/dakoch on 01/05/15.
//  Copyright (c) 2015 GruTech. All rights reserved.
//
//
/*  https://github.com/XVimProject/XVim  location of the XCode/Vim plug-in.
// --------------------------------------------------------------------------------------------------------
// Monday, 2015-Jan-05
//
// W1.D1.01[x] Create your MVC groups - Create groups: ModelLayer, ViewLayer, ControllerLayer
// W1.D1.02[x] Create your Tweet class with an initializer that takes a Dictionary
//             in as a parameter                                                            - 'Tweet.swift'
// W1.D1.03[x] In addition to the text property, add a property to hold the username
//             of the person who tweeted the tweet
// W1.D1.04[x] Drag the tweet.json file into your Xcode project
// W1.D1.05[x] Parse the json file into tweet objects
// W1.D1.06[ ] In addition to text, pull out the username from the json for each
//             tweet and use that property you added to hold it
// W1.D1.07[x] Display those tweet objects in the table view
// W1.D1.08[ ] Create a custom table view cell class with your own custom label
//             and image view
// --------------------------------------------------------------------------------------------------------
*/

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDataSource {


    @IBOutlet weak var tweetTableView: UITableView!

    var tweets      = [Tweet]()
    var tweetImages = [UIImage]()

//    tweetImages.append( UIImage( named: "edith03.jpeg")!)
//    tweetImages += [UIImage(named: "gru02.jpeg")!]
//    tweetImages += [UIImage(named: "NinjaEdith.jpeg")!]


    var edith = UIImage( named: "edith03.jpeg")
//  tweetImages[1] = UIImage( named: "gru02.jpeg")
//  tweetImages[2] = UIImage( named: "NinjaEdith.jpeg")

//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        tweetImages.append( UIImage( named: "edith03.jpeg")!)
        tweetImages += [UIImage(named: "gru02.jpeg")!]
        tweetImages += [UIImage(named: "NinjaEdith.jpg")!]

        // Let's take a look at the 'tweet.json' file in the 'Supporting Files' group in our 'TweeterClone' project
        if let jsonPath = NSBundle.mainBundle().pathForResource( "tweet", ofType: "json" ) {

            if let jsonData = NSData(contentsOfFile: jsonPath) {
                var error : NSError?
                if let jsonArray = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error:&error) as? [AnyObject] {
                    for object in jsonArray {
                        if let jsonDictionary = object as? [String : AnyObject] {
                            let tweet = Tweet(jsonDictionary)
                            self.tweets.append(tweet)
                        }

                    }
                    //self.tweetTableView.reloadData()
                    self.tweetTableView.dataSource = self
                }
            } else {
                println("getting data from path failed")
            }


        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView( tableView: UITableView, numberOfRowsInSection section: Int ) -> Int {

        return self.tweets.count
    }

//  UIImage * myImage0 = [UIImage imageNamed: @"edith03.jpeg"]
//  UIImage * myImage0 = [UIImage imageNamed: @"gru02.jpeg"]
//  UIImage * myImage0 = [UIImage imageNamed: @"NinjaEdith.jpeg"]
    func tableView( tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath ) -> UITableViewCell {
        // Let's get the tweets from a local file...
        let cell = tableView.dequeueReusableCellWithIdentifier("CELL", forIndexPath: indexPath ) as TweetCell
        let tweet = self.tweets[indexPath.row]
        cell.tweetLabel.text = tweet.text
        cell.tweetImage.image = tweetImages[indexPath.row]

//        cell.tweetImage.image = UIImage( named: "edith03.jpeg" )
//        cell.tweetImage.backgroundColor = UIColor.blueColor()
//        cell.tweetImage.image = tweetImages[indexPath.row] as UIImage
        return cell
    }
}