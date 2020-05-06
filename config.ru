require_relative 'middleware/router'
require_relative 'app'

use Router
run App.new
