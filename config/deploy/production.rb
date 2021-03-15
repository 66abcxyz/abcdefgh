set :stage, :production
server '65.0.76.41', user: 'deploy', roles: %w{app db web}

set :ssh_options, {
   keys: %w(/home/devil/keypair.pem),
   forward_agent: false,
   auth_methods: %w(publickey password)
 }
