class FreshProduct < Product
    include DiscountEligible
    attr_reader :expiration_date
    def initialize(properties)
        super
        if (properties != nil)
            indexofa = properties["expiration_date"]
            puts "index do expiration_date: #{indexofa}"
            self.expiration_date = indexofa
            self.days_to_expire
        else
            fail SimpleStore::Error, 'Nenhuma informação de expiração'
        end
        
    end
    def expiration_date=(expiration)
        puts "today: #{Date.today}, expiration_date: #{expiration}"
       if(expiration != nil && expiration != "")
            expiration_date = Date.parse(expiration)
           
            if(expiration_date >= Date.today)
                puts "Vai salvar na propertie a expiration_date #{expiration_date.strftime("%Y") + "-" + expiration_date.strftime("%m") + "-" + expiration_date.strftime("%d")}"
                e_date = expiration_date.strftime("%Y") + "-" + expiration_date.strftime("%m") + "-" + expiration_date.strftime("%d")
                @expiration_date = e_date
            else
                fail SimpleStore::Error, 'O produto não pode estar vencido'
            end
        else
            fail SimpleStore::Error, 'O produto não pode estar vencido'
        end
    end

end