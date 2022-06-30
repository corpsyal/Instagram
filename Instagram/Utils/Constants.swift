//
//  Constants.swift
//  Instagram
//
//  Created by Anthony Lahlah on 10.04.22.
//

import Firebase

let FIRESTORE_USERS_COLLECTION = Firestore.firestore().collection("users")
let FIRESTORE_FOLLOWS_COLLECTION = Firestore.firestore().collection("follows")
let FIRESTORE_POSTS_COLLECTION = Firestore.firestore().collection("posts")

let FIRESTORE_POST_LIKES_COLLECTION = "likes"
let FIRESTORE_USER_LIKES_COLLECTION = "likes"
let FIRESTORE_USER_NOTIFICATIONS_COLLECTION = "notifications"

let FIRESTORE_POST_COMMENTS_COLLECTION = "comments"
