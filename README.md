### Market

### Application Setup

#### Clone repo

```sh
git clone git@github.com:andriiNyzhnik/market.git
```

#### Install the GEM dependencies

```sh
$ market ~> gem install bundler
$ market ~> bundle install
```

#### Setup Database

```sh
$ market ~> rake db:create
$ market ~> rake db:schema:load
$ market ~> rake db:seed
```

### Start the Application

Start the  application

```sh
$ market ~> rails s
```

## Tests

To run the RSpec tests:

```sh
$ market ~>  rspec
```

### Flow
```sh
# select user
user = User.first

# create purchase instance
pur = Orders::Purchase.new user

# add products to order
p = Product.first
pur.add_product! p

# calculate discount
pur.apply_discount! 
```
