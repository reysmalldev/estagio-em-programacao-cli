OUTPUT = []

class Producer
  def initialize(queue)
    @queue = queue
  end

  def run
    # TODO: produce jobs
    # @queue.push(job)
    @queue.push(131)
    @queue.push(271)
    @queue.push(991)
    @queue.push(3102)
    @queue.push(8172)
    @queue.push(9102)
    @queue.push('END')
  end
end

class Consumer
  def initialize(queue)
    @queue = queue
  end

  def run
    while (job = @queue.pop) != 'END'
      consume(job)
    end
    @queue.push('END')
  end

  def consume(job)
    # TODO: execute the job
    res = job * 10
    OUTPUT.push(res)
  end
end

# Não é necessário adicionar o código de execução do Produtor e do Consumidor,
# basta implementar suas classes.
# O corretor deste exercício executará tanto o Produtor quanto o Consumidor.
