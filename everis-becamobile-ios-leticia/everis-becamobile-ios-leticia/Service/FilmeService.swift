//
//  FilmeService.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 13/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

import UIKit
import Alamofire

protocol FilmeServiceProtocol {
    func recuperaTendenciasServidor(completion:@escaping() -> Void)
    func recuperaDetalhesServidor(_ tendencia:Tendencia, completion:@escaping() -> Void)
}

class FilmeService: FilmeServiceProtocol {
    
    func recuperaTendenciasServidor(completion:@escaping() -> Void) {
        Alamofire.request("https://api.themoviedb.org/3/trending/all/week?api_key=4d3af2ecd868ddee8ae767825e9a0d64&language=pt-BR", method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                if let resposta = response.result.value as? Dictionary<String, Any> {
                    guard let listaDeTendencias = resposta["results"] as? Array<Dictionary<String, Any>> else { return }
                    for dicionarioTendencia in listaDeTendencias {
                        TendenciaDAO().salvaTendencia(dicionarioDeTendencia: dicionarioTendencia)
                    }
                    completion()
                }
                
                break
            case .failure:
                print(response.error!)
                completion()
                break
            }
        }
    }
    
    func recuperaDetalhesServidor(_ tendencia:Tendencia, completion:@escaping() -> Void) {
        guard let mediaType = tendencia.media_type else { return }
        
        Alamofire.request("https://api.themoviedb.org/3/\(mediaType)/\(tendencia.id)?api_key=4d3af2ecd868ddee8ae767825e9a0d64&language=pt-BR", method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                if let resposta = response.result.value as? Dictionary<String, Any> {
                    DetalhesDAO().salvaDetalhes(dicionarioDeDetalhes: resposta)
                    completion()                }
                break
            case .failure:
                print(response.error!)
                completion()
                break
            }
        }
    }
    
}
