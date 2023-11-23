//
//  ContentViewModel.swift
//  examen
//
//  Created by Rodrigo Terán Hernández on 23/11/23.
//

import Foundation

import Foundation

class ContentViewModel: ObservableObject {
    @Published var list = [UserBase]()
    
    var listRequirement: UserListRequirementProtocol

    init(
        listRequirement: UserListRequirementProtocol = UserListRequirement.shared
    ) {
        self.listRequirement = listRequirement
    }
    
    @MainActor
    func geElementList() async {
        let result = await listRequirement.geElementList()
        if (result == nil) {
            return
        }
        let usersData: ListUsersData = ListUsersData(users: result!.data.users)
        
        for user in usersData.users {
            let goodUser = UserBase(id: user._id, _id: user._id, firstName: user.firstName)
            self.list.append(goodUser)
        }
    }
}
