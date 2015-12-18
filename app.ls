require! {
  os
  fs
  net
  colors
  ribcage
  
  underscore: _
  helpers: h
  bluebird: p
  
  child_process: { spawn }
    
  'lweb3/transports/server/nssocket': lwebServer
  'lweb3/protocols/query': queryProtocol
}

env =
  settings:
    port: 12312

ribcage.init env, ->
  env.log "init", {}, "init"


        
  env.server = new lwebServer.nssocketServer do
    port: env.settings.port
    name: 'ids'
    logger: env.logger.child tags: 'ids'

  env.server.on 'end', ->
    env.log 'server down' {}, 'error'
    process.exit 1

  env.server.subscribe true, (msg) ->
    console.log "GOT", msg

