# nginx-amplify-cookbook
[![license](https://img.shields.io/github/license/aspyatkin/nginx-amplify-cookbook.svg?style=flat-square)]()  
Chef cookbook to install [Nginx Amplify](https://www.nginx.com/products/nginx-amplify/).

## Resources

### nginx_amplify_agent

```ruby
nginx_amplify_agent 'default' do
  api_key '...TOP SECRET...'
  stub_status 'http://127.0.0.1:8099/nginx_status'
  action :setup
end
```

## License
MIT @ [Alexander Pyatkin](https://github.com/aspyatkin)
