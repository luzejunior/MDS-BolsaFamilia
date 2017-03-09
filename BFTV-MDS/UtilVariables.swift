//
//  UtilVariables.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 12/02/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

import Foundation

class UtilVariables{
    
    public static var nisNumber = "10120380142" //Variable to store User NIS Number.
    public static var userName = "Josefa Taveira" //Variable to store User Name.
    public static var isNisValid: Bool = false

    private static let noticia1 = News(
                        _date: "17/01/2017",
                        _title: "Um Simples Gesto Pode Salvar Vidas",
                        _mainText: "Dengue, Chikungunya e Zika - Prevenção continua sendo o melhor remédio, converse com toda a sua familia e ajude a eliminar os criadouros do mosquito e de transmissão, não deixando o mosquito nascer")
    
    private static let noticia2 = News(
                        _date: "27/10/2016",
                        _title: "O Programa Bolsa Familia e a Erradicação da Pobreza",
                        _mainText: "O Bolsa Familia contribui para combater a pobreza e desigualdade no Brasil. As condicionalidades do Programa reforçam o acesso a educação, saúde e a assistencia social, oferecendo condições para as futuras gerações quebrarem o ciclo da pobreza, graças a melhores oportunidades de inclusão social.")
    
    public static var noticias = [noticia1, noticia2]
    
    private static let warning1 = Messages(_type: "AVISO MUITA URGÊNCIA",
                                           _title: "ATUALIZAÇÃO CADASTRAL",
                                           _date: "14/02/2017",
                                           _mainText: "- ATENCAO - MENSAGEM IMPORTANTE - PROCURE O SETOR RESPONSAVEL PELO BOLSA FAMILIA E CADASTRO UNICO DE SUA CIDADE PARA ATUALIZAR SEU CADASTRO. INFORME CORRETAMENTE A RENDA E O TRABALHO DE TODAS AS PESSOAS DE SUA FAMILIA. VA ATE 17 DE JULHO DE 2015 E EVITE O BLOQUEIO DE SEU BENEFICIO. PARA MAIS INFORMACOES LIGUE PARA O MDS - 0800 707 2003 MOTIVO - AVERIGUACAO CADASTRAL 2015")
    
    public static var mensagens = [warning1]
}
