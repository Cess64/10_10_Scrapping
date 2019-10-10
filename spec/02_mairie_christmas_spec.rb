require_relative '../lib/02_mairie_christmas'

describe "scrapper les mails de toutes les mairies d'un département" do

  describe "#get_cityhall_url" do
  	it "scrappe les urls de toutes les mairies du département" do
      expect(get_cityhall_url).to be_an_instance_of(Array)      # on a bien un array en sortie
  end
    it "scrappe les urls de toutes les mairies du département" do
      expect((get_cityhall_url).length).to be >=(185)           # on a 185 villes dans le val d'oise
  end
end

  describe "#get_mail_cityhall" do
  	it "chope l'adresse mail dans le site web de la ville" do
      expect(get_mail_cityhall("https://www.annuaire-des-mairies.com/95/avernes.html")).to eq ("mairie.avernes@orange.fr")     #verif Avernes
  end
 end

end