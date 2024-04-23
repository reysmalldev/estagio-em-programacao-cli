class DigitalProduct < Product
    include DiscountEligible
    attr_reader :expiration_date, :url, :days_to_expire
    def initialize(properties)
        super
        self.expiration_date = properties["expiration_date"]
        self.days_to_expire
        self.url = properties["url"]
    end

    def expiration_date=(expiration)
       if(expiration != nil && expiration != "")
            expiration_date = Date.parse(expiration)
            if(expiration_date >= Date.today)
                e_date = expiration_date.strftime("%Y") + "-" + expiration_date.strftime("%m") + "-" + expiration_date.strftime("%d")
                @expiration_date = e_date
                puts "expiration_date: #{Date.today}"
                puts "sla #{@expiration_date}"
                puts "days_to_expire: #{@days_to_expire}"
            else
                fail SimpleStore::Error, 'O produto não pode estar vencido'
            end
        else
            fail SimpleStore::Error, 'O produto não pode estar vencido'
        end
    end

    def price=(price)
        if (price != nil)
            if (price >= 0 && price != nil)
                if(self.has_discount?)
                    price = price.to_f
                    @price = price
                else
                    price = price.to_f
                    @price = price
                end
            else
                fail SimpleStore::Error, 'O preço do produto deve ser >= 0.0'
            end
        else
            fail SimpleStore::Error, 'O preço do produto deve ser >= 0.0'
        end
    end

    def url=(url)
        if(url != nil && url != "")
            puts "url: #{url} inde: "
            if(url.include?('http'))
                @url = url
            else 
                fail SimpleStore::Error, 'A URL do produto deve ser válida'
            end
        else 
            fail SimpleStore::Error, 'A URL do produto deve ser válida'
        end
    end
end