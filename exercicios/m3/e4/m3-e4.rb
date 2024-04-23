def factorial(n)
    #verificar se é maior que 1
    if (n > 1)
        # o processo é, multiplicar o numero por seu antecessor, até
        # que o antecessor seja 1
        calculo = 0
        count = 1
        while (count < n)
            if (count == 1)
                calculo = count * n        
            else 
                calculo = calculo * count
            end
            count += 1
        end
        calculo
    else 
        if (n >= 0)
            1
        end
    end
    # 5x4x3x2x1
end

def reverse(text)
    tamanho = text.size
    n = 0
    newStr = ""
    while (n <= tamanho)
        newStr = newStr + text[((tamanho) - n), 1]
        n += 1
    end
    return newStr
end

def sort(lista)
    n = 0
    while (n < lista.size)
        n2 = 0
        # repetir enquanto n for menor que o tamanho da lista
        while (n2 < lista.size)
            # comparar cada n com seu posteriores
            if (lista[n] < lista[n2])
                # se o n atual da lista for maior que o n posterior comparado
                tmp = lista[n2]
                lista[n2] = lista[n]
                lista[n] = tmp    
            end
            n2 +=1
        end
        n += 1
    end
    puts "#{lista}"
    lista
end

def upcase(textToUpcase)
    hash_map = {"text" => textToUpcase}
    hash_map["text"].upcase
end


sort([20, 1, 50, 3, 10, 1, 22, 23, 32, 2])
# if(n + 1 == lista.size)
#     break
# end
# if (lista[n] > lista[n +1])
#     temp = lista[n]
#     lista[n] = lista[n+1]
#     lista[n+1] = temp
# end