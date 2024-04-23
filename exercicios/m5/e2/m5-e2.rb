class M5E2 
    def cpf_validation(cpf)
        match = cpf.match(/(\d{3}).?(\d{3}).?(\d{3})-?(\d{2})/)
        if (match != nil && match.size >= 4) 
            return true
        else
            return false
        end
    end

    def email_validation(email)
        if(email.include?('@'))
            match = email.match(/(?=[\w\d\.\_])([\w\d\._]+)(?=@[\w\d])(@[\w\d\.]+)/)
            if (match.size > 0)
                newEmail = ""
                count = 1
                while (count<match.size)
                    newEmail += match[count]
                    count += 1
                end
                puts email 
                puts newEmail
                if (match != nil)
                    if(newEmail == email) 
                        true
                    else 
                        false
                    end
                else 
                    false
                end
            end
        else
            return false
        end
    end

    def price_validation(price)
        if (price.match?(/R\$/))
            price.match?(/R\$\s(\d+\.\d+\,\d+|\d+\.\d+\.\d+\,\d+|\d+.)/)
            true
        else
            if (price.match?(/U\$\s(\d+\.\d+\,\d+|\d+\.\d+\.\d+\,\d+|\d+.)/))
                true
            else
                false
            end
        end 
    end
end

