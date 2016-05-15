//
//  TodoManager.swift
//  ToDoListTwo
//
//  Created by Jidde Koekoek on 11/05/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//

import Foundation
import SQLite

class TodoManager {
    
    static let sharedInstance = TodoManager()
    
    // MARK: SQLite database
    private var database: Connection?
    
    private let toDo = Table("ToDo")
    private let id = Expression<Int64>("id")
    private let title = Expression<String?>("title")
    private let completed = Expression<Bool?>("completed")
    private let picture = Expression<String?>("picture")
    private let duration = Expression<Int?>("duration")
    private let backgroundColor = Expression<String?>("backgroundColor")
    private let inProgress = Expression<Bool?>("inProgress")
    private let description = Expression<String?>("description")
    private let rowNumber = Expression<Int?>("rowNumber")
    
    
    func connectToDatabase () {
    
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!

        do {
            database = try Connection("\(path)/db.sqlite3")
        } catch {
            print ("Cannot connect to database: \(error)")
        }
    }
    
    func createTable () {
        
        do {
            try database!.run(toDo.create(ifNotExists: true) { t in
                t.column(id, primaryKey: .Autoincrement)
                t.column(title)
                t.column(completed)
                t.column(picture)
                t.column(duration)
                t.column(backgroundColor)
                t.column(inProgress)
                t.column(description)
                t.column(rowNumber)
                } )
        } catch {
            print ("Cannot create table: \(error)")
        }
        
    }
    
    func readTodo () {
        
        if database != nil {
            do {

                for todo in try database!.prepare(toDo) {
                    
                    let item = TodoItem.init(title: todo[title]!, completed: todo[completed]!, picture: todo[picture]!, duration: todo[duration]!, backgroundColor: todo[backgroundColor]!, inProgress: todo[inProgress]!, description: todo[description]!, rowNumber: todo[rowNumber])
                    
                    let list = TodoList.init(title: todo[title]!, todos: [item])
                    list.appendTodo(item)
                }
            } catch {
                print("Could not retrieve data from database: \(error)")
            }
        }
    }

//    func writeTodo (title: String, completed: Bool, picture: String, duration: Int, backgroundColor: String, inProgress: Bool, description: String, rowNumber: Int) {
//        
//        let insert = toDo.insert(title <- title, completed <- completed, picture <- picture, duration <- duration, backgroundColor <- backgroundColor, description <- description, rowNumber <- rowNumber)
//        do {
//            let rowID = try database!.run(insert)
//            print (rowID)
//        } catch {
//            print("Error creating to do: \(error)")
//        }
//        
//    }

}





