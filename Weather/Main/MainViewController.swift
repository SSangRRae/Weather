//
//  MainViewController.swift
//  Weather
//
//  Created by SangRae Kim on 2/9/24.
//

import UIKit

class MainViewController: UIViewController {
    let mainView = MainView()
    
    var cityID = "1835847"
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        requestToOpenWeather(cityID: cityID)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return MainSection.allCases.count
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
            cell.collectionView.tag = 1
            cell.collectionView.reloadData()
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "fiveDay", for: indexPath) as! FiveDayTableViewCell
            cell.configureViews(WeatherData.shared.fiveDayWeather[indexPath.row])
            return cell
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "location", for: indexPath) as! LocationTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "etc", for: indexPath) as! EtcTableViewCell
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            cell.collectionView.register(EtcCollectionViewCell.self, forCellWithReuseIdentifier: "etcCol")
            cell.collectionView.tag = 4
            cell.collectionView.reloadData()
            return cell
        }
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            guard let item = WeatherData.shared.forecastWeather else {
                return 0
            }
            return item.list.count
        }
        return WeatherData.shared.etcData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "threeTimeCol", for: indexPath) as! ThreeTimeCollectionViewCell
            if let item = WeatherData.shared.forecastWeather {
                cell.configureViews(item.list[indexPath.item])
            }
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "etcCol", for: indexPath) as! EtcCollectionViewCell
        cell.configureViews(WeatherData.shared.etcData[indexPath.item], row: indexPath.item)
        return cell
    }
}

extension MainViewController {
    func configureViews() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(NowTableViewCell.self, forCellReuseIdentifier: "now")
        mainView.tableView.register(ThreeTimeTableViewCell.self, forCellReuseIdentifier: "threeTime")
        mainView.tableView.register(FiveDayTableViewCell.self, forCellReuseIdentifier: "fiveDay")
        mainView.tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: "location")
        mainView.tableView.register(EtcTableViewCell.self, forCellReuseIdentifier: "etc")
        mainView.listButton.addTarget(self, action: #selector(listButtonClicked), for: .touchUpInside)
    }
    func requestToOpenWeather(cityID: String) {
        let group = DispatchGroup()
        
        group.enter()
        OpenWeatherManager.shared.fetchToOpenWeather(api: .now(cityID: cityID), type: WeatherInfo.self) { weatherInfo, error  in
            if error == nil {
                WeatherData.shared.nowWeather = weatherInfo
            } else {
                let alert = UIAlertController(title: "네트워크 오류", message: "잠시 후 다시 시도해주세요", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "취소", style: .cancel)
                alert.addAction(cancel)
                self.present(alert, animated: true)
            }
            
            group.leave()
        }
        
        group.enter()
        OpenWeatherManager.shared.fetchToOpenWeather(api: .forecast(cityID: cityID), type: ForecastWeatherInfo.self) { forecast, error  in
            if error == nil {
                WeatherData.shared.forecastWeather = forecast
            } else {
                let alert = UIAlertController(title: "네트워크 오류", message: "잠시 후 다시 시도해주세요", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "취소", style: .cancel)
                alert.addAction(cancel)
                self.present(alert, animated: true)
            }
            group.leave()
        }
        
        group.notify(queue: .main) {
            self.fiveDayData()
            self.etcData()
            self.mainView.tableView.reloadData()
        }
    }
    
    func etcData() {
        var list: [String] = []
        
        if let item = WeatherData.shared.nowWeather {
            list.append("\(item.wind.speed)m/s")
            list.append("\(item.clouds.all)%")
            list.append("\(item.main.pressure.formatted())hpa")
            list.append("\(item.main.humidity)%")
        }
        
        WeatherData.shared.etcData = list
    }
    
    func fiveDayData() {
        var tempList: [WeatherInfo] = []
        guard let data = WeatherData.shared.forecastWeather else {
            return
        }
        for list in data.list {
            guard let date = list.dateTime else {
                return
            }
            let hour = DateFunctions().dateTimeFormattingToHour(date)
            if hour == "00" {
                tempList.append(list)
            }
        }
        WeatherData.shared.fiveDayWeather = tempList
    }
    
    @objc func listButtonClicked() {
        let vc = SearchViewController()
        vc.pushData = { cityID in
            self.cityID = cityID
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
