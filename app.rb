require_relative 'format.rb'
require_relative 'error.rb'

class App
  STATUS = { bad_request: 400, passed: 200 }.freeze

  def self.status(state)
    STATUS[state]
  end

  def self.headers
    { 'Content-Type' => 'text/plain' }
  end

  def call(env)
    @req = Rack::Request.new(env)
    @err = Error.new(@req)

    return @err.empty_request if @req[:format].nil?
    return @err.empty_query if @req[:format].strip.empty?
    return @err.unknown_format unless @err.unsupported.empty?

    [App.status(:passed), App.headers, body]
  end

  private

  def body
    Format.new(@req[:format]).to_a
  end
end
