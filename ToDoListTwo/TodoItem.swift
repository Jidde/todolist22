//
//  TodoItem.swift
//  ToDoListTwo
//
//  Created by Jidde Koekoek on 11/05/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//

import Foundation

class TodoItem {
    
    private var title: String?
    private var completed: Bool?
    private var picture: String?
    private var duration: Int?
    private var backgroundColor: String?
    private var inProgress: Bool?
    private var description: String?
    
    init (title: String, completed: Bool, picture: String, duration: Int, backgroundColor: String, inProgress: Bool, description: String) {
        
        self.title = title
        self.completed = completed
        self.picture = picture
        self.duration = duration
        self.backgroundColor = backgroundColor
        self.inProgress = inProgress
        self.description = description
        
    }
}

