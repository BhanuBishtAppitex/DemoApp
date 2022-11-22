//
//  ModelForSixthViewController.swift
//  Demo
//
//  Created by wOOx Technology on 22/11/22.
//

import Foundation

struct ModelForSixthViewController: Codable{
    static let url: String = "https://api.dictionaryapi.dev/api/v2/entries/en/"
        let word, phonetic: String
        let phonetics: [Phonetic]
        let meanings: [Meaning]
        let license: License
        let sourceUrls: [String]
    }

    // MARK: - License
    struct License: Codable {
        let name: String
        let url: String
    }

    // MARK: - Meaning
    struct Meaning: Codable {
        let partOfSpeech: String
        let definitions: [Definition]
        let synonyms, antonyms: [String]
    }

    // MARK: - Definition
    struct Definition: Codable {
        let definition: String
        //let synonyms, antonyms: [JSONAny]
    }

    // MARK: - Phonetic
    struct Phonetic: Codable {
        let text: String
        let audio: String
        let sourceURL: String
        let license: License

        enum CodingKeys: String, CodingKey {
            case text, audio
            case sourceURL = "sourceUrl"
            case license
        }
    }
