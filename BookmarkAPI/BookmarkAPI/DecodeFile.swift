//
//  DecodeFile.swift
//  BookmarkAPI
//
//  Created by Vasiliy Shannikov on 27.01.2022.
//

import Foundation

struct ApiRequst: Decodable {
    var laureates: [Laureate]
}
struct Laureate: Decodable {
    var id:String?
    var knownName: KnownName?
    var givenName: GivenName?
    var familyName: FamilyName?
    var fullName: FullName?
    var fileName: String?
    var gender: String?
    var birth: Birth?
    var wikipedia: Wikipedia?
}

struct KnownName: Decodable {
    var en: String?
    var se: String?
}

struct GivenName: Decodable {
    var en: String
    var se: String
}

struct FamilyName: Decodable {
    var en: String
    var se: String
}

struct FullName: Decodable {
    var en: String
    var se: String
}

struct Birth: Decodable {//******************
    var date: String
    var place: Place
}

struct Place: Decodable {//******************
    var city: City?
    var country: Country?
    var cityNow: CityNow?
    var countryNow: CountryNow?
    var continent: Continent?
    var locationString: LocationString?
}

struct City: Decodable {
    var en: String?
    var no: String?
    var se: String?
}

struct Country: Decodable {
    var en: String?
    var no: String?
    var se: String?
}

struct CityNow: Decodable {
    var en: String?
    var no: String?
    var se: String?
    var sameAs: [String]?
}

struct CountryNow: Decodable {
    var en: String
    var no: String
    var se: String
    var sameAs: [String]?
}

struct Continent: Decodable {
    var en: String
    var no: String
    var se: String
}

struct LocationString: Decodable {
    var en: String
    var no: String
    var se: String
}

struct Wikipedia: Decodable {
    var slug: String
    var english: String
}


