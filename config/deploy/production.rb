set :stage, :production
server '13.234.136.12', user: 'ubuntu', roles: %w{app db web}

set :ssh_options, {
   keys: %w(/home/devil/keypair.pem),
   forward_agent: false,
   auth_methods: %w(publickey password)
 }
   
