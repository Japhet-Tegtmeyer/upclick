//
//  TextManager.swift
//  CountUP!
//
//  Created by Japhet Tegtmeyer on 10/28/23.
//

import Foundation

struct TextManager {
    
    static let snarkymessages = [
        
        "Wow, you clicked that button like a pro... said no one ever.",
        
        "Keep clicking, maybe one day you'll achieve mediocrity.",
        
        "You clicked that button so fast, I almost fell asleep.",
        
        "Congratulations, you just wasted a few more seconds of your life clicking that button.",
        
        "Your button clicking skills are as impressive as watching paint dry.",
        
        "Are you getting tired yet? Because I'm getting tired of watching you click that button.",
        
        "You clicked that button with such enthusiasm, it's almost cute... almost.",
        
        "If clicking buttons were an Olympic sport, you wouldn't even make it to the tryouts.",
        
        "Keep clicking, maybe one day you'll unlock a button that does something useful.",
        
        "Clicking buttons is your superpower? Well, it's not a very impressive one.",
        
        "You clicked that button like a sloth on sedatives.",
        
        "Keep clicking, maybe one day you'll achieve the world record for most pointless button presses.",
        
        "Congratulations, you just wasted more time clicking that button.",
        
        "Your button-clicking skills are as impressive as a snail's marathon.",
        
        "Are you trying to break the record for slowest button clicker? Because you're doing great!",
        
        "You clicked that button with such enthusiasm, it's almost adorable... almost.",
        
        "If button clicking were an Olympic sport, you'd be the reigning champion of boredom.",
        
        "Keep clicking, maybe one day you'll unlock a button that does something meaningful.",
        
        "Clicking buttons is your superpower? Well, it's not a very impressive one.",
        
        "You're clicking buttons like a pro... at wasting time.",
        
        "Your button-clicking skills are as impressive as a snail on vacation.",
        
        "Keep clicking, maybe one day you'll discover the hidden meaning behind this pointless button.",
        
        "Congratulations, you just wasted another precious moment of your life clicking that button.",
        
        "You click buttons with the grace of a baby elephant learning to walk.",
        
        "Are you trying to set a new world record for the slowest button clicks? You're doing splendidly!",
        
        "You clicked that button with such fervor, it's almost endearing...almost.",
        
        "If button clicking were an Olympic sport, you'd be the reigning champion of futility.",
        
        "Keep clicking, maybe one day you'll unlock the secret button that changes everything...or not.",
        
        "Clicking buttons is your superpower? Well, it's not exactly a superpower worth bragging about.",
        
        "You're clicking buttons like a pro...at accomplishing absolutely nothing.",
        
        "You're clicking buttons like a pro...at accomplishing absolutely nothing.",
        
    ]
    
    static let nicemessages = [
        
        "You're clicking that button like a maestro, making it look effortless!",
        
        "Keep up the fantastic clicking - you're getting quicker with each press!",
        
        "Your speed in clicking is truly impressive, it's like a symphony of efficiency!",
        
        "Every click brings you closer to your goal - you're doing great!",
        
        "Your precision in clicking is remarkable, each one feels purposeful and exact!",
        
        "Your persistence in clicking is admirable - each press brings progress!",
        
        "You're clicking that button with such skill and finesse, it's a joy to watch!",
        
        "If clicking buttons were an art, you'd be a master painter!",
        
        "Keep clicking, each press might just reveal something remarkable!",
        
        "Your ability to click buttons is noteworthy, it shows determination and focus!",
        
        "You're clicking that button with a rhythm that's both smooth and efficient!",
        
        "Each click brings you closer to achieving your goal - keep it up!",
        
        "Your button-clicking talent is impressive, you make it seem effortless!",
        
        "Your dedication to clicking is exceptional - it's the mark of a true pro!",
        
        "You're approaching the button-clicking challenge with precision and grace!",
        
        "Your clicking speed is commendable, each one gets you one step closer!",
        
        "If button-clicking were an Olympic sport, you'd be a serious contender!",
        
        "Your talent in clicking buttons is remarkable, a skill to be proud of!",
        
        "You're clicking buttons with finesse, turning a mundane task into an art!",
        
        "Your skill in clicking buttons is top-notch, keep up the great work!",
        
        "Each click you make is progress towards your goal - keep it up!",
        
        "Your button-clicking prowess is like poetry in motion - impressive!",
        
        "You're clicking buttons with such finesse and speed, it's wonderful to see!",
        
        "If button-clicking were an Olympic sport, you'd be on the podium for sure!",
        
        
        "Keep clicking, every press might just bring about a wonderful change!",
        
        "Your skill in clicking buttons is exceptional, a mark of dedication!",
        
        "You're clicking buttons like a pro, and it's a joy to witness your skill!",
    ]

    static func getSnarkyRandomMessage() -> String {
        
        return snarkymessages.randomElement() ?? "Welcome back!"
        
    }
    
    static func getNiceRandomMessage() -> String {
        
        return nicemessages.randomElement() ?? "Welcome back!"
        
    }
    
}
