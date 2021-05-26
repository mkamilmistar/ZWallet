//
//  ContactResponse.swift
//  Core
//
//  Created by MacBook on 26/05/21.
//

import Foundation

public struct GetContactResponse: Codable {
    public var status: Int
    public var data: [GetContactDataResponse]
}
