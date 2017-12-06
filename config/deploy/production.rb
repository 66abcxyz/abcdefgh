set :stage, :production
server '139.59.83.15', user: 'deploy', roles: %w{app db web}
