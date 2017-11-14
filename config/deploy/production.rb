set :stage, :production
server '139.59.16.151', user: 'deploy', roles: %w{app db web}
