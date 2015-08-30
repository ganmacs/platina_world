$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "platina_world"

PlatinaWorld::Logger =  PlatinaWorld::Loggers::Logger.new(nil)
PlatinaWorld::FileStatus = PlatinaWorld::Loggers::FileStatus.new(nil)
