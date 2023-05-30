//
//  PostImages.swift
//  Novigation
//
//  Created by Sergey Petrusin on 30.05.2023.
//


import UIKit

struct PostImages {
    
    var image: String
    
    static func maketPost() -> [PostImages] {
        
        var post = [PostImages]()
        post.append(PostImages(image: "1"))
        post.append(PostImages(image: "2"))
        post.append(PostImages(image: "3"))
        post.append(PostImages(image: "4"))
        post.append(PostImages(image: "5"))
        post.append(PostImages(image: "6"))
        post.append(PostImages(image: "7"))
        post.append(PostImages(image: "8"))
        post.append(PostImages(image: "9"))
        post.append(PostImages(image: "10"))
        post.append(PostImages(image: "11"))
        post.append(PostImages(image: "12"))

        return post
    }
}
