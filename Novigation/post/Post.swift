//
//  Post.swift
//  Novigation
//
//  Created by Sergey Petrusin on 18.05.2023.
//


import UIKit

struct Post {
    let author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    var isLike = false
    
    static func createPost() -> [Post] {
        var post = [Post]()
        
    post.append(Post(author: "Автор1", description: "Текст автора 1", image: "image1", likes: 1, views: 5))
    post.append(Post(author: "Автор2", description: "Текст автора 2", image: "image2", likes: 2, views: 6))
    post.append(Post(author: "Автор3", description: "Текст автора 3", image: "image3", likes: 3, views: 7))
    post.append(Post(author: "Автор4", description: "Текст автора 4", image: "image4", likes: 4, views: 8))
    return post
    }

}
