require 'rubygems'
require 'nokogiri'                          # gem pour traduire le HTML
require 'open-uri'                          # gem pour réaliser l'opération sur des pages en ligne
require 'pry'

def get_cityhall_url

  puts "SILENCE !!!! ça bosse !! Je commence par récupérer les urls de chaque mairie"

  urls_cityhall = Array.new

    page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))     # page à scrapper


    ad_lien = page.xpath("//a[@class='lientxt']")     #ici on récupère tous les "urls" du Val D'Oise dans un hash

    #puts ad_lien[0].values[1]    verif OK !
    #puts ad_lien.length          185 ==> OK !
     
        adr = "http://annuaire-des-mairies.com"       # ce qui manque sur chacun des urls récup !
    	                                              
        n=0
    #puts ad_lien[0].values[1].class   ==> string OK !

	urls_cityhall =  ad_lien.map { |n| n.values[1].delete_prefix ('.')}.map{ |n| n= adr + n} # map pour supprimer les . et rajouter le bout de string qui manque !

		
    # puts urls_cityhall    OK !
	puts "adresses url colléctées !!"

		return urls_cityhall
end

def get_mail_cityhall(townhall_url)
 
 	page = Nokogiri::HTML(open(townhall_url))                   # ouvrir la bonne page web !

	ad_lien = page.xpath("//section[2]/div/table/tbody/tr[4]/td[2]")  # recuperation de l'adresse mail !

	return ad_lien.text            


end



def get_mailing_list

   url_list = get_cityhall_url

   email_list = []

   url_list.size.times do |url|                       # on va répéter l'action pour toutes les urls collectées au stade 1

   	email_list << get_mail_cityhall(url_list[url])    # et on les mets dans la même table

    end

    # puts email_list    ====> verif OK !!!!!

  return email_list

end

#get_mailing_list