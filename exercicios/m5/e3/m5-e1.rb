# Existe algum IP que fez um número mais elevado de requisições do que os demais?
# Quantas requisições com status ALERTA ou ERRO, originadas de quaisquer IPs, existem no log?
# Qual o nome do arquivo (sem o caminho, somente o nome) acessado na requisção feita em 21/07/2016 às 00:17:50?
# Qual o motivo do erro da requisição feita em 31/07/2016 às 06:11:20?

# Exemplo de conteúdo do arquivo...
# 2016-06-26 23:57:17 - 243.171.198.248: ERRO | lib/docs/passwords.txt (USUÁRIO BLOQUEADO)
# 2016-06-26 23:58:00 - 253.251.79.74: OK | docs/linux.iso
# 2016-06-26 23:58:33 - 110.57.184.189: ALERTA | drivers/sheets.dll

class Save
    @@matches = []
    def initialize(ip)
        self.ip = ip
    end

    def self.increment_by_ip(ip)
        matching_one = @@matches.find {|item| item[:IP] == ip}[:Request_Count]
        if(matching_one != nil && matching_one >= 0)
            @@matches.find {|item| item[:IP] == ip}[:Request_Count] += 1
            true
        else
            false
        end
    end

    def self.exists_key?(ip_dado)
        if(@@matches.find {|item| item[:IP] == ip_dado})
            true
        else
            false
        end
    end
    def ip=(ip)
        if (ip != nil && ip != "")
            @@matches.push({:IP => ip, :Request_Count => 0})
        end
    end

    def self.matches
        @@matches
    end

    def self.sort

    end
end
def extract
    count_repeat = 0
    count_alert_or_error = 0
    archive_acessed_in = ""
    motivo_dela = ""
    File.foreach("./log-do-servidor.log") do |line|
        match = line.match(/(\d{4}-\d{2}-\d{2})\s(\d{2}:\d{2}:\d{2})\s+-\s+(\d{2,3}\.\d{2,3}\.\d{2,3}\.\d{2,3}):\s(\w+)\s\|\s([\w\d_\/\.]+)\s?\(?([^\(\)]+)?\)?/)
        if (match != nil)
            if (match[4] == "ALERTA" || match[4] == "ERRO")

                count_alert_or_error += 1
            end
            if(match[1] == ("2016-07-21") && match[2] == "00:17:50")
                splited = match[5].split("\/")
                archive_acessed_in = splited[(splited.size - 1)]
            end
            if(match[1] == "2016-07-31" && match[2] == "06:11:20")
                motivo_dela = match[(match.size - 1)]
            end
            if (!Save.exists_key?(match[3]))
                Save.new match[3]
            else
                Save.increment_by_ip(match[3])
            end
        end
        count_repeat += 1
    end
    Save.matches.sort_by{ |obj| obj[:Request_Count]}
    arr_sorted = Save.matches
    maior_qtd_requests = arr_sorted[0][:IP]
    File.open("./m5-e3.txt", "w") { |file| file.write("#{maior_qtd_requests}\n#{count_alert_or_error}\n#{archive_acessed_in}\n#{motivo_dela}")}
    puts "counts repeat: #{count_repeat}"
    puts "archive: #{archive_acessed_in}"
    puts "count: #{count_alert_or_error}"
    puts "motivo: #{motivo_dela}"
end

extract
