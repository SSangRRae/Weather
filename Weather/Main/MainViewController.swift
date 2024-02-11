//
//  MainViewController.swift
//  Weather
//
//  Created by SangRae Kim on 2/9/24.
//

import UIKit

class MainViewController: UIViewController {
    let mainView = MainView()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(NowTableViewCell.self, forCellReuseIdentifier: "now")
        mainView.tableView.register(ThreeTimeTableViewCell.self, forCellReuseIdentifier: "threeTime")
        mainView.tableView.register(FiveDayTableViewCell.self, forCellReuseIdentifier: "fiveDay")
        mainView.tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: "location")
        
        requestToOpenWeather()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainSection.allCases[section].numberOfRows
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return MainSection.allCases[section].headerTitle
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MainSection.allCases[indexPath.section].heightForRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "now", for: indexPath) as! NowTableViewCell
            if let item = WeatherData.shared.nowWeather {
                cell.configureViews(item)
            }
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "threeTime", for: indexPath) as! ThreeTimeTableViewCell
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            cell.collectionView.register(ThreeTimeCollectionViewCell.self, forCellWithReuseIdentifier: "threeTimeCol")
            cell.collectionView.reloadData()
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "fiveDay", for: indexPath) as! FiveDayTableViewCell
            cell.configureViews(WeatherData.shared.fiveDayWeather[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "location", for: indexPath) as! LocationTableViewCell
            return cell
        }
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let item = WeatherData.shared.forecastWeather else {
            return 0
        }
        return item.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "threeTimeCol", for: indexPath) as! ThreeTimeCollectionViewCell
        if let item = WeatherData.shared.forecastWeather {
            cell.configureViews(item.list[indexPath.item])
        }
        return cell
    }
}

extension MainViewController {
    func requestToOpenWeather() {
        let group = DispatchGroup()
        
        group.enter()
        OpenWeatherManager.shared.fetchToOpenWeather(api: .now(cityID: "1835847"), type: WeatherInfo.self) { weatherInfo in
            WeatherData.shared.nowWeather = weatherInfo
            group.leave()
        }
        
        group.enter()
        OpenWeatherManager.shared.fetchToOpenWeather(api: .forecast(cityID: "1835847"), type: ForecastWeatherInfo.self) { forecast in
            WeatherData.shared.forecastWeather = forecast
            group.leave()
        }
        
        group.notify(queue: .main) {
            self.fiveDayData()
            self.mainView.tableView.reloadData()
        }
    }
    
    func fiveDayData() {
        guard let data = WeatherData.shared.forecastWeather else {
            return
        }
        for list in data.list {
            guard let date = list.dateTime else {
                return
            }
            let hour = DateFunctions().dateTimeFormattingToHour(date)
            if hour == "00" {
                WeatherData.shared.fiveDayWeather.append(list)
            }
        }
    }
}
