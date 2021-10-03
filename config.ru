# config.ru

require 'rack'
require 'prometheus/middleware/collector'
require 'prometheus/middleware/exporter'

use Rack::Deflater
use Prometheus::Middleware::Collector
use Prometheus::Middleware::Exporter
prometheus = Prometheus::Client.registry
counter = Prometheus::Client::Counter.new(:total, docstring: '...', labels: [:service])

# increment the counter for a given label set
counter.increment(labels: { service: 'foo' })
prometheus.register(counter)

run ->(_) { [200, {'Content-Type' => 'text/html'}, ['OK']] }
