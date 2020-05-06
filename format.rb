class Format
  FORMATS = {
      year: ' %Y', month: ' %m -', day: ' %d -',
      hour: ' %H', min: ':%M', sec: ':%S '
  }.freeze

  SUPPORTED = %w[year month day hour min sec].freeze

  def initialize(req_format)
    @req_format = req_format
  end

  def to_a
    [requested_date]
  end

  private

  def requested_date
    time = ''
    @req_format.split(',').each { |format| time << FORMATS[format.to_sym] }
    Time.now.strftime(time)
  end
end
