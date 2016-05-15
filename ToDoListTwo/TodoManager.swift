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
    
//    func readTodo () -> TodoList?{
//        
//        var list = TodoList?()
//        
//        if database != nil {
//            do {
//                for todo in try database!.prepare(toDo)  {
////                    toDo.filter(title != nil, completed != nil, completed != nil, picture != nil, duration != nil, backgroundColor != nil, inProgress != nil, description != nil, rowNumber != nil)
//                    let item = TodoItem.init(title: todo[title]!, completed: todo[completed]!, picture: todo[picture]!, duration: todo[duration]!, backgroundColor: todo[backgroundColor]!, inProgress: todo[inProgress]!, description: todo[description]!, rowNumber: todo[rowNumber]!)
//                    list = TodoList.init(title: todo[title]!, todos: [item])
//                    list!.appendTodo(item)
//                }
//            } catch {
//                print("Could not retrieve data from database: \(error)")
//            }
//        }
//        return list
//    }

    func writeTodo (titel: String, complete: Bool, pic: String, dura: Int, backgr: String, progress: Bool, desc: String, row: Int) {
        
        let insert = toDo.insert(title <- titel, completed <- complete, picture <- pic, duration <- dura, backgroundColor <- backgr, description <- desc, rowNumber <- row)
        do {
            let rowID = try database!.run(insert)
            print (rowID)
        } catch {
            print("Error creating to do: \(error)")
        }
        
    }

}






