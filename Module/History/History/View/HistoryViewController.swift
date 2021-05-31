//
//  HistoryViewController.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import UIKit
import Core
import NVActivityIndicatorView

class HistoryViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var loadingView: NVActivityIndicatorView!
    @IBOutlet var backIcon: UIImageView!
    @IBOutlet var ascendBG: UIView!
    @IBOutlet var descendBG: UIView!
    @IBOutlet var filterBG: UIView!
    @IBOutlet var ascendIcon: UIImageView!
    @IBOutlet var descenIcon: UIImageView!
    
    var dataSource = HistoryDataSource()
    var presenter: HistoryPresenter?
    var ascendSelect: Bool = true
    var descendSelect: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTabView()
        
        self.presenter?.loadHistoryThisWeek()
        self.presenter?.loadHistoryThisMonth()
        
        self.loadingView.color = #colorLiteral(red: 0.4625302553, green: 0.5670406818, blue: 0.9667261243, alpha: 1)
        self.loadingView.type = .ballRotateChase
        self.loadingView.startAnimating()
        self.backIcon.image = UIImage(named: "arrow-left", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        
        
        self.ascendBG.setShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), opacity: 0.1)
        self.descendBG.setShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), opacity: 0.1)
        self.filterBG.setShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), opacity: 0.1)
        
        self.ascendIcon.image = UIImage(named: "arrow-up-red", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        self.descenIcon.image = UIImage(named: "arrow-down", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)

    }
    
    func setupTabView() {
        self.dataSource.viewController = self
        
        self.tableView.register(UINib(nibName: "TransactionCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "TransactionCell")
        self.tableView.register(UINib(nibName: "TransactionCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "TransactionCell")
        
        self.tableView.dataSource = self.dataSource
        self.tableView.sectionIndexBackgroundColor = .none
        self.tableView.delegate = self.dataSource
    }
    
    @IBAction func backToHomeAction(_ sender: UITapGestureRecognizer) {
        self.presenter?.backToHome(viewController: self)
    }
    
    @IBAction func ascendAction(_ sender: UITapGestureRecognizer) {
        self.dataSource.filteredDataWeek = self.dataSource.historyThisWeek
        self.dataSource.filteredDataMonth = self.dataSource.historyThisMonth
        self.descendBG.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        if ascendSelect == true {
            self.ascendBG.backgroundColor = #colorLiteral(red: 0.3882352941, green: 0.4745098039, blue: 0.9568627451, alpha: 1)
            self.dataSource.filteredDataWeek.sort(by: { $0.name.lowercased() < $1.name.lowercased() })
            self.dataSource.filteredDataMonth.sort(by: { $0.name.lowercased() < $1.name.lowercased() })
            self.tableView.reloadData()
        } else {
            self.ascendBG.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.dataSource.filteredDataWeek = self.dataSource.historyThisWeek
            self.dataSource.filteredDataMonth = self.dataSource.historyThisMonth
            self.tableView.reloadData()
        }
        ascendSelect = !ascendSelect
    }
    
    @IBAction func descendAction(_ sender: UITapGestureRecognizer) {
        self.dataSource.filteredDataWeek = self.dataSource.historyThisWeek
        self.dataSource.filteredDataMonth = self.dataSource.historyThisMonth
        self.ascendBG.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        if descendSelect == true {

            self.descendBG.backgroundColor = #colorLiteral(red: 0.3882352941, green: 0.4745098039, blue: 0.9568627451, alpha: 1)
            self.dataSource.filteredDataWeek.sort(by: { $0.name.lowercased() > $1.name.lowercased() })
            self.dataSource.filteredDataMonth.sort(by: { $0.name.lowercased() > $1.name.lowercased() })
            self.tableView.reloadData()
        } else {
            self.descendBG.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.dataSource.filteredDataWeek = self.dataSource.historyThisWeek
            self.dataSource.filteredDataMonth = self.dataSource.historyThisMonth
            self.tableView.reloadData()
        }
        descendSelect = !descendSelect
    }
}

extension HistoryViewController: HistoryView {
    func showHistoryThisWeek(historiesThisWeek: [TransactionEntity]) {
        DispatchQueue.main.async {
            self.dataSource.historyThisWeek = historiesThisWeek
            self.tableView.reloadData()
            self.loadingView.stopAnimating()
        }
    }
    func showHistoryThisMonth(historiesThisMonth: [TransactionEntity]) {
        DispatchQueue.main.async {
            self.dataSource.historyThisMonth = historiesThisMonth
            self.tableView.reloadData()
            self.loadingView.stopAnimating()
        }
    }
}
