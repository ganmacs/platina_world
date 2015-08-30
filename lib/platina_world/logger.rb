require "platina_world/loggers/file_status"
require "platina_world/loggers/logger"

module PlatinaWorld
  FileStatus = PlatinaWorld::Loggers::FileStatus.new($stdout)
  Logger = PlatinaWorld::Loggers::Logger.new($stdout)
end
