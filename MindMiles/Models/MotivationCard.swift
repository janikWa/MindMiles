//
//  MotivationCard.swift
//  MindMiles
//
//  Created by Janik Wahrheit on 02.07.25.
//

import Foundation
import SwiftUI

struct MotivationCard: Identifiable {
    let id = UUID()
    let title: String
    let text: String
}


enum MotivationCategory: CaseIterable {
    case fact
    case psychotip
    case motivation
    case study
    case reminder

    var emoji: String {
        switch self {
        case .fact: return "💡"
        case .psychotip: return "🧠"
        case .motivation: return "🚀"
        case .study: return "👨🏼‍🏫"
        case .reminder: return "🌿"
        }
    }
}

struct MotivationCardWithCategory: Identifiable {
    let id = UUID()
    let category: MotivationCategory
    let card: MotivationCard
}

let motivationData: [MotivationCategory: [MotivationCard]] = [
    .fact: [
        MotivationCard(title: "Fakt", text: "Regelmäßige Bewegung verbessert die Stimmung und senkt das Risiko für Depressionen."),
        MotivationCard(title: "Fakt", text: "Körperliche Aktivität erhöht die Produktion von Glückshormonen."),
        MotivationCard(title: "Fakt", text: "Bewegung reduziert Stress und Angstzustände."),
        MotivationCard(title: "Fakt", text: "Sport fördert die Neuroplastizität des Gehirns."),
        MotivationCard(title: "Fakt", text: "Laufen kann die Schlafqualität deutlich verbessern."),
        MotivationCard(title: "Fakt", text: "Bewegung unterstützt die Freisetzung von Endorphinen, den natürlichen Schmerzkillern."),
        MotivationCard(title: "Fakt", text: "Sportliche Aktivität stärkt das Immunsystem."),
        MotivationCard(title: "Fakt", text: "Regelmäßige Bewegung kann das Risiko für chronische Krankheiten senken."),
        MotivationCard(title: "Fakt", text: "Schon 30 Minuten Bewegung täglich haben große positive Effekte."),
        MotivationCard(title: "Fakt", text: "Bewegung fördert die Produktion von Serotonin, dem Glückshormon."),
    ],

    .psychotip: [
        MotivationCard(title: "Psychotipp", text: "Versuche, Bewegung als Geschenk an dich selbst zu sehen."),
        MotivationCard(title: "Psychotipp", text: "Achte auf deine Atmung beim Laufen."),
        MotivationCard(title: "Psychotipp", text: "Setze dir kleine erreichbare Ziele für deine Läufe."),
        MotivationCard(title: "Psychotipp", text: "Fokussiere dich auf das Hier und Jetzt während deiner Bewegung."),
        MotivationCard(title: "Psychotipp", text: "Belohne dich für jeden Schritt, den du machst."),
        MotivationCard(title: "Psychotipp", text: "Visualisiere deine Fortschritte regelmäßig."),
        MotivationCard(title: "Psychotipp", text: "Teile deine Ziele mit Freunden, um motiviert zu bleiben."),
        MotivationCard(title: "Psychotipp", text: "Mach dir bewusst, wie gut Bewegung deinem Geist tut."),
        MotivationCard(title: "Psychotipp", text: "Höre während des Laufens deine Lieblingsmusik."),
        MotivationCard(title: "Psychotipp", text: "Nimm wahr, wie sich dein Körper nach dem Sport anfühlt."),
    ],

    .motivation: [
        MotivationCard(title: "Motivation", text: "Jeder Schritt ist ein Statement: Ich kümmere mich um mich."),
        MotivationCard(title: "Motivation", text: "Laufen macht dich stärker – körperlich und mental."),
        MotivationCard(title: "Motivation", text: "Der härteste Schritt ist der erste."),
        MotivationCard(title: "Motivation", text: "Dein Körper kann mehr, als dein Kopf denkt."),
        MotivationCard(title: "Motivation", text: "Mit jedem Lauf wächst deine innere Stärke."),
        MotivationCard(title: "Motivation", text: "Bleib dran, der Erfolg kommt mit der Kontinuität."),
        MotivationCard(title: "Motivation", text: "Laufen ist ein Geschenk, das du dir selbst machst."),
        MotivationCard(title: "Motivation", text: "Du bist heute besser als gestern."),
        MotivationCard(title: "Motivation", text: "Jeder Kilometer bringt dich deinem Ziel näher."),
        MotivationCard(title: "Motivation", text: "Bleib positiv – dein Körper und Geist danken es dir."),
    ],

    .study: [
        MotivationCard(title: "Studie", text: "Bewegung kann depressive Symptome um bis zu 26 % reduzieren. (Harvard Medical School, 2018)"),
        MotivationCard(title: "Studie", text: "Laufen fördert die Neurogenese im Hippocampus. (Johns Hopkins University, 2020)"),
        MotivationCard(title: "Studie", text: "Regelmäßige Bewegung verbessert die kognitive Funktion. (Mayo Clinic, 2019)"),
        MotivationCard(title: "Studie", text: "Sport reduziert Angst- und Stresslevel signifikant. (University of California, 2017)"),
        MotivationCard(title: "Studie", text: "Bewegung erhöht die Ausschüttung von BDNF, einem Gehirn-Wachstumsfaktor. (NIH, 2016)"),
        MotivationCard(title: "Studie", text: "Sport kann als ergänzende Therapie bei Depressionen wirksam sein. (Cochrane Review, 2015)"),
        MotivationCard(title: "Studie", text: "Moderate Bewegung verbessert die Schlafqualität bei Patienten mit Depressionen. (Sleep Medicine Journal, 2019)"),
        MotivationCard(title: "Studie", text: "Laufen aktiviert das Belohnungssystem im Gehirn. (Neuroscience Letters, 2018)"),
        MotivationCard(title: "Studie", text: "Bewegung kann die Stressresistenz verbessern. (Stress Research Institute, 2020)"),
        MotivationCard(title: "Studie", text: "Regelmäßige körperliche Aktivität fördert die soziale Interaktion und das Wohlbefinden. (WHO, 2018)"),
    ],

    .reminder: [
        MotivationCard(title: "Erinnerung", text: "Du musst heute nicht alles schaffen – ein kleiner Spaziergang reicht."),
        MotivationCard(title: "Erinnerung", text: "Mach Pausen und genieße die frische Luft."),
        MotivationCard(title: "Erinnerung", text: "Feiere auch kleine Erfolge auf deinem Weg."),
        MotivationCard(title: "Erinnerung", text: "Höre auf deinen Körper und überfordere dich nicht."),
        MotivationCard(title: "Erinnerung", text: "Trinke ausreichend Wasser vor und nach dem Lauf."),
        MotivationCard(title: "Erinnerung", text: "Ein guter Lauf beginnt mit dem richtigen Schuhwerk."),
        MotivationCard(title: "Erinnerung", text: "Bleib dran, auch wenn es mal schwer fällt."),
        MotivationCard(title: "Erinnerung", text: "Erholung ist genauso wichtig wie Bewegung."),
        MotivationCard(title: "Erinnerung", text: "Motivation kommt und geht – Disziplin bringt dich weiter."),
        MotivationCard(title: "Erinnerung", text: "Denke daran: Jeder Schritt zählt."),
    ]
]
