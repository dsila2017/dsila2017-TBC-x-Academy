//
//  Model.swift
//  UICollectionView
//
//  Created by David on 11/3/23.
//

import UIKit

enum Genre {
    case Action, Adventure, Horror, Comedy
}

final class Movie {
    var name: String
    var image: UIImage?
    var favourite: Bool?
    var genre: Genre
    var rating: Double
    var certificate: String?
    var runtime: Double?
    var release: Int?
    var director: String?
    var cast: String?
    var description: String?
    
    init(name: String, image: UIImage? = nil, favourite: Bool? = nil, genre: Genre, rating: Double, certificate: String? = nil, runtime: Double? = nil, release: Int? = nil, director: String? = nil, cast: String? = nil, description: String? = nil) {
        self.name = name
        self.image = image
        self.favourite = favourite
        self.genre = genre
        self.rating = rating
        self.certificate = certificate
        self.runtime = runtime
        self.release = release
        self.director = director
        self.cast = cast
        self.description = description
    }
    
    static let movies = [
        Movie(name: "Batman", image: UIImage(named: "Batman"), favourite: false, genre: .Action, rating: 8.1, certificate: "PG-13", runtime: 3.0, release: 2022, director: "Matt Reeves", cast: "Robert Pattinson as Bruce Wayne / Batman alongside Zoë Kravitz, Paul Dano, Jeffrey Wright, John Turturro, Peter Sarsgaard, Andy Serkis, and Colin Farrell.", description: "Batman was originally introduced as a ruthless vigilante who frequently killed or maimed criminals, but evolved into a character with a stringent moral code and strong sense of justice. Unlike most superheroes, Batman does not possess any superpowers, instead relying on his intellect, fighting skills, and wealth."),
        Movie(name: "Uncharted", image: UIImage(named: "Uncharted"), favourite: false, genre: .Adventure, rating: 7.9, certificate: "PG-13", runtime: 1.56, release: 2022, director: "Ruben Fleischer", cast: "Tom Holland · Nathan Drake ; Mark Wahlberg · Victor Sullivan ; Antonio Banderas · Santiago Moncada ; Sophia Ali · Chloe Frazer ; Tati Gabrielle.", description: "Street-smart Nathan Drake is recruited by seasoned treasure hunter Victor 'Sully' Sullivan to recover a fortune amassed by Ferdinand Magellan, and lost 500 years ago by the House of Moncada."),
        Movie(name: "The Exorcism of God", image: UIImage(named: "The Exorcism of God"), favourite: false, genre: .Horror, rating: 5.6, certificate: "PG-13", runtime: 1.39, release: 2021, director: "Alejandro Hidalgo", cast: "Hector Kotsifakis · Dr. Nelson ; Will Beinbrink · Father Peter Williams ; Oscar Flores · Juan ; Irán Castillo · Magali ; Patricia Rojas · Old lady.", description: "Peter Williams is an American priest in Mexico who's considered a saint by many local parishioners. However, due to a botched exorcism, he carries a dark secret that's eating him alive until he gets an opportunity to face his own demon one last time."),
        Movie(name: "Turning Red", image: UIImage(named: "Turning Red"), favourite: false, genre: .Comedy, rating: 7.1, certificate: "PG-13", runtime: 1.40, release: 2022, director: "Domee Shi", cast: "Rosalie Chiang · Meilin ; Sandra Oh · Ming ; Ava Morse · Miriam ; Hyein Park · Abby ; Maitreyi Ramakrishnan", description: " A thirteen-year-old girl named Mei Lee is torn between staying her mother's dutiful daughter and the changes of adolescence. And as if the challenges were not enough, whenever she gets overly excited she transforms into a giant red panda."),
        Movie(name: "Spider-Man: No Way Home", image: UIImage(named: "Spider-Man No Way Home"), favourite: false, genre: .Action, rating: 8.1, certificate: "PG-13", runtime: 2.28, release: 2021, director: "Jon Watts", cast: "Tom Holland · Peter Parker ; Zendaya · MJ ; Benedict Cumberbatch · Doctor Strange ; Jacob Batalon · Ned Leeds ; Jon Favreau · Happy Hogan.", description: "When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man. Peter Parker's secret identity is revealed to the entire world. Desperate for help, Peter turns to Doctor Strange to make the world forget that he is Spider-Man."),
        Movie(name: "Morbius", image: UIImage(named: "Morbius"), favourite: false, genre: .Action, rating: 5.3, certificate: "PG-13", runtime: 1.48, release: 2022, director: "Daniel Espinosa", cast: "Jared Leto · Dr. Michael Morbius ; Matt Smith · Milo ; Adria Arjona · Martine Bancroft ; Jared Harris · Dr. Emil Nicholas ; Tyrese Gibson.", description: "A scientist suffering from a rare blood disease whose attempts to cure himself afflict him with a form of transgenic vampirism, gaining all of the superhuman abilities but none of the superstitious weaknesses associated with vampires.")
    ]
}
