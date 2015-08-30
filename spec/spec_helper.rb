$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "platina_world"

PlatinaWorld::Logger =  PlatinaWorld::Loggers::FileStatus.new(nil)
PlatinaWorld::FileStatus = PlatinaWorld::Loggers::Logger.new(nil)
