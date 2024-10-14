//
//  ToDoListItemsViewViewModel.swift
//  ToDoList
//
//  Created by mac on 07/10/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

///  ViewModel for single todo list item view (each row in items list)
class ToDoListItemsViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
