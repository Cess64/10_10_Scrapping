require_relative '../lib/01_scrap_cryptomoney'

describe "scrapper les noms et taux des cryptomonnaies d'une url" do

  describe "#get_name_crypto()" do

    it "scrappe le nom de ttes les crypto présentes sur le site" do
      expect(get_name_crypto()).to be_an_instance_of(Array)      # on a bien un array en sortie
  end
    it "scrappe le nom de ttes les crypto présentes sur le site" do
      expect(get_name_crypto().length).to be > (2000)           # on a au moins 2000 cryptomonnaies
  end
    it "scrappe le nom de ttes les crypto présentes sur le site" do
      expect(get_name_crypto()).to include("Bitcoin")              # Bitcoin en fait partie !
  end
end

  describe "#Get_rate_crypto()" do

    it "scrappe le taux de ttes les crypto présentes sur le site" do
      expect(Get_rate_crypto()).to be_an_instance_of(Array)      # on a bien un array en sortie
  end
    it "scrappe le taux de ttes les crypto présentes sur le site" do
      expect(Get_rate_crypto().length).to be > (2000)            # on a au moins 2000 taux
  end
end

end