//
//  Post.swift
//  Navigation
//
//  Created by Sergey Bersenev on 10.06.2023.
//

import UIKit

struct Post {
    let author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    static func doPost() -> [Post] {
        var post = [Post]()
    post.append(Post(author: "Мейн-ку́н",
                     description: "Мейн-ку́н (англ. Maine Coon) — порода кошек, которая произошла от кошек штата Мэн на северо-востоке США. Аборигенная порода кошек Северной Америки.",
                     image: "1", likes: 1,
                     views: 2))
    post.append(Post(author: "Шотла́ндская вислоу́хая",
                     description: "Шотла́ндская вислоу́хая ко́шка или ско́ттиш-фолд (англ. Scottish Fold) — порода домашних кошек с характерными загнутыми вперёд и вниз ушами, что вызвано действием доминантного гена, который возник в результате естественной мутации и оказывающий влияние на хрящи во всём организме. Это придаёт голове кошки характерный вид, которую часто описывают как «похожую на совиную»[1].",
                     image: "2", likes: 1,
                     views: 2))
    post.append(Post(author: "Британская кошка",
                     description: "Британская короткошёрстная кошка  — порода домашней кошки. По одной версии является потомком породы Шартрез, а по другой, римских кошек и местных сородичей.",
                     image: "3", likes: 1,
                     views: 2))
    post.append(Post(author: "Бенгальская кошка",
                     description: "Бенгальская кошка, бенгал — межродовой гибрид домашней кошки (Felis catus) и собственно бенгальской кошки (Prionailurus bengalensis).",
                     image: "4", likes: 1,
                     views: 2))
    return post
    }
}
