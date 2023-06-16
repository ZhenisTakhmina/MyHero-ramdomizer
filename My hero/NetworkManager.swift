//
//  NetworkManager.swift
//  My hero
//
//  Created by Takhmina on 09.12.2022.
//

import Foundation
import Alamofire

protocol NetworkManagerDelegate {
    func updateHeroModel(with version : MyHeroResponseModel)
}

struct NetworkManager{
    
    var delegate : NetworkManagerDelegate?

    func getMyHero (by id : Int){
        let url = "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/id/\(id).json"
        AF.request(url).responseDecodable(of: MyHeroResponseModel.self) {response in
            switch response.result{
            case .success(let heroModel):
                delegate?.updateHeroModel(with: heroModel)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
       
        
    }
}
