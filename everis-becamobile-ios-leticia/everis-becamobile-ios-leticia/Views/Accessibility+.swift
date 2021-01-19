//
//  Accessibility.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 19/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

import Foundation

extension DetalhesViewController {
    
    // MARK: - Accessibility
    func setAccessibility() {
        tituloLabel.isAccessibilityElement = true
        tituloLabel.accessibilityTraits = .header
        ratingLabel.adjustsFontForContentSizeCategory = true
        
        capaImagem.isAccessibilityElement = true
        capaImagem.accessibilityLabel = "Capa do filme"
        capaImagem.accessibilityTraits = .image
        
        descricaoLabel.isAccessibilityElement = true
        descricaoLabel.font = .preferredFont(forTextStyle: .body)
        descricaoLabel.adjustsFontForContentSizeCategory = true
        
        ratingLabel.isAccessibilityElement = true
        ratingLabel.adjustsFontForContentSizeCategory = true
        
        
        // accessibilityHint - serve para explicar para o usuário o que ele deve fazer, Ex: se for um botão diga que ele deve clicar duas vezes para curtir a foto.
        
        // self.accessibilityElements = [tituloLabel, capaImagem] para definir em que ordem serão lidos os elementos da tela
        
    }
    
}
