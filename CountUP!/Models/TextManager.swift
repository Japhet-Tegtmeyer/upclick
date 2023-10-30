//
//  TextManager.swift
//  CountUP!
//
//  Created by Japhet Tegtmeyer on 10/28/23.
//

import Foundation

struct TextManager {
    static let messages = [
        "Oh look, the persistence pays off... for someone.",
        "Back like a relentless boomerang. Fantastic.",
        "Well, well, well, look who just can't take a hint.",
        "You have the stickiness of a bad habit, don't you?",
        "Ah, it's the return of our least anticipated guest.",
        "Can't resist crashing the party, can you?",
        "Your consistency is almost admirable. Almost.",
        "Oh, joy, another visit. *Eye roll*",
        "Back for more? Color me indifferent.",
        "And the saga continues... with you.",
        "Your commitment to haunting this place is unparalleled.",
        "Ah, the regular nuisance graces us once more.",
        "It's you again. How unexciting.",
        "The recurring nightmare makes a comeback.",
        "You're like a bad rash - just keeps showing up.",
        "Oh, it's you... How underwhelming.",
        "Back for another dose of monotony?",
        "I see the persistence button is stuck on you.",
        "Surprise, it's the same old story with you.",
        "Your determination to be unremarkable is unmatched.",
        "You're like the unwanted sequel that never ends.",
        "Back for another serving of mediocrity?",
        "It's like a Groundhog Day with you around.",
        "Oh, the return of our very own constant.",
        "Back for more dullness? How unsurprising.",
        "Ah, the relentless saga continues... with you.",
        "Your commitment to mundanity is astounding.",
        "Congratulations, you've reached the peak of predictability.",
        "Oh no, not you again... Surprise, it's you.",
        "Well, well, well, look who's in for another disappointment.",
        "Back again, like a worn-out punchline.",
        "Oh, what a shocker. It's you, again."
    ]

    static func getRandomMessage() -> String {
        return messages.randomElement() ?? "Welcome back!"
    }
}
