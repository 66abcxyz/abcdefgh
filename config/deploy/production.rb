set :stage, :production
server '139.59.93.22', user: 'deploy', roles: %w{app db web}
