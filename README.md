# nginx-amplify-cookbook
[![license](https://img.shields.io/github/license/aspyatkin/nginx-amplify-cookbook.svg?style=flat-square)]()  
Chef cookbook to install [Nginx Amplify](https://www.nginx.com/products/nginx-amplify/).

## Recipes

### nginx-amplify::default

Install or *upgrade* (default action) Nginx Amplify (it depends on `node['nginx-amplify']['upgrade']` attribute, which defaults to `false`) and configure agent application.

## Testing
Run `script/bootstrap` to install necessary Ruby Gems.

Run `script/test` to perform [KitchenCI](http://kitchen.ci/) tests.

## License
MIT @ [Alexander Pyatkin](https://github.com/aspyatkin)
