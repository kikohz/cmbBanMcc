//
//  User.swift
//  App
//
//  Created by Bllgo on 2018/4/16.
//
import Foundation
import Vapor
import FluentMySQL

final class User: MySQLModel {
    var id: Int?

    var username:String
    var email:String
    var password:String
    var mcc:String
    
    init(usermane:String,email:String,password:String,mcc:String) {
        self.username = usermane
        self.email = email
        self.password = password
        self.mcc = mcc
    }
}

extension User: Migration {}
