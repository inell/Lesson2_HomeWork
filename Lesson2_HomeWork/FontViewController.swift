//
//  ViewController.swift
//  Lesson2_HomeWork
//
//  Created by PetroKov on 14.04.16.
//  Copyright © 2016 PetroKov. All rights reserved.
//

import UIKit

class FontViewController: UIViewController {

    
    @IBOutlet weak var fontTableView: UITableView!
    
    var model:[[String]] = [] {
        //афтерсеттер для поля. Когда его задаем - обновляет tableView
        didSet{
            self.fontTableView.reloadData()
        }
    }
    var sectionTitles:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fontTableView.dataSource = self
        self.model = self.getFonts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Получим список шрифтов
    func getFonts() -> [[String]]{
        var fonts:[[String]] = []
        
        let fontFamilyNames = UIFont.familyNames()
        for familyName in fontFamilyNames{
            sectionTitles.append(familyName)
            var familyContent:[String] = []
            
            let fontNames = UIFont.fontNamesForFamilyName(familyName)
            for fontName in fontNames{
                familyContent.append(fontName)
            }
            
            fonts.append(familyContent)
        }
        
        return fonts
    }

}

// Реализация протокола для UITableViewDataSource
extension FontViewController:UITableViewDataSource{
    
    //Заголовок секции
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(self.sectionTitles[section]) (\(self.model[section].count))"
    }
    
    //Количество секций
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.model.count
    }
    
    //Количество строк в секции
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model[section].count
    }
    
    //Подготовить ячейку для вывода
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "templateForFontRow"
        let cell = self.fontTableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        
        let stringIndex = indexPath.row
        let section = indexPath.section
        
        let text = self.model[section][stringIndex]
        let label:UILabel? = cell?.textLabel
        label?.text = text
        label?.font = UIFont(name: text, size: 14)!
        
        return cell!
    }
}