# Documentation
# -------------
# http://www.sinatrarb.com/documentation.html
# http://www.rethinkdb.com/api/ruby/

require "rubygems"
require "sinatra"
require "rethinkdb"

include RethinkDB::Shortcuts

set :bind, '0.0.0.0'
set :port, 3000

get "/" do
  "Hello RethinkDB"
end
