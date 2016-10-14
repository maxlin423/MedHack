//
//  ViewController.swift
//  MedHack
//
//  Created by Max Lin on 10/11/16.
//  Copyright © 2016 Max Lin. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var barView: BarChartView!
    
    class ChartStringFormatter: NSObject, IAxisValueFormatter {
        //implement the interface
        func stringForValue(_ value: Double,
                            axis: AxisBase?) -> String
        {
            var months: [String] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
            return String(describing: months[Int(value)])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let units = [1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0]
        
        setBarChart(values: units)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setBarChart(values: [Double]) {
        barView.noDataText = "Data needed"
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<values.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            
            dataEntries.append(dataEntry)
        }
        
        //Add formatter
        let xAxis = barView.xAxis
        xAxis.valueFormatter = ChartStringFormatter()
        xAxis.granularity = 1

        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units")
        let chartData = BarChartData(dataSet: chartDataSet)
        barView.data = chartData
        
    }
}

