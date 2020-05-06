class Router
  def initialize(app)
    @app = app
  end

  def call(env)
    return [404, App.headers, [Error::MES[:path_error]]] if env['PATH_INFO'] != '/time'

    status, headers, body = @app.call(env)
    [status, headers, body]
  end
end
