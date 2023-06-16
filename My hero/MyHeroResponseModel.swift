//
//  MyHeroResponseModel.swift
//  My hero
//
//  Created by Takhmina on 09.12.2022.
//

import Foundation

struct MyHeroResponseModel : Decodable {
    let name : String
    let images : heroImg
    let appearance : heroAppearance
    let powerstats : heroPowerstats
}

struct heroImg : Decodable {
    let sm : String
}

struct heroAppearance : Decodable {
    let gender : String
    let race : String
    let eyeColor : String
    let hairColor : String
}

struct heroPowerstats : Decodable {
    let intelligence : Int
    let strength : Int
    let speed : Int
    let durability : Int
    let power : Int
    let combat : Int
}
