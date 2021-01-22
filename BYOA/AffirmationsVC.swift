//
//  AffirmationsVC.swift
//  BYOA
//
//  Created by Malena on 1/20/21.
//  Copyright © 2021 MDB. All rights reserved.
//

import UIKit

class AffirmationsVC: UIViewController, UITableViewDataSource, UITableViewDelegate
{
   

    @IBOutlet weak var myTableView: UITableView!
    
    var mySection1 = [Affirmation]()
    var mySection2 = [Affirmation]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        myTableView.delegate = self
        myTableView.dataSource = self
        
        loadAffirmations()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if section == 0
        {
            return ":)"
        }
        else
        {
            return ":("
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
       {
        if section == 0
        {
            return mySection1.count
        }
        else
        {
            return mySection2.count
        }
       
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
       {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        if indexPath.section == 0
        {
            let current = mySection1[indexPath.row]
            cell.textLabel?.text = current.title
        }
        else
        {
            let current = mySection2[indexPath.row]
            cell.textLabel?.text = current.title
        }
    
        return cell
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "toQuotesVC"
        {
            let destination = segue.destination as! QuotesVC
           
            if let indexPath = myTableView.indexPathForSelectedRow
            {
                if indexPath.section == 0
                {
                    let affirmation = mySection1[indexPath.row]
                    destination.affirmation = affirmation
                }
                else
                {
                    let affirmation = mySection2[indexPath.row]
                    destination.affirmation = affirmation
                }
            }
        }
    }
    
    
    // MARK: This is where I create all of the affirmations (their emotion title, section, and affirmation options) as a type of the custom class Affirmation.  This function loadAffirmations() is called in viewDidLoad, but I moved it down here so it won't be in the way of the other code because it's a lot of words haha.
    func loadAffirmations()
       {
        // first are all of the POSITIVE emotions.  They go in the global variable mySection1, and are in Section 0 (the first section) of the table view.
        
        let beautiful = Affirmation(title: "beautiful", section: 1, options: ["Yesss, get it!  I’m glad you feel beautiful… because you are beautiful, both inside and outside!", "Everyone deserves to feel beautiful, so I’m really glad that you’re feeling this way!  You are stunning, both inside and outside, and don’t let anyone tell you otherwise!", "Woo, go strut your stuff!  You are beauty, you are grace, you have a fantastic smile on your face!  You are gorgeous, both inside and outside.  I hope you have a beautiful day!"])
        
        let energized = Affirmation(title: "energized", section: 1, options: ["Woohoo!  It’s incredible what some extra sleep can do to your energy levels, am I right?!  Put on your favorite song and dance around!  Put all of that energy to good use!", "Doesn’t it feel so good to have so much energy?!  It’s so refreshing, right?  I think you should throw yourself a little dance party to celebrate the day!", "Feeling energized just makes the day so much better.  I hope your day is spectacular, and I hope you can walk around with a spring in your step!  Woohoo!"])
        
        let excited = Affirmation(title: "excited", section: 1, options: ["I’m glad you’re excited!  I have a feeling that whatever you’re looking forward to is going to be awesome.  I hope you have a great day!", "Wait, did you hear that sound?  That sound was me jumping up and down and cheering with you!  Excitement is so fun!  Hooray for you!", "I’m so glad you’re excited!  Exciting things are so… exciting!  I think this calls for a celebratory dance party!"])
        
        let happy = Affirmation(title: "happy", section: 1, options: ["Feeling happy is one of the best feelings ever.  I’m glad you feel this way, and I hope you have an incredible day!  Happiness looks great on you!", "I’m so happy that you’re happy!  Doesn’t happiness feel so great?  Happy happy happy!  You’re awesome!", "Happiness.  It’s refreshing, isn’t it?  I think you should celebrate your happiness by smiling in the mirror and giving yourself a big hug.  Go crush the day!"])
        
        let proud = Affirmation(title: "proud", section: 1, options: ["Yesss!  Strut with your head held high and let that pride shine!  I hope your day is as spectacular as you are!", "Pride is such a wonderful feeling and people don’t talk about it enough.  Good for you for being proud!  I’m sending all of my good vibes to you!", "Look at you go!  You are crushing it today!  You deserve to feel proud of yourself, and you should know that I’m proud of you!"])
           
        mySection1.append(beautiful)
        mySection1.append(energized)
        mySection1.append(excited)
        mySection1.append(happy)
        mySection1.append(proud)
        
        // now, here are all of the NEGATIVE emotions.  They go in the global variable mySection2, and are in Section 1 (the second section) of the table view.
        
        let angry = Affirmation(title: "angry", section: 2, options: ["Try taking a deep breath and listening to your favorite song.  Good tunes are a great mood lifter!  Just remember that this feeling won’t last forever.  You’ve got this!", "Ugh, I know how you feel, and it’s not fun.  To help yourself calm down, try taking a few deep breaths.  I know it may feel like everything is falling apart, but just remember that this feeling will go away soon.  Try removing yourself from the situation and take some time to reflect on what’s making you feel so angry.  You might need to do some perspective taking, and soon enough you will feel calm again.  I believe in you!", "I know that right now you may feel like you’re about to explode, but remember that this feeling will not last forever.  In the meantime, take some deep breaths and try switching your attention to something less upsetting, such as a good book or some music.  Additionally, avoid making any big decisions until you are out of this angry state.  Things will work themselves out; you’ve got this!"])
        
        let anxious = Affirmation(title: "anxious", section: 2, options: ["Just remember that this is an uncomfortable feeling that will not last forever.  Consider this: the last time you felt this way, did any of your worries come true?  Most likely they didn’t.  And even if they did, you were okay then, so you will be okay this time, too.  Take a deep breath and remember that you are not alone; everyone has felt this way at some point.  You’ve got this!", " I know how you feel, and it’s not fun.  I want you to take a deep breath and think of your favorite memory.  Sometimes, when we get lost in worry, we can calm ourselves down by getting lost in joy.  Just know that this feeling will go away.  You are a strong, brave, and fierce conqueror of anxiety!", "I know that you may feel like everything's falling apart.  This is a totally valid feeling, but most likely it is not true.  Try the 5-4-3-2-1 grounding technique to help ease your anxiety.  Look at your surroundings and notice 5 things you can see right now, 4 things you can touch, 3 things you can hear, 2 things you can smell, and 1 thing you can taste.  This can help you come back into a calmer state of mind.  I hope you feel better, and remember that this feeling won’t last forever!"])
        
        let frustrated = Affirmation(title: "frustrated", section: 2, options: ["Just remember that this feeling won’t last forever, and the problem will get resolved.  Until then, try separating yourself from the situation for a minute and taking a few deep breaths. You’ve got this!", "Remember, you get to choose how you respond to this frustration.  You can either spiral and continue being frustrated, or you can step away, take a deep breath, and return when you are ready to tackle the challenge!  I suggest you do the second option.  :)  Either way, know that this feeling will not last forever, and you’ve got this!", "Ugh, things can be so irritating, right?  I know how you feel, and I hope you know that this bad feeling will not last forever.  I’m proud of you for trying to tackle whatever is frustrating you, but maybe it is time to take a break and come back with a fresh mind in a bit.  Or– and I know this is not what people like to hear– maybe you need to ask for help in order to conquer this task!  No matter how you choose to continue, I believe in you, and you will get through this!"])
        
        let lonely = Affirmation(title: "lonely", section: 2, options: ["Try looking in the mirror and saying to yourself, “I know my worth.  I am strong, intelligent, and beautiful, and I don’t need anyone’s validation for that to be true.  My loneliness is not permanent.  This feeling won’t last forever.”  You’ve got this!", "Loneliness is not a good feeling, but as with most bad feelings, it will not last forever!  For now, try becoming your own best friend.  Practice some self care, whether that means taking a hot shower, drinking some hot cocoa, or snuggling up and watching a good movie.  You are strong, worthy, and incredible.  You’ve got this!", "Just remember that you are not alone in this feeling-- this is normal and almost everyone has felt this way before.  Your loneliness will not last forever, and you will get through this.  You are strong, brave, and worthy.  Anyone who believes otherwise isn’t worth your time anyway.  You are loved, and I hope you know that!  I believe in you!"])
        
        let sad = Affirmation(title: "sad", section: 2, options: ["Try reaching out to a friend who can help you through this situation.  Or, try lifting your mood by watching your favorite show, listening to your favorite song, or eating your favorite food.  You deserve to feel happy, so do whatever you need to feel that way.  Just remember that this feeling won’t last forever.  You’ve got this!", "Your feelings are 100% valid.  However, don’t let your sadness trick you into thinking that there’s no end in sight.  I know things may be hard right now, but you will make it through this.  In the meantime, do whatever you can to bring back your happiness.  Try watching your favorite show or reach out to a loved one for support.  You are strong and you are loved.  You will make it through this!", "This feeling will not last forever, but you can try doing things to focus your attention elsewhere in the meantime.  Doing things you love can help make you feel better.  Snuggle with a furry friend, watch a movie, take a shower, get some fresh air, or seek support from a loved one.  It’s okay to ask for help because people WANT to help you!  You are strong and worthy, and you WILL get through this.  I believe in you!"])
        
        let stressed = Affirmation(title: "stressed", section: 2, options: ["Try getting some fresh air and separating yourself from the stressor for a minute.  Or, try breaking down your to-do list into smaller, more manageable pieces so that you can feel more accomplished.  And remember, this isn’t the end of the world, and this feeling won’t last forever.  You’ve got this!", "I know that stress can often make us feel icky, both mentally and physically.  So, if your heart is racing and your stomach is churning, remember that this is just your body’s way of trying to protect you.  However, you are most likely not in any immediate danger!  So, take some deep breaths and remember that it is okay to feel this way.  Your feelings are normal and valid, but they also will not last forever!  You will make it through this!", "If you’re stressed about things you have to do, then here is a method to help you combat these feelings of overwhelm!  Try writing two lists: a to-do list and a not-to-do-list.  On the to-do list, write all of the things you need to do.  This may seem stressful at first, but it’s an important step in managing your tasks.  Next, write your not-to-do-list.  This is the list of all of the things that you are NOT going to tackle today.  This way, you can have a focused selection of tasks to conquer today, and maybe this will help reduce the stress!  Just remember that, even though this feeling is uncomfortable, it is not permanent!  You are going to work through this, trust me.  I believe in you!"])
        
        mySection2.append(angry)
        mySection2.append(anxious)
        mySection2.append(frustrated)
        mySection2.append(lonely)
        mySection2.append(sad)
        mySection2.append(stressed)

       }
    
    
    
    
    
}

