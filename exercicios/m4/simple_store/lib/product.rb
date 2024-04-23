class Product
    attr_reader :title, :price, :manufacturer, :barcode, :code
    attr_writer :barcode, :code
    def initialize(properties)
        if (self.class.name != nil && properties != nil)
            self.title = properties["title"]
            self.price = properties["price"]
            self.manufacturer = properties["manufacturer_code"]
            self.barcode = properties["barcode"]
            # TODO: code fix need be implemente
            self.generate_control_code(properties["manufacturer_code"], @barcode)
        else
            fail SimpleStore::Error, "Informe um Hash"
        end
    end
    
    def title=(title)
        puts "title : #{title}"
        if (title != nil && title != "")
            @title = title
        else    
            fail SimpleStore::Error, "O título do produto não pode ser vazio"
        end
    end
    
    def price=(price)

        if (price != nil)
            if (price >= 0 && price != nil)
                        price = price.to_f
                @price = price
            else
                fail SimpleStore::Error, 'O preço do produto deve ser >= 0.0'
            end
        else
            fail SimpleStore::Error, 'O preço do produto deve ser >= 0.0'
        end
    end


    def manufacturer=(manufacturer_code)
        # puts "#{manufacturer}"
        if(manufacturer_code != nil)
            manu = SimpleStore::AUTHORIZED_MANUFACTURERS
            manufacturer = manu.key(manufacturer_code)
            @manufacturer = manufacturer
        else
            fail SimpleStore::Error, "O fabricante não está autorizado"
        end
    end

    
    def generate_control_code(manufacturer_code, barcode)
        class_name = self.class.name
        if(manufacturer != nil && barcode != nil)
            teste = SimpleStore::PRODUCT_TYPES[class_name.to_sym]
            @code = "#{teste}--#{manufacturer_code}--#{barcode}"
        else
            fail SimpleStore::Error, "O fabricante não está autorizado"
        end
    end
end