class DistanceService
  def initialize(starting_point:, destination:, client: default_client)
    @client = client
    @destination = destination
    @starting_point = starting_point
  end

  def call
    response = @client.calculate(destination: @destination, origin: @starting_point)
    puts response.body
    JSON.parse(response.body)['rows'][0]['elements'][0]['distance']['value'] / 1000
  end

  private
  
  def default_client
    DistanceMatrixClient.new
  end
end