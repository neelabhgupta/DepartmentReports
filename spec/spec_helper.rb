require 'simplecov'
require "factory_girl"
SimpleCov.start
require_relative '../lib/organization'
require_relative 'factories/managerial_department'
require_relative 'factories/procurement_department'
require_relative 'factories/color_inventory_report'
require_relative 'factories/avg_inventory_by_color_report'
