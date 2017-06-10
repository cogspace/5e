module Model.Skills
    exposing
        ( Skill(..)
        , Skills
        , SkillProfs
        , skills
        , ability
        , map
        , all
        , name
        , get
        , set
        )

import Model.Abilities exposing (Ability(..))


type Skill
    = Acrobatics
    | AnimalHandling
    | Arcana
    | Athletics
    | Deception
    | History
    | Insight
    | Intimidation
    | Investigation
    | Medicine
    | Nature
    | Perception
    | Performance
    | Persuasion
    | Religion
    | SleightOfHand
    | Stealth
    | Survival


type alias Skills a =
    { acrobatics : a
    , animalHandling : a
    , arcana : a
    , athletics : a
    , deception : a
    , history : a
    , insight : a
    , intimidation : a
    , investigation : a
    , medicine : a
    , nature : a
    , perception : a
    , performance : a
    , persuasion : a
    , religion : a
    , sleightOfHand : a
    , stealth : a
    , survival : a
    }


type alias SkillProfs =
    Skills Bool


skills : List Skill
skills =
    [ Acrobatics
    , AnimalHandling
    , Arcana
    , Athletics
    , Deception
    , History
    , Insight
    , Intimidation
    , Investigation
    , Medicine
    , Nature
    , Perception
    , Performance
    , Persuasion
    , Religion
    , SleightOfHand
    , Stealth
    , Survival
    ]


map : (Skill -> b) -> List b
map func =
    List.map func skills


all : a -> Skills a
all a =
    { acrobatics = a
    , animalHandling = a
    , arcana = a
    , athletics = a
    , deception = a
    , history = a
    , insight = a
    , intimidation = a
    , investigation = a
    , medicine = a
    , nature = a
    , perception = a
    , performance = a
    , persuasion = a
    , religion = a
    , sleightOfHand = a
    , stealth = a
    , survival = a
    }


zero : Skills Bool
zero =
    all False


ability : Skill -> Ability
ability skill =
    case skill of
        Acrobatics ->
            Dexterity

        AnimalHandling ->
            Wisdom

        Arcana ->
            Intelligence

        Athletics ->
            Strength

        Deception ->
            Charisma

        History ->
            Intelligence

        Insight ->
            Wisdom

        Intimidation ->
            Charisma

        Investigation ->
            Intelligence

        Medicine ->
            Wisdom

        Nature ->
            Intelligence

        Perception ->
            Wisdom

        Performance ->
            Charisma

        Persuasion ->
            Charisma

        Religion ->
            Intelligence

        SleightOfHand ->
            Dexterity

        Stealth ->
            Dexterity

        Survival ->
            Wisdom


name : Skill -> String
name skill =
    case skill of
        Acrobatics ->
            "Acrobatics"

        AnimalHandling ->
            "Animal Handling"

        Arcana ->
            "Arcana"

        Athletics ->
            "Athletics"

        Deception ->
            "Deception"

        History ->
            "History"

        Insight ->
            "Insight"

        Intimidation ->
            "Intimidation"

        Investigation ->
            "Investigation"

        Medicine ->
            "Medicine"

        Nature ->
            "Nature"

        Perception ->
            "Perception"

        Performance ->
            "Performance"

        Persuasion ->
            "Persuasion"

        Religion ->
            "Religion"

        SleightOfHand ->
            "Sleight of Hand"

        Stealth ->
            "Stealth"

        Survival ->
            "Survival"


get : Skill -> Skills a -> a
get skill skills =
    case skill of
        Acrobatics ->
            skills.acrobatics

        AnimalHandling ->
            skills.animalHandling

        Arcana ->
            skills.arcana

        Athletics ->
            skills.athletics

        Deception ->
            skills.deception

        History ->
            skills.history

        Insight ->
            skills.insight

        Intimidation ->
            skills.intimidation

        Investigation ->
            skills.investigation

        Medicine ->
            skills.medicine

        Nature ->
            skills.nature

        Perception ->
            skills.perception

        Performance ->
            skills.performance

        Persuasion ->
            skills.persuasion

        Religion ->
            skills.religion

        SleightOfHand ->
            skills.sleightOfHand

        Stealth ->
            skills.stealth

        Survival ->
            skills.survival


set : Skill -> a -> Skills a -> Skills a
set skill val skills =
    case skill of
        Acrobatics ->
            { skills | acrobatics = val }

        AnimalHandling ->
            { skills | animalHandling = val }

        Arcana ->
            { skills | arcana = val }

        Athletics ->
            { skills | athletics = val }

        Deception ->
            { skills | deception = val }

        History ->
            { skills | history = val }

        Insight ->
            { skills | insight = val }

        Intimidation ->
            { skills | intimidation = val }

        Investigation ->
            { skills | investigation = val }

        Medicine ->
            { skills | medicine = val }

        Nature ->
            { skills | nature = val }

        Perception ->
            { skills | perception = val }

        Performance ->
            { skills | performance = val }

        Persuasion ->
            { skills | persuasion = val }

        Religion ->
            { skills | religion = val }

        SleightOfHand ->
            { skills | sleightOfHand = val }

        Stealth ->
            { skills | stealth = val }

        Survival ->
            { skills | survival = val }
