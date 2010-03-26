APP_PATH = File.expand_path(File.dirname(__FILE__) + '/../..')

$LOAD_PATH.unshift("#{APP_PATH}/lib")

require 'aruba'
require 'fileutils'
require 'spec/expectations'
