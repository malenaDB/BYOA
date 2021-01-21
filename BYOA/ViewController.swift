//
//  ViewController.swift
//  BYOA
//
//  Created by Malena on 1/14/21.
//  Copyright © 2021 MDB. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var myQuotes = [Quote]()
    var currentQuote = Quote(words: "Hello, this is a quote.", author: "-Malena")

    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadQuotes()
        myQuotes.shuffle()
        
        currentQuote = myQuotes[1]
        quoteLabel.text = "\(currentQuote.words)"
        authorLabel.text = "\(currentQuote.author)"
    }
    
    func loadQuotes()
    {
        let quote1 = Quote(words: "“Confidence is the most beautiful thing you can possess.”", author: "-Sabrina Carpenter")
        let quote2 = Quote(words: "“The number one priority in life is to take care of yourself and make sure you're happy.”", author: "-Sabrina Carpenter")
        let quote3 = Quote(words: "“Knowing that we can be loved exactly as we are gives us all the best opportunity for growing into the healthiest of people.”", author: "-Fred Rogers")
        let quote4 = Quote(words: "“Knowing that we can be loved exactly as we are gives us all the best opportunity for growing into the healthiest of people.”", author: "-Kobe Bryant")
        let quote5 = Quote(words: "“No matter what you're going through, there's a light at the end of the tunnel and it may seem hard to get to it but you can do it and just keep working towards it and you'll find the positive side of things.”", author:"-Demi Lovato")
        let quote6 = Quote(words: "“Positive thinking will let you do everything better than negative thinking will.”", author: "-Zig Ziglar")
        let quote7 = Quote(words: "“Gratitude is the healthiest of all human emotions. The more you express gratitude for what you have, the more likely you will have even more to express gratitude for.”", author: "-Zig Ziglar")
        let quote8 = Quote(words: "“You were designed for accomplishment, engineered for success, and endowed with the seeds of greatness.”", author: "-Zig Ziglar")
        let quote9 = Quote(words: "“Remember that failure is an event, not a person.”", author: "-Zig Ziglar")
        let quote10 = Quote(words: "“You are who you are and what you are because of what has gone into your mind. You can change who you are and what you are by changing what goes into your mind.”", author: "-Zig Ziglar")
        let quote11 = Quote(words: "“The problem is not getting rid of fear, but using it properly.”", author: "-Zig Ziglar")
        let quote12 = Quote(words: "“No one can make you feel inferior without your consent.”", author: "-Eleanor Roosevelt")
        let quote13 = Quote(words: "“I have not failed.  I’ve just found 10,000 ways that don’t work.”", author: "-Thomas Edison")
        let quote14 = Quote(words: "“My purpose: to lift your spirit and motivate you.”", author: "-Mavis Staples")
        let quote15 = Quote(words: "“Don’t wait around for other people to be happy for you.  Any happiness you get you’ve got to make yourself.”", author: "-Alice Walker")
        let quote16 = Quote(words: "“Be strong, be fearless, be beautiful.  And believe that anything is possible when you have the right people there to support you.”", author: "-Misty Copeland")
        let quote17 = Quote(words: "“If you’re presenting yourself with confidence, you can pull off pretty much anything.”", author: "-Katy Perry")
        let quote18 = Quote(words: "“Find out what your gift is and nurture it.”", author: "-Katy Perry")
        let quote19 = Quote(words: "“Never be ashamed of a scar. It means you were stronger than whatever tried to hurt you.”", author: "-Unknown")
        let quote20 = Quote(words: "“You may encounter many defeats, but you must not be defeated.”", author: "-Maya Angelou")
        let quote21 = Quote(words: "“It always seems impossible until it’s done.”", author: "-Nelson Mandela")
        let quote22 = Quote(words: "“You have brains in your head. You have feet in your shoes. You can steer yourself any direction you choose.”", author: "-Dr. Seuss")
        let quote23 = Quote(words: "“There are no mistakes, only opportunities.”", author: "-Tina Fey")
        
        myQuotes.append(quote1)
        myQuotes.append(quote2)
        myQuotes.append(quote3)
        myQuotes.append(quote4)
        myQuotes.append(quote5)
        myQuotes.append(quote6)
        myQuotes.append(quote7)
        myQuotes.append(quote8)
        myQuotes.append(quote9)
        myQuotes.append(quote10)
        myQuotes.append(quote11)
        myQuotes.append(quote12)
        myQuotes.append(quote13)
        myQuotes.append(quote14)
        myQuotes.append(quote15)
        myQuotes.append(quote16)
        myQuotes.append(quote17)
        myQuotes.append(quote18)
        myQuotes.append(quote19)
        myQuotes.append(quote20)
        myQuotes.append(quote21)
        myQuotes.append(quote22)
        myQuotes.append(quote23)
    }
}

