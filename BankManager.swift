//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private let bank = Bank(bankClerk: BankClerk(), customerCount: Int.random(in: 10...30))
    
    func startBank() {
        bank.start()
    }
}
