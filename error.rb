class Error

  MES = { empty_req: 'Empty request',
          empty_query: 'Empty query string',
          unknown: 'Unknown time format:' }.freeze

  def initialize(req)
    @req_format = req[:format]
  end

  def empty_request
    [App.status(:bad_request), App.headers, [MES[:empty_req]]]
  end

  def empty_query
    [App.status(:bad_request), App.headers, [MES[:empty_query]]]
  end

  def unknown_format
    [App.status(:bad_request), App.headers, ["#{MES[:unknown]} #{unsupported}"]]
  end

  def unsupported
    @req_format.scan(/\w+/) - Format::SUPPORTED
  end
end
