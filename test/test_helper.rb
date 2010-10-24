require "test/unit/assertions"
require "protest"
require "mocha"
require "libvirt"
require 'libvirt_helper'

class Protest::TestCase
  include Libvirt::Assertions
  include Test::Unit::Assertions
  include Mocha::API

  # Get Mocha integrated properly into the tests
  alias :original_run :run
  def run(report)
    original_run(report)
    mocha_verify
  ensure
    mocha_teardown
  end
end

Protest.report_with(:progress)
