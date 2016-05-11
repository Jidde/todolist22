//
//  Model.swift
//  ToDoListTwo
//
//  Created by Jidde Koekoek on 11/05/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//

import Foundation

class TodoList {
    
    private var title: String?
    private var todos = [TodoItem]()
    
    init (title: String, todos: [TodoItem]) {
        self.title = title
        self.todos = todos
    }

}












