//
//  PreventionDataSource.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/19/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

class PreventionDataSource: NSObject{
    var prventions: [PreventionModel] = []
    
    func getPreventions(){
        let wash = PreventionModel(title: NSLocalizedString("wash your hand", comment: ""), image: "soap", more: [
            PreventionInfoModel(title: NSLocalizedString("Wash your hands frequently", comment: ""), description: [
                NSLocalizedString("Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water.", comment: ""),
                NSLocalizedString("Why? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands.", comment: "")
            ])
        ])
        let mask = PreventionModel(title: NSLocalizedString("wear a mask", comment: ""), image: "mask", more: [
            PreventionInfoModel(title: NSLocalizedString("When to use a mask", comment: ""), description: [
                NSLocalizedString("- If you are healthy, you only need to wear a mask if you are taking care of a person with suspected 2019-nCoV infection.", comment: ""),
                NSLocalizedString("- Wear a mask if you are coughing or sneezing.", comment: ""),
                NSLocalizedString("- Masks are effective only when used in combination with frequent hand-cleaning with alcohol-based hand rub or soap and water.", comment: ""),
                NSLocalizedString("- If you wear a mask, then you must know how to use it and dispose of it properly.", comment: "")
            ]),
            PreventionInfoModel(title: NSLocalizedString("How to put on, use, take off and dispose of a mask", comment: ""), description: [
                NSLocalizedString("- Before putting on a mask, clean hands with alcohol-based hand rub or soap and water.", comment: ""),
                NSLocalizedString("- Cover mouth and nose with mask and make sure there are no gaps between your face and the mask.", comment: ""),
                NSLocalizedString("- Avoid touching the mask while using it; if you do, clean your hands with alcohol-based hand rub or soap and water.", comment: ""),
                NSLocalizedString("- Replace the mask with a new one as soon as it is damp and do not re-use single-use masks.", comment: ""),
                NSLocalizedString("- To remove the mask: remove it from behind (do not touch the front of mask); discard immediately in a closed bin; clean hands with alcohol-based hand rub or soap and water.", comment: "")
            ])
        ])
        let distance = PreventionModel(title: NSLocalizedString("keep a distance", comment: ""), image: "fun", more: [
            PreventionInfoModel(title: NSLocalizedString("Maintain social distancing", comment: ""), description: [
                NSLocalizedString("Maintain at least 1 metre (3 feet) distance between yourself and anyone who is coughing or sneezing.", comment: ""),
                NSLocalizedString("Why? When someone coughs or sneezes they spray small liquid droplets from their nose or mouth which may contain virus. If you are too close, you can breathe in the droplets, including the COVID-19 virus if the person coughing has the disease.", comment: "")
            ])
        ])
        let face = PreventionModel(title: NSLocalizedString("avoid touching eyes, nose and mouth", comment: ""), image: "screaming", more: [
            PreventionInfoModel(title: NSLocalizedString("Avoid touching eyes, nose and mouth", comment: ""), description: [
                NSLocalizedString("Why? Hands touch many surfaces and can pick up viruses. Once contaminated, hands can transfer the virus to your eyes, nose or mouth. From there, the virus can enter your body and can make you sick.", comment: "")
            ])
        ])
        let hygiene = PreventionModel(title: NSLocalizedString("practice respiratory hygiene", comment: ""), image: "hygiene", more: [
            PreventionInfoModel(title: NSLocalizedString("Practice respiratory hygiene", comment: ""), description: [
                NSLocalizedString("Make sure you, and the people around you, follow good respiratory hygiene. This means covering your mouth and nose with your bent elbow or tissue when you cough or sneeze. Then dispose of the used tissue immediately.", comment: ""),
                NSLocalizedString("Why? Droplets spread virus. By following good respiratory hygiene you protect the people around you from viruses such as cold, flu and COVID-19.", comment: "")
            ])
        ])
        prventions = [wash, mask, distance, face, hygiene]
    }
}
extension PreventionDataSource: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.prventions.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreventionCellCollection.Identifier.preventionCellId.rawValue, for: indexPath) as! PreventionCollectionViewCell
        let prevention = self.prventions[indexPath.item]
        cell.set(prevention: prevention)
        return cell
    }
}
