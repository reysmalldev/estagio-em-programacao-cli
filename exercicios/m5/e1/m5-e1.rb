class M5E1
    NOTICIAS =  "09:55 - [política] Prefeito da Krakosia é eleito o melhor para economia\n"+
                "10:14 - [cotidiano] Cachorro salva dono de assalto\n"+
                "11:01 - [esporte] Seleção local de golfe se classifica para mundial\n"+
                "11:36 - [esporte] João da Silva Sauro é cortado da seleção de golfe\n"+
                "13:19 - [economia] Desemprego sobe para 12% no último mês\n"+
                "14:55 - [política] Lei de incentivo ao esporte é aprovada no senado às 10:20\n"+
                "16:13 - [economia] Cotação do dólar sobe 5% em uma semana\n"+
                "19:26 - [esporte] Liga nacional de basquete tem recorde de público\nt"
    
    def format_news
        new_str = ""
        NOTICIAS.each_line do |line|
            arr_res = line.match(/[ˆ\s+]?(\d{2}.\d{2})\s+-\s+\[(.+)\]\s+(.+)/)
            count = 0
            while (count < arr_res.size)
                count += 1
            end
            new_str += "#{arr_res[2]}: #{arr_res[3]} (#{arr_res[1]})\n"
        end
        puts new_str
        new_str
    end

    def find_economy_dollar_news
        matches = nil
        count = 0
        NOTICIAS.each_line do |line|
            match = line.match(/(.+dólar.+)/)
            
            if (match != nil)
                count += 1
            end
        end
        count 
    end

    def find_times
        arr_res = []
        NOTICIAS.each_line do |line|
            match = line.match(/[ˆ\s+]?(\d{2}.\d{2}).+/)
            if(match && match[1])
                arr_res.push(match[1])
            end
        end    
        arr_res
    end
end

teste  = M5E1.new
teste.format_news