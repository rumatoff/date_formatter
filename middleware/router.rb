class Router
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    return [404, headers, ['Unknown path']] if env['PATH_INFO'] != '/time'

    [status, headers, body]
  end
end
