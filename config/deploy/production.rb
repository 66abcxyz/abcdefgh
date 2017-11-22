set :stage, :production
server '139.59.26.126', user: 'deploy', roles: %w{app db web}
