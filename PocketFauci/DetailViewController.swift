//
//  DetailViewController.swift
//  PocketFauci
//
//  Created by Danny Park on 4/19/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var stateImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positiveLabel: UILabel!
    @IBOutlet weak var currentHospLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    
    var stateData: StateData!
    
    let stateAbbreviations = ["AL": "alabama",
                              "AK": "alaska",
                              "AS": "american-samoa",
                              "AZ": "arizona",
                              "AR": "arkansas",
                              "CA": "california",
                              "CO": "colorado",
                              "CT": "connecticut",
                              "DC": "washington-dc",
                              "DE": "delaware",
                              "FL": "florida",
                              "GA": "georgia",
                              "GU": "guam",
                              "HI": "hawaii",
                              "ID": "idaho",
                              "IL": "illinois",
                              "IN": "indiana",
                              "IA": "iowa",
                              "KS": "kansas",
                              "KY": "kentucky",
                              "LA": "louisiana",
                              "ME": "maine",
                              "MD": "maryland",
                              "MA": "massachusetts",
                              "MI": "michigan",
                              "MN": "minnesota",
                              "MS": "mississippi",
                              "MO": "missouri",
                              "MP": "mariana-islands",
                              "MT": "montana",
                              "NE": "nebraska",
                              "NV": "nevada",
                              "NH": "new-hampshire",
                              "NJ": "new-jersey",
                              "NM": "new-mexico",
                              "NY": "new-york",
                              "NC": "north-carolina",
                              "ND": "north-dakota",
                              "OH": "ohio",
                              "OK": "oklahoma",
                              "OR": "oregon",
                              "PA": "pennsylvania",
                              "RI": "rhode-island",
                              "SC": "south-carolina",
                              "SD": "south-dakota",
                              "TN": "tennessee",
                              "TX": "texas",
                              "UT": "utah",
                              "VT": "vermont",
                              "VA": "virginia",
                              "VI": "us-virgin-islands",
                              "WA": "washington",
                              "WV": "west-virginia",
                              "WI": "wisconsin",
                              "WY": "wyoming"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var stateName = stateAbbreviations[stateData.state] ?? ""
        print(stateName)
        stateName = stateName.capitalized
        stateName = stateName.replacingOccurrences(of: "-", with: " ")
        stateName = stateName.replacingOccurrences(of: "Dc", with: "DC")
        
        
//        if stateData == nil {
//            stateData = StateData(state: "??", positive: 000)
//        }
        
        nameLabel.text = stateName
        positiveLabel.text = formatNumberWithCommas(number: stateData.positive)
        currentHospLabel.text = formatNumberWithCommas(number: stateData.hospitalizedCurrently ?? 0)
        deathsLabel.text = formatNumberWithCommas(number: stateData.death)

        
        let stateString = stateAbbreviations[stateData.state] ?? ""
        let imageUrlString = "https://cdn.civil.services/us-states/maps/\(stateString)-large.png"
        print("Image Url = \(imageUrlString)")
        
        guard let url = URL(string: imageUrlString) else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            self.stateImageView.image = UIImage(data: data)
        } catch {
            print ("error")
        }
        
    }
    
    func formatNumberWithCommas(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: number))
        else {return ""}
        return "\(formattedNumber)"
    }
    



}
